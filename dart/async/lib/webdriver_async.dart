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
part of pageloader.webdriver;

final _unsupportedSyncException = new PageLoaderException(
    'Sync operations unsupported unless page object loading is synchronous');

abstract class _BaseWebDriverPageLoaderElementAsync
    implements WebDriverPageLoaderElement {
  async_wd.SearchContext get context;

  @override
  final WebDriverPageLoader loader;

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

  factory _BaseWebDriverPageLoaderElementAsync(
      async_wd.SearchContext context, WebDriverPageLoader loader) {
    if (context is async_wd.WebDriver) {
      return new _WebDriverPageLoaderElementAsync(context, loader);
    }
    if (context is async_wd.WebElement) {
      return new _WebElementPageLoaderElementAsync(context, loader);
    }
    throw new PageLoaderException(
        'Unable to create PageLoaderElement for $context');
  }

  _BaseWebDriverPageLoaderElementAsync._(this.loader,
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
      throw _unsupportedSyncException;

  Stream<WebDriverPageLoaderElement> _fromContextStream(Stream contexts) =>
      contexts.map((e) => new _BaseWebDriverPageLoaderElementAsync(e, loader));

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
  bool get isFocusedSync => throw _unsupportedSyncException;

  @override
  Stream<String> get classes async* {}

  @override
  List<String> get classesSync => throw _unsupportedSyncException;

  @override
  Future<Rectangle> getBoundingClientRect() => throw new PageLoaderException(
      '$runtimeType.getBoundingClientRect() is unsupported');

  @override
  Rectangle getBoundingClientRectSync() => throw _unsupportedSyncException;

  @override
  Future<Rectangle> get offset =>
      throw new PageLoaderException('$runtimeType.offset is unsupported');

  @override
  Rectangle get offsetSync => throw _unsupportedSyncException;

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
  PageLoaderElement get shadowRootSync => throw _unsupportedSyncException;

  @override
  Future blur({bool sync: true}) async =>
      throw new PageLoaderException('$runtimeType.blur() is unsupported');

  @override
  Future focus({bool sync: true}) async =>
      throw new PageLoaderException('$runtimeType.focus() is unsupported');
}

class _WebDriverMouseAsync implements PageLoaderMouse {
  final WebDriverPageLoader loader;
  async_wd.WebDriver get driver => loader.driver;

  _WebDriverMouseAsync(this.loader);

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
        if (eventTarget == null &&
            element is _WebElementPageLoaderElementAsync) {
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
            (eventTarget as _WebElementPageLoaderElementAsync).context,
            type,
            button?.value
          ]);
}

class _WebElementPageLoaderElementAsync
    extends _BaseWebDriverPageLoaderElementAsync {
  final async_wd.WebElement context;

  _WebElementPageLoaderElementAsync(
      async_wd.WebElement context, WebDriverPageLoader loader)
      : this.context = context,
        super._(loader,
            attributes: new _ElementAttributesAsync(context),
            computedStyle: new _ElementComputedStyleAsync(context),
            properties: new _ElementPropertiesAsync(context),
            seleniumAttributes: new _ElementSeleniumAttributesAsync(context),
            style: new _ElementStyleAsync(context));

  @override
  Future<WebDriverPageLoaderElement> get shadowRoot async {
    if (loader.useShadowDom) {
      if ((await context.driver
          .execute('return arguments[0].shadowRoot != null;', [context]))) {
        return new _ShadowRootPageLoaderElementAsync(context, loader);
      }
      throw new PageLoaderException('$this does not have a shadowRoot');
    }
    return this;
  }

  @override
  WebDriverPageLoaderElement get shadowRootSync =>
      throw _unsupportedSyncException;

  @override
  Future<String> get name => context.name;

  @override
  String get nameSync => throw _unsupportedSyncException;

  @override
  Future<String> get innerText async => (await context.driver
          .execute('return arguments[0].textContent;', [context]))
      .trim();

  @override
  String get innerTextSync => throw _unsupportedSyncException;

  @override
  Future<String> get visibleText => context.text;

  @override
  String get visibleTextSync => throw _unsupportedSyncException;

  @override
  Future<bool> get displayed => context.displayed;

  @override
  bool get displayedSync => throw _unsupportedSyncException;

  @override
  Stream<String> get classes async* {
    String classAttr = await seleniumAttributes['class'];
    if (classAttr != null && classAttr != '') {
      yield* new Stream.fromIterable(classAttr.split(' '));
    }
  }

  @override
  List<String> get classesSync => throw _unsupportedSyncException;

  @override
  Future<Rectangle> getBoundingClientRect() async {
    Map<String, num> rect = await context.driver
        .execute('return arguments[0].getBoundingClientRect();', [context]);
    return new Rectangle<num>(
        rect['left'], rect['top'], rect['width'], rect['height']);
  }

  @override
  Rectangle getBoundingClientRectSync() => throw _unsupportedSyncException;

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
  Rectangle get offsetSync => throw _unsupportedSyncException;

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

class _WebDriverPageLoaderElementAsync
    extends _BaseWebDriverPageLoaderElementAsync {
  final async_wd.WebDriver context;

  _WebDriverPageLoaderElementAsync(
      async_wd.WebDriver context, WebDriverPageLoader loader)
      : this.context = context,
        super._(loader, properties: new _DocumentPropertiesAsync(context));

  @override
  Future<String> get name async => '__document__';

  @override
  String get nameSync => throw _unsupportedSyncException;

  @override
  Future type(String keys,
          {bool sync: true, bool focusBefore: true, bool blurAfter: true}) =>
      loader.executeSynced(() => context.keyboard.sendKeys(keys), sync);

  @override
  Future<bool> get displayed async => true;

  @override
  bool get displayedSync => throw _unsupportedSyncException;

  @override
  Future<String> get innerText async =>
      (await context.execute('return arguments[0].textContent;', [await _root]))
          .trim();

  @override
  String get innerTextSync => throw _unsupportedSyncException;

  @override
  Future<String> get visibleText async => (await _root).text;

  @override
  String get visibleTextSync => throw _unsupportedSyncException;

  Future<async_wd.WebElement> get _root =>
      context.findElement(const async_wd.By.cssSelector(':root'));
}

class _ShadowRootPageLoaderElementAsync
    extends _BaseWebDriverPageLoaderElementAsync {
  final async_wd.WebElement context;

  _ShadowRootPageLoaderElementAsync(
      async_wd.WebElement context, WebDriverPageLoader loader)
      : this.context = context,
        super._(loader, properties: new _ShadowRootPropertiesAsync(context)) {
    assert(loader.useShadowDom);
  }

  @override
  Future<String> get name async => '__shadow_root__';

  @override
  String get nameSync => throw _unsupportedSyncException;

  @override
  Future<String> get visibleText => context.text;

  @override
  String get visibleTextSync => throw _unsupportedSyncException;

  @override
  Future<String> get innerText async => (await _execute('.textContent')).trim();

  @override
  String get innerTextSync => throw _unsupportedSyncException;

  @override
  Future<bool> get displayed => context.displayed;

  @override
  bool get displayedSync => throw _unsupportedSyncException;

  @override
  Stream<WebDriverPageLoaderElement> getElementsByCss(String selector) async* {
    yield* _fromContextStream(new Stream.fromIterable(
        await _execute('.querySelectorAll("$selector")')));
  }

  Future _execute(String script) {
    return context.driver
        .execute('return arguments[0].shadowRoot$script;', [context]);
  }
}

@deprecated
class _ElementSeleniumAttributesAsync extends PageLoaderAttributes {
  final async_wd.WebElement _node;

  _ElementSeleniumAttributesAsync(this._node);

  @override
  Future<String> operator [](String name) => _node.attributes[name];

  @override
  String getAttribute(String name) => throw _unsupportedSyncException;
}

class _ElementAttributesAsync extends PageLoaderAttributes {
  final async_wd.WebElement _node;

  _ElementAttributesAsync(this._node);

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
  String getAttribute(String name) => throw _unsupportedSyncException;
}

class _ElementPropertiesAsync extends PageLoaderAttributes {
  final async_wd.WebElement _node;

  _ElementPropertiesAsync(this._node);

  @override
  Future<String> operator [](String name) async =>
      (await _node.driver.execute('return arguments[0]["$name"];', [_node]))
          ?.toString();

  @override
  String getAttribute(String name) => throw _unsupportedSyncException;
}

class _ElementComputedStyleAsync extends PageLoaderAttributes {
  final async_wd.WebElement _node;

  _ElementComputedStyleAsync(this._node);

  @override
  Future<String> operator [](String name) async => (await _node.driver.execute(
          'return window.getComputedStyle(arguments[0]).${_cssPropName(name)};',
          [_node]))
      ?.toString();

  @override
  String getAttribute(String name) => throw _unsupportedSyncException;
}

class _ElementStyleAsync extends PageLoaderAttributes {
  final async_wd.WebElement _node;

  _ElementStyleAsync(this._node);

  @override
  Future<String> operator [](String name) async => (await _node.driver
          .execute('return arguments[0].style.${_cssPropName(name)};', [_node]))
      ?.toString();

  @override
  String getAttribute(String name) => throw _unsupportedSyncException;
}

/// Convert hyphenated-properties to camelCase.
String _cssPropName(String name) => name.splitMapJoin(new RegExp(r'-(\w)'),
    onMatch: (m) => m.group(1).toUpperCase(), onNonMatch: (m) => m);

class _DocumentPropertiesAsync extends PageLoaderAttributes {
  final async_wd.WebDriver _driver;

  _DocumentPropertiesAsync(this._driver);

  @override
  Future<String> operator [](String name) async =>
      (await _driver.execute('return document["$name"];', const []))
          ?.toString();

  @override
  String getAttribute(String name) => throw _unsupportedSyncException;
}

class _ShadowRootPropertiesAsync extends PageLoaderAttributes {
  final async_wd.WebElement _node;

  _ShadowRootPropertiesAsync(this._node);

  @override
  Future<String> operator [](String name) async => (await _node.driver
          .execute('return arguments[0].shadowRoot.["$name"];', [_node]))
      ?.toString();

  @override
  String getAttribute(String name) => throw _unsupportedSyncException;
}
