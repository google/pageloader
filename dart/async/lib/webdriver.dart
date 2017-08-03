// Copyright 2014 Google Inc. All rights reserved.
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// PageLoader WebDriver provides the necessary bindings to support using
/// PageLoader in WebDriver-based tests.
library pageloader.webdriver;

import 'dart:async';
import 'dart:math';

import 'package:webdriver/async_core.dart' as async_wd;
import 'package:webdriver/sync_core.dart' as sync_wd;

import 'src/core.dart';
import 'src/interfaces.dart';

export 'src/interfaces.dart';

sync_wd.WebDriver _fromAsyncDriver(async_wd.WebDriver driver) =>
    sync_wd.fromExistingSession(driver.id, uri: driver.uri);

class WebDriverPageLoader extends BasePageLoader {
  async_wd.WebDriver get driver => syncDriver.asyncDriver;
  final sync_wd.WebDriver syncDriver;

  WebDriverPageLoaderElement _globalContext;
  var _mouse;
  @override
  _WebDriverMouse get mouse => _mouse;

  WebDriverPageLoader(async_wd.SearchContext globalContext,
      {bool useShadowDom: true,
      SyncedExecutionFn executeSyncedFn: noOpExecuteSyncedFn})
      : this.syncDriver = _fromAsyncDriver(globalContext.driver),
        super(useShadowDom: useShadowDom, executeSyncedFn: executeSyncedFn) {
    this._mouse = new _WebDriverMouse(this);
    this._globalContext = new WebDriverPageLoaderElement(globalContext, this);
  }

  WebDriverPageLoader.sync(sync_wd.SearchContext globalContext,
      {bool useShadowDom: true,
      SyncedExecutionFn executeSyncedFn: noOpExecuteSyncedFn})
      : this.syncDriver = globalContext.driver,
        super(useShadowDom: useShadowDom, executeSyncedFn: executeSyncedFn) {
    this._mouse = new _WebDriverMouse(this);
    this._globalContext =
        new WebDriverPageLoaderElement.sync(globalContext, this);
  }

  @override
  WebDriverPageLoaderElement get globalContext => _globalContext;

  @override
  Future<T> getInstance<T>(Type type, [dynamic context]) async {
    if (context != null) {
      if (context is async_wd.SearchContext) {
        context = new WebDriverPageLoaderElement(context, this);
      } else if (context is! WebDriverPageLoaderElement) {
        throw new PageLoaderException('Invalid context: $context');
      }
    }
    return getInstanceInternal(type, context);
  }
}

class _WebDriverMouse implements PageLoaderMouse {
  final WebDriverPageLoader loader;
  async_wd.WebDriver get driver => loader.driver;

  _WebDriverMouse(this.loader);

  @override
  Future down(MouseButton button,
          {PageLoaderElement eventTarget, bool sync: true}) =>
      loader.executeSynced(() {
        if (eventTarget == null) {
          return driver.mouse.down(button);
        }
        return _fireEvent(eventTarget, 'mousedown', button);
      }, sync);

  @override
  Future moveTo(PageLoaderElement element, int xOffset, int yOffset,
          {PageLoaderElement eventTarget, bool sync: true}) =>
      loader.executeSynced(() {
        if (eventTarget == null && element is _WebElementPageLoaderElement) {
          return driver.mouse.moveTo(
              element: element.context, xOffset: xOffset, yOffset: yOffset);
        }
        return _fireEvent(eventTarget, 'mousemove');
      }, sync);

  @override
  Future up(MouseButton button,
          {PageLoaderElement eventTarget, bool sync: true}) =>
      loader.executeSynced(() {
        if (eventTarget == null) {
          return driver.mouse.up(button);
        }
        return _fireEvent(eventTarget, 'mouseup', button);
      }, sync);

  Future _fireEvent(PageLoaderElement eventTarget, String type,
          [MouseButton button]) =>
      driver.execute(
          "arguments[0].dispatchEvent(new MouseEvent(arguments[1], "
          "{'button' : arguments[2]}));",
          [
            (eventTarget as _WebElementPageLoaderElement).context,
            type,
            button?.value
          ]);
}

abstract class WebDriverPageLoaderElement implements PageLoaderElement {
  async_wd.SearchContext get context;
  sync_wd.SearchContext get syncContext;

  @override
  final WebDriverPageLoader loader;

  sync_wd.WebDriver _syncDriver;

  sync_wd.WebDriver get syncDriver {
    if (_syncDriver == null) {
      _syncDriver = _fromAsyncDriver(context.driver);
    }
    return _syncDriver;
  }

  @override
  final PageLoaderAttributes attributes;

  @override
  final PageLoaderAttributes computedStyle;

  @override
  final PageLoaderAttributes properties;

  @override
  @deprecated
  final PageLoaderAttributes seleniumAttributes;

  @override
  final PageLoaderAttributes style;

  factory WebDriverPageLoaderElement(
      async_wd.SearchContext context, WebDriverPageLoader loader) {
    if (context is async_wd.WebDriver) {
      return new _WebDriverPageLoaderElement(context, loader);
    }
    if (context is async_wd.WebElement) {
      return new _WebElementPageLoaderElement(context, loader);
    }
    throw new PageLoaderException(
        'Unable to create PageLoaderElement for $context');
  }

  factory WebDriverPageLoaderElement.sync(
          sync_wd.SearchContext context, WebDriverPageLoader loader) {
    if (context is sync_wd.WebDriver) {
      return new _WebDriverPageLoaderElement.sync(context, loader);
    }
    if (context is sync_wd.WebElement) {
      return new _WebElementPageLoaderElement.sync(context, loader);
    }
    throw new PageLoaderException(
        'Unable to create PageLoaderElement for $context');
  }

  WebDriverPageLoaderElement._(this.loader,
      {this.attributes: const _EmptyAttributes(),
      this.computedStyle: const _EmptyAttributes(),
      this.properties: const _EmptyAttributes(),
      this.seleniumAttributes: const _EmptyAttributes(),
      this.style: const _EmptyAttributes()});

  @override
  Stream<WebDriverPageLoaderElement> getElementsByCss(String selector) =>
      _fromContextStream(
          context.findElements(new async_wd.By.cssSelector(selector)));

  @override
  List<WebDriverPageLoaderElement> getElementsByCssSync(String selector) =>
      syncContext
          .findElements(new sync_wd.By.cssSelector(selector))
          .map((e) => new WebDriverPageLoaderElement.sync(syncContext, loader))
          .toList();

  Stream<WebDriverPageLoaderElement> _fromContextStream(Stream contexts) =>
      contexts.map((e) => new WebDriverPageLoaderElement(e, loader));

  @override
  int get hashCode => context.hashCode;

  @override
  bool operator ==(Object other) =>
      other != null &&
      other.runtimeType == runtimeType &&
      (other as WebDriverPageLoaderElement).context == context &&
      (other as WebDriverPageLoaderElement).loader == loader;

  @override
  String toString() => '$runtimeType<${context.toString()}>';

  @override
  Future<bool> get isFocused async {
    if (context is async_wd.WebElement) {
      return (await context.driver.activeElement) == context;
    }
    throw new PageLoaderException('$runtimeType.isFocused is unsupported');
  }

  @override
  bool get isFocusedSync {
    if (syncContext is sync_wd.WebElement) {
      return (syncContext.driver.activeElement) == syncContext;
    }
    throw new PageLoaderException('$runtimeType.isFocusedSync is unsupported');
  }

  @override
  Stream<String> get classes async* {}

  @override
  List<String> get classesSync => [];

  @override
  Future<Rectangle> getBoundingClientRect() => throw new PageLoaderException(
      '$runtimeType.getBoundingClientRect() is unsupported');

  @override
  Rectangle getBoundingClientRectSync() => throw new PageLoaderException(
      '$runtimeType.getBoundingClientRectSync() is unsupported');

  @override
  Future<Rectangle> get offset =>
      throw new PageLoaderException('$runtimeType.offset is unsupported');

  @override
  Rectangle get offsetSync =>
      throw new PageLoaderException('$runtimeType.offsetSync is unsupported');

  @override
  Future clear(
          {bool sync: true,
          bool focusBefore: true,
          bool blurAfter: true}) async =>
      throw new PageLoaderException('$runtimeType.clear() is unsupported');

  @override
  Future click({bool sync: true}) async =>
      throw new PageLoaderException('$runtimeType.click() is unsupported');

  @override
  Future type(String keys,
          {bool sync: true,
          bool focusBefore: true,
          bool blurAfter: true}) async =>
      throw new PageLoaderException('$runtimeType.type() is unsupported');

  @override
  Future<PageLoaderElement> get shadowRoot async =>
      throw new PageLoaderException('$runtimeType.shadowRoot is unsupported');

  @override
  PageLoaderElement get shadowRootSync => throw new PageLoaderException(
      '$runtimeType.shadowRootSync is unsupported');

  @override
  Future blur({bool sync: true}) async =>
      throw new PageLoaderException('$runtimeType.blur() is unsupported');

  @override
  Future focus({bool sync: true}) async =>
      throw new PageLoaderException('$runtimeType.focus() is unsupported');
}

class _WebElementPageLoaderElement extends WebDriverPageLoaderElement {
  final async_wd.WebElement context;
  final sync_wd.WebElement syncContext;

  _WebElementPageLoaderElement(
      async_wd.WebElement context, WebDriverPageLoader loader)
      : this.context = context,
        this.syncContext = null,
        super._(loader,
            attributes: new _ElementAttributes(context),
            computedStyle: new _ElementComputedStyle(context),
            properties: new _ElementProperties(context),
            seleniumAttributes: new _ElementSeleniumAttributes(context),
            style: new _ElementStyle(context));

  _WebElementPageLoaderElement.sync(
      sync_wd.WebElement context, WebDriverPageLoader loader)
      : this.context = null,
        this.syncContext = context,
        super._(loader,
            attributes: new _ElementAttributes.sync(context),
            computedStyle: new _ElementComputedStyle.sync(context),
            properties: new _ElementProperties.sync(context),
            seleniumAttributes: new _ElementSeleniumAttributes.sync(context),
            style: new _ElementStyle.sync(context));

  @override
  Future<WebDriverPageLoaderElement> get shadowRoot async {
    if (loader.useShadowDom) {
      if ((await context.driver
          .execute('return arguments[0].shadowRoot != null;', [context]))) {
        return new _ShadowRootPageLoaderElement(context, loader);
      }
      throw new PageLoaderException('$this does not have a shadowRoot');
    }
    return this;
  }

  @override
  WebDriverPageLoaderElement get shadowRootSync {
    if (loader.useShadowDom) {
      if ((syncContext.driver
          .execute('return arguments[0].shadowRoot != null;', [syncContext]))) {
        return new _ShadowRootPageLoaderElement.sync(syncContext, loader);
      }
      throw new PageLoaderException('$this does not have a shadowRoot');
    }
    return this;
  }

  @override
  Future<String> get name => context.name;

  @override
  String get nameSync => syncContext.name;

  @override
  Future<String> get innerText async => (await context.driver
          .execute('return arguments[0].textContent;', [context]))
      .trim();

  @override
  String get innerTextSync => (syncContext.driver
          .execute('return arguments[0].textContent;', [syncContext]))
      .trim();

  @override
  Future<String> get visibleText => context.text;

  @override
  String get visibleTextSync => syncContext.text;

  @override
  Future<bool> get displayed => context.displayed;

  @override
  bool get displayedSync => syncContext.displayed;

  @override
  Stream<String> get classes async* {
    String classAttr = await seleniumAttributes['class'];
    if (classAttr != null && classAttr != '') {
      yield* new Stream.fromIterable(classAttr.split(' '));
    }
  }

  @override
  List<String> get classesSync {
    String classAttr = seleniumAttributes.getAttribute('class');
    if (classAttr != null && classAttr != '') {
      return classAttr.split(' ');
    }
    return [];
  }

  @override
  Future<Rectangle> getBoundingClientRect() async {
    Map<String, num> rect = await context.driver
        .execute('return arguments[0].getBoundingClientRect();', [context]);
    return new Rectangle<num>(
        rect['left'], rect['top'], rect['width'], rect['height']);
  }

  @override
  Rectangle getBoundingClientRectSync() {
    Map<String, num> rect = syncContext.driver
        .execute('return arguments[0].getBoundingClientRect();', [syncContext]);
    return new Rectangle<num>(
        rect['left'], rect['top'], rect['width'], rect['height']);
  }

  @override
  Future<Rectangle> get offset async {
    Map<String, num> rect = await context.driver.execute(
        '''return {
          left: arguments[0].offsetLeft,
          top: arguments[0].offsetTop,
          width: arguments[0].offsetWidth,
          height: arguments[0].offsetHeight
        }''',
        [context]);
    return new Rectangle<num>(
        rect['left'], rect['top'], rect['width'], rect['height']);
  }

  @override
  Rectangle get offsetSync {
    Map<String, num> rect = syncContext.driver.execute(
        '''return {
          left: arguments[0].offsetLeft,
          top: arguments[0].offsetTop,
          width: arguments[0].offsetWidth,
          height: arguments[0].offsetHeight
        }''',
        [syncContext]);
    return new Rectangle<num>(
        rect['left'], rect['top'], rect['width'], rect['height']);
  }

  @override
  Future clear(
          {bool sync: true, bool focusBefore: true, bool blurAfter: true}) =>
      loader.executeSynced(() async {
        if (focusBefore) await focus(sync: false);
        await context.clear();
        if (blurAfter) await blur(sync: false);
      }, sync);

  @override
  Future click({bool sync: true}) => loader.executeSynced(context.click, sync);

  @override
  Future type(String keys,
          {bool sync: true, bool focusBefore: true, bool blurAfter: true}) =>
      loader.executeSynced(() async {
        if (focusBefore) await focus(sync: false);
        await context.sendKeys(keys);
        if (blurAfter) await blur(sync: false);
      }, sync);

  @override
  Future blur({bool sync: true}) => loader.executeSynced(
      () => context.driver.execute('arguments[0].blur();', [context]), sync);

  @override
  Future focus({bool sync: true}) => loader.executeSynced(
      () => context.driver.execute('arguments[0].focus();', [context]), sync);
}

class _WebDriverPageLoaderElement extends WebDriverPageLoaderElement {
  final async_wd.WebDriver context;
  final sync_wd.WebDriver syncContext;

  _WebDriverPageLoaderElement(
      async_wd.WebDriver context, WebDriverPageLoader loader)
      : this.context = context,
        this.syncContext = null,
        super._(loader, properties: new _DocumentProperties(context));

  _WebDriverPageLoaderElement.sync(
      sync_wd.WebDriver context, WebDriverPageLoader loader)
      : this.context = null,
        this.syncContext = context,
        super._(loader, properties: new _DocumentProperties.sync(context));

  @override
  Future<String> get name async => '__document__';

  @override
  String get nameSync => '__document__';

  @override
  Future type(String keys,
          {bool sync: true, bool focusBefore: true, bool blurAfter: true}) =>
      loader.executeSynced(() => context.keyboard.sendKeys(keys), sync);

  @override
  Future<bool> get displayed async => true;

  @override
  bool get displayedSync => true;

  @override
  Future<String> get innerText async =>
      (await context.execute('return arguments[0].textContent;', [await _root]))
          .trim();

  @override
  String get innerTextSync =>
      (syncContext.execute('return arguments[0].textContent;', [_rootSync])).trim();

  @override
  Future<String> get visibleText async => (await _root).text;

  @override
  String get visibleTextSync => _rootSync.text;

  Future<async_wd.WebElement> get _root =>
      context.findElement(const async_wd.By.cssSelector(':root'));

  sync_wd.WebElement get _rootSync =>
      syncContext.findElement(const sync_wd.By.cssSelector(':root'));
}

class _ShadowRootPageLoaderElement extends WebDriverPageLoaderElement {
  final async_wd.WebElement context;
  final sync_wd.WebElement syncContext;

  _ShadowRootPageLoaderElement(
      async_wd.WebElement context, WebDriverPageLoader loader)
      : this.context = context,
        this.syncContext = null,
        super._(loader, properties: new _ShadowRootProperties(context)) {
    assert(loader.useShadowDom);
  }

  _ShadowRootPageLoaderElement.sync(
      sync_wd.WebElement context, WebDriverPageLoader loader)
      : this.context = null,
        this.syncContext = context,
        super._(loader, properties: new _ShadowRootProperties.sync(context)) {
    assert(loader.useShadowDom);
  }

  @override
  Future<String> get name async => '__shadow_root__';

  @override
  String get nameSync => '__shadow_root__';

  @override
  Future<String> get visibleText => context.text;

  @override
  String get visibleTextSync => syncContext.text;

  @override
  Future<String> get innerText async => (await _execute('.textContent')).trim();

  @override
  String get innerTextSync => _executeSync('.textContent').trim();

  @override
  Future<bool> get displayed => context.displayed;

  @override
  bool get displayedSync => syncContext.displayed;

  @override
  Stream<WebDriverPageLoaderElement> getElementsByCss(String selector) async* {
    yield* _fromContextStream(new Stream.fromIterable(
        await _execute('.querySelectorAll("$selector")')));
  }

  Future _execute(String script) {
    return context.driver
        .execute('return arguments[0].shadowRoot$script;', [context]);
  }

  dynamic _executeSync(String script) {
    return syncContext.driver
        .execute('return arguments[0].shadowRoot$script;', [syncContext]);
  }
}

@deprecated
class _ElementSeleniumAttributes extends PageLoaderAttributes {
  final async_wd.WebElement _node;
  final sync_wd.WebElement _nodeSync;

  _ElementSeleniumAttributes(this._node) : this._nodeSync = null;
  _ElementSeleniumAttributes.sync(this._nodeSync) : this._node = null;

  @override
  Future<String> operator [](String name) => _node.attributes[name];

  @override
  String getAttribute(String name) => _nodeSync.attributes[name];
}

class _ElementAttributes extends PageLoaderAttributes {
  final async_wd.WebElement _node;
  final sync_wd.WebElement _nodeSync;

  _ElementAttributes(this._node) : this._nodeSync = null;
  _ElementAttributes.sync(this._nodeSync) : this._node = null;

  @override
  Future<String> operator [](String name) async => (await _node.driver.execute(
          """
var attr = arguments[0].attributes["$name"];
if(attr) {
  return attr.value;
}
return null;
""",
          [_node]))
      ?.toString();

  @override
  String getAttribute(String name) => (_nodeSync.driver.execute(
          """
var attr = arguments[0].attributes["$name"];
if(attr) {
  return attr.value;
}
return null;
""",
          [_nodeSync]))
      ?.toString();
}

class _ElementProperties extends PageLoaderAttributes {
  final async_wd.WebElement _node;
  final sync_wd.WebElement _nodeSync;

  _ElementProperties(this._node) : this._nodeSync = null;
  _ElementProperties.sync(this._nodeSync) : this._node = null;

  @override
  Future<String> operator [](String name) async =>
      (await _node.driver.execute('return arguments[0]["$name"];', [_node]))
          ?.toString();

  @override
  String getAttribute(String name) =>
      (_nodeSync.driver.execute('return arguments[0]["$name"];', [_nodeSync]))
          ?.toString();
}

class _ElementComputedStyle extends PageLoaderAttributes {
  final async_wd.WebElement _node;
  final sync_wd.WebElement _nodeSync;

  _ElementComputedStyle(this._node) : this._nodeSync = null;
  _ElementComputedStyle.sync(this._nodeSync) : this._node = null;

  @override
  Future<String> operator [](String name) async => (await _node.driver.execute(
          'return window.getComputedStyle(arguments[0]).${_cssPropName(name)};',
          [_node]))
      ?.toString();

  @override
  String getAttribute(String name) => (_nodeSync.driver.execute(
          'return window.getComputedStyle(arguments[0]).${_cssPropName(name)};',
          [_nodeSync]))
      ?.toString();
}

class _ElementStyle extends PageLoaderAttributes {
  final async_wd.WebElement _node;
  final sync_wd.WebElement _nodeSync;

  _ElementStyle(this._node) : this._nodeSync = null;
  _ElementStyle.sync(this._nodeSync) : this._node = null;

  @override
  Future<String> operator [](String name) async => (await _node.driver
          .execute('return arguments[0].style.${_cssPropName(name)};', [_node]))
      ?.toString();

  @override
  String getAttribute(String name) => (_nodeSync.driver.execute(
          'return arguments[0].style.${_cssPropName(name)};', [_nodeSync]))
      ?.toString();
}

/// Convert hyphenated-properties to camelCase.
String _cssPropName(String name) => name.splitMapJoin(new RegExp(r'-(\w)'),
    onMatch: (m) => m.group(1).toUpperCase(), onNonMatch: (m) => m);

class _EmptyAttributes implements PageLoaderAttributes {
  const _EmptyAttributes();

  @override
  Future<String> operator [](String name) async => null;

  @override
  String getAttribute(String name) => null;
}

class _DocumentProperties extends PageLoaderAttributes {
  final async_wd.WebDriver _driver;
  final sync_wd.WebDriver _driverSync;

  _DocumentProperties(this._driver) : this._driverSync = null;
  _DocumentProperties.sync(this._driverSync) : this._driver = null;

  @override
  Future<String> operator [](String name) async =>
      (await _driver.execute('return document["$name"];', const []))
          ?.toString();

  @override
  String getAttribute(String name) =>
      (_driverSync.execute('return document["$name"];', const []))?.toString();
}

class _ShadowRootProperties extends PageLoaderAttributes {
  final async_wd.WebElement _node;
  final sync_wd.WebElement _nodeSync;

  _ShadowRootProperties(this._node) : this._nodeSync = null;
  _ShadowRootProperties.sync(this._nodeSync) : this._node = null;

  @override
  Future<String> operator [](String name) async => (await _node.driver
          .execute('return arguments[0].shadowRoot.["$name"];', [_node]))
      ?.toString();

  @override
  String getAttribute(String name) => (_nodeSync.driver
          .execute('return arguments[0].shadowRoot.["$name"];', [_nodeSync]))
      ?.toString();
}
