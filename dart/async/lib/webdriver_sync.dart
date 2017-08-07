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

abstract class _BaseWebDriverPageLoaderElementSync
    implements WebDriverPageLoaderElement {
  @override
  async_wd.SearchContext get context => _syncContext.asyncContext;

  sync_wd.SearchContext get _syncContext;

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

  factory _BaseWebDriverPageLoaderElementSync(
      sync_wd.SearchContext context, WebDriverPageLoader loader) {
    if (context is sync_wd.WebDriver) {
      return new _WebDriverPageLoaderElementSync(context, loader);
    }
    if (context is sync_wd.WebElement) {
      return new _WebElementPageLoaderElementSync(context, loader);
    }
    throw new PageLoaderException(
        'Unable to create PageLoaderElement for $context');
  }

  _BaseWebDriverPageLoaderElementSync._(this.loader,
      {this.attributes: const _EmptyAttributes(),
      this.computedStyle: const _EmptyAttributes(),
      this.properties: const _EmptyAttributes(),
      this.seleniumAttributes: const _EmptyAttributes(),
      this.style: const _EmptyAttributes()});

  @override
  Stream<WebDriverPageLoaderElement> getElementsByCss(String selector) =>
      _fromList(getElementsByCssSync(selector));

  @override
  List<WebDriverPageLoaderElement> getElementsByCssSync(String selector) =>
      _syncContext
          .findElements(new sync_wd.By.cssSelector(selector))
          .map((e) => new _BaseWebDriverPageLoaderElementSync(e, loader))
          .toList();

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
  Future<bool> get isFocused async => isFocusedSync;

  @override
  bool get isFocusedSync {
    if (_syncContext is sync_wd.WebElement) {
      return (_syncContext.driver.activeElement) == _syncContext;
    }
    throw new PageLoaderException('$runtimeType.isFocusedSync is unsupported');
  }

  @override
  Stream<String> get classes async* {}

  @override
  List<String> get classesSync => [];

  @override
  Future<Rectangle> getBoundingClientRect() async =>
      getBoundingClientRectSync();

  @override
  Rectangle getBoundingClientRectSync() => throw new PageLoaderException(
      '$runtimeType.getBoundingClientRectSync() is unsupported');

  @override
  Future<Rectangle> get offset async => offsetSync;

  @override
  Rectangle get offsetSync =>
      throw new PageLoaderException('$runtimeType.offsetSync is unsupported');

  @override
  Future clear(
          {bool sync: true, bool focusBefore: true, bool blurAfter: true}) =>
      throw new PageLoaderException('$runtimeType.clear() is unsupported');

  @override
  Future click({bool sync: true}) =>
      throw new PageLoaderException('$runtimeType.click() is unsupported');

  @override
  Future type(String keys,
          {bool sync: true, bool focusBefore: true, bool blurAfter: true}) =>
      throw new PageLoaderException('$runtimeType.type() is unsupported');

  @override
  Future<PageLoaderElement> get shadowRoot =>
      throw new PageLoaderException('$runtimeType.shadowRoot is unsupported');

  @override
  PageLoaderElement get shadowRootSync => throw new PageLoaderException(
      '$runtimeType.shadowRootSync is unsupported');

  @override
  Future blur({bool sync: true}) =>
      throw new PageLoaderException('$runtimeType.blur() is unsupported');

  @override
  Future focus({bool sync: true}) =>
      throw new PageLoaderException('$runtimeType.focus() is unsupported');
}

class _WebElementPageLoaderElementSync
    extends _BaseWebDriverPageLoaderElementSync {
  final sync_wd.WebElement _syncContext;

  _WebElementPageLoaderElementSync(
      sync_wd.WebElement context, WebDriverPageLoader loader)
      : this._syncContext = context,
        super._(loader,
            attributes: new _ElementAttributesSync(context),
            computedStyle: new _ElementComputedStyleSync(context),
            properties: new _ElementPropertiesSync(context),
            seleniumAttributes: new _ElementSeleniumAttributesSync(context),
            style: new _ElementStyleSync(context));

  @override
  Future<WebDriverPageLoaderElement> get shadowRoot async => shadowRootSync;

  @override
  WebDriverPageLoaderElement get shadowRootSync {
    if (loader.useShadowDom) {
      if ((_syncContext.driver.execute(
          'return arguments[0].shadowRoot != null;', [_syncContext]))) {
        return new _ShadowRootPageLoaderElementSync(_syncContext, loader);
      }
      throw new PageLoaderException('$this does not have a shadowRoot');
    }
    return this;
  }

  @override
  Future<String> get name async => nameSync;

  @override
  String get nameSync => _syncContext.name;

  @override
  Future<String> get innerText async => innerTextSync;

  @override
  String get innerTextSync => (_syncContext.driver
          .execute('return arguments[0].textContent;', [_syncContext]))
      .trim();

  @override
  Future<String> get visibleText async => visibleTextSync;

  @override
  String get visibleTextSync => _syncContext.text;

  @override
  Future<bool> get displayed async => displayedSync;

  @override
  bool get displayedSync => _syncContext.displayed;

  @override
  Stream<String> get classes => _fromList(classesSync);

  @override
  List<String> get classesSync {
    String classAttr = seleniumAttributes.getAttribute('class');
    if (classAttr != null && classAttr != '') {
      return classAttr.split(' ');
    }
    return [];
  }

  @override
  Future<Rectangle> getBoundingClientRect() async =>
      getBoundingClientRectSync();

  @override
  Rectangle getBoundingClientRectSync() {
    Map<String, num> rect = _syncContext.driver.execute(
        'return arguments[0].getBoundingClientRect();', [_syncContext]);
    return new Rectangle<num>(
        rect['left'], rect['top'], rect['width'], rect['height']);
  }

  @override
  Future<Rectangle> get offset async => offsetSync;

  @override
  Rectangle get offsetSync {
    Map<String, num> rect = _syncContext.driver.execute(
        '''return {
          left: arguments[0].offsetLeft,
          top: arguments[0].offsetTop,
          width: arguments[0].offsetWidth,
          height: arguments[0].offsetHeight
        }''',
        [_syncContext]);
    return new Rectangle<num>(
        rect['left'], rect['top'], rect['width'], rect['height']);
  }

  @override
  Future clear(
          {bool sync: true, bool focusBefore: true, bool blurAfter: true}) =>
      loader.executeSynced(() async {
        if (focusBefore) await focus(sync: false);
        _syncContext.clear();
        if (blurAfter) await blur(sync: false);
      }, sync);

  @override
  Future click({bool sync: true}) async => loader.executeSynced(() async {
        _syncContext.click();
      }, sync);

  @override
  Future type(String keys,
          {bool sync: true, bool focusBefore: true, bool blurAfter: true}) =>
      loader.executeSynced(() async {
        if (focusBefore) await focus(sync: false);
        _syncContext.sendKeys(keys);
        if (blurAfter) await blur(sync: false);
      }, sync);

  @override
  Future blur({bool sync: true}) => loader.executeSynced(
      () => _syncContext.driver.execute('arguments[0].blur();', [_syncContext]),
      sync);

  @override
  Future focus({bool sync: true}) => loader.executeSynced(
      () =>
          _syncContext.driver.execute('arguments[0].focus();', [_syncContext]),
      sync);
}

class _WebDriverPageLoaderElementSync
    extends _BaseWebDriverPageLoaderElementSync {
  final sync_wd.WebDriver _syncContext;

  _WebDriverPageLoaderElementSync(
      sync_wd.WebDriver context, WebDriverPageLoader loader)
      : this._syncContext = context,
        super._(loader, properties: new _DocumentPropertiesSync(context));

  @override
  Future<String> get name async => nameSync;

  @override
  String get nameSync => '__document__';

  @override
  Future<bool> get displayed async => displayedSync;

  @override
  bool get displayedSync => true;

  @override
  Future<String> get innerText async => innerTextSync;

  @override
  String get innerTextSync =>
      (_syncContext.execute('return arguments[0].textContent;', [_rootSync]))
          .trim();

  @override
  Future<String> get visibleText async => visibleTextSync;

  @override
  String get visibleTextSync => _rootSync.text;

  sync_wd.WebElement get _rootSync =>
      _syncContext.findElement(const sync_wd.By.cssSelector(':root'));
}

class _ShadowRootPageLoaderElementSync
    extends _BaseWebDriverPageLoaderElementSync {
  final sync_wd.WebElement _syncContext;

  _ShadowRootPageLoaderElementSync(
      sync_wd.WebElement context, WebDriverPageLoader loader)
      : this._syncContext = context,
        super._(loader, properties: new _ShadowRootPropertiesSync(context)) {
    assert(loader.useShadowDom);
  }

  @override
  Future<String> get name async => nameSync;

  @override
  String get nameSync => '__shadow_root__';

  @override
  Future<String> get visibleText async => visibleTextSync;

  @override
  String get visibleTextSync => _syncContext.text;

  @override
  Future<String> get innerText async => innerTextSync;

  @override
  String get innerTextSync => _executeSync('.textContent').trim();

  @override
  Future<bool> get displayed async => displayedSync;

  @override
  bool get displayedSync => _syncContext.displayed;

  dynamic _executeSync(String script) {
    return _syncContext.driver
        .execute('return arguments[0].shadowRoot$script;', [_syncContext]);
  }
}

@deprecated
class _ElementSeleniumAttributesSync extends PageLoaderAttributes {
  final sync_wd.WebElement _nodeSync;

  _ElementSeleniumAttributesSync(this._nodeSync);

  @override
  Future<String> operator [](String name) async => getAttribute(name);
  @override
  String getAttribute(String name) => _nodeSync.attributes[name];
}

class _ElementAttributesSync extends PageLoaderAttributes {
  final sync_wd.WebElement _nodeSync;

  _ElementAttributesSync(this._nodeSync);

  @override
  Future<String> operator [](String name) async => getAttribute(name);

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

class _ElementPropertiesSync extends PageLoaderAttributes {
  final sync_wd.WebElement _nodeSync;

  _ElementPropertiesSync(this._nodeSync);

  @override
  Future<String> operator [](String name) async => getAttribute(name);

  @override
  String getAttribute(String name) =>
      (_nodeSync.driver.execute('return arguments[0]["$name"];', [_nodeSync]))
          ?.toString();
}

class _ElementComputedStyleSync extends PageLoaderAttributes {
  final sync_wd.WebElement _nodeSync;

  _ElementComputedStyleSync(this._nodeSync);

  @override
  Future<String> operator [](String name) async => getAttribute(name);

  @override
  String getAttribute(String name) => (_nodeSync.driver.execute(
          'return window.getComputedStyle(arguments[0]).${_cssPropName(name)};',
          [_nodeSync]))
      ?.toString();
}

class _ElementStyleSync extends PageLoaderAttributes {
  final sync_wd.WebElement _nodeSync;

  _ElementStyleSync(this._nodeSync);

  @override
  Future<String> operator [](String name) async => getAttribute(name);

  @override
  String getAttribute(String name) => (_nodeSync.driver.execute(
          'return arguments[0].style.${_cssPropName(name)};', [_nodeSync]))
      ?.toString();
}

class _DocumentPropertiesSync extends PageLoaderAttributes {
  final sync_wd.WebDriver _driverSync;

  _DocumentPropertiesSync(this._driverSync);

  @override
  Future<String> operator [](String name) async => getAttribute(name);

  @override
  String getAttribute(String name) =>
      (_driverSync.execute('return document["$name"];', const []))?.toString();
}

class _ShadowRootPropertiesSync extends PageLoaderAttributes {
  final sync_wd.WebElement _nodeSync;

  _ShadowRootPropertiesSync(this._nodeSync);

  @override
  Future<String> operator [](String name) async => getAttribute(name);

  @override
  String getAttribute(String name) => (_nodeSync.driver
          .execute('return arguments[0].shadowRoot.["$name"];', [_nodeSync]))
      ?.toString();
}

Stream _fromList(List elements) async* {
  for (var element in elements) {
    yield element;
  }
}
