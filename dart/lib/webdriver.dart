/*
 * Copyright 2014 Google Inc. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 * PageLoader WebDriver provides the necessary bindings to support using
 * PageLoader in WebDriver-based tests.
 */
library pageloader.webdriver;

import 'clock.dart';
import 'src/core.dart';
import 'src/interfaces.dart';
export 'src/interfaces.dart';

import 'dart:collection';
import 'dart:io' as io;

import 'package:sync_webdriver/sync_webdriver.dart' as wd;

class WebDriverPageLoader extends BasePageLoader {
  WebDriverPageLoaderElement _globalContext;
  final bool useShadowRoot;

  WebDriverPageLoader(
      wd.SearchContext globalContext,
      {this.useShadowRoot: true}) : super(const _IOClock()) {
    this._globalContext = new WebDriverPageLoaderElement(globalContext, this);
  }

  @override
  WebDriverPageLoaderElement get globalContext => _globalContext;

  @override
  Object getInstance(Type type, [dynamic context]) {
    if (context != null) {
      if (context is wd.SearchContext) {
        context = new WebDriverPageLoaderElement(context, this);
      } else if (context is! WebDriverPageLoaderElement) {
        throw new PageLoaderException('Invalid context: $context');
      }
    }
    return getInstanceInternal(type, context);
  }
}

class _IOClock implements Clock {
  const _IOClock();

  @override
  void sleep(Duration d) => io.sleep(d);
  @override
  DateTime get now => new DateTime.now();
}

abstract class WebDriverPageLoaderElement implements PageLoaderElement {
  wd.SearchContext get context;
  final WebDriverPageLoader loader;

  factory WebDriverPageLoaderElement(
      wd.SearchContext context, WebDriverPageLoader loader) {
    if (context is wd.WebDriver) {
      return new _WebDriverPageLoaderElement(context, loader);
    } else if (context is wd.WebElement) {
      return new _WebElementPageLoaderElement(context, loader);
    }
    return null;
  }

  WebDriverPageLoaderElement._(this.loader);

  @override
  List<WebDriverPageLoaderElement> getElementsByCss(String selector) =>
      _fromContextList(context.findElements(new wd.By.cssSelector(selector)));

  List<WebDriverPageLoaderElement> _fromContextList(contexts) =>
      contexts.map((e) => new WebDriverPageLoaderElement(e, loader)).toList();

  @override
  int get hashCode => context.hashCode;

  @override
  bool operator ==(Object other) =>
      other != null &&
      other.runtimeType == runtimeType &&
      other.context == context &&
      other.loader == loader;

  @override
  String toString() => '$runtimeType<${context.toString()}>';

  @override
  @deprecated
  String get text => visibleText;
}

class _WebElementPageLoaderElement extends WebDriverPageLoaderElement {
  final wd.WebElement context;
  final PageLoaderAttributes attributes;
  final PageLoaderAttributes computedStyle;
  final PageLoaderAttributes style;

  _WebElementPageLoaderElement(wd.WebElement _context,
                               WebDriverPageLoader loader)
      : super._(loader),
      this.context = _context,
      this.attributes = new _ElementAttributes(_context),
      this.computedStyle = new _ElementComputedStyle(_context),
      this.style = new _ElementStyle(_context);

  @override
  WebDriverPageLoaderElement get shadowRoot {
    if (loader.useShadowRoot) {
      return new _ShadowRootPageLoaderElement(context, loader);
    } else {
      return this;
    }
  }

  @override
  String get name => context.name;

  @override
  String get innerText => context.driver
      .execute('return arguments[0].textContent;', [ context ]).trim();

  @override
  String get visibleText => context.text;

  @override
  bool get displayed => context.displayed;

  @override
  List<String> get classes {
    String classAttr = attributes['class'];
    if (classAttr == null || classAttr == '') {
      return const [];
    } else {
      return new UnmodifiableListView(classAttr.split(' '));
    }
  }

  @override
  void clear() => context.clear();
  @override
  void click() => context.click();
  @override
  void type(String keys) => context.sendKeys(keys);
}

class _WebDriverPageLoaderElement extends WebDriverPageLoaderElement {
  final wd.WebDriver context;

  _WebDriverPageLoaderElement(this.context, WebDriverPageLoader loader):
      super._(loader);

  @override
  String get name => '__document__';
  @override
  void type(String keys) => context.keyboard.sendKeys(keys);

  // Overrides to make Analyzer happy.
  @override
  PageLoaderAttributes get attributes => super.attributes;
  @override
  List<String> get classes => super.classes;
  @override
  void clear() => super.clear();
  @override
  void click() => super.click();
  @override
  PageLoaderAttributes get computedStyle => super.computedStyle;
  @override
  bool get displayed => true;
  @override
  PageLoaderElement get shadowRoot => super.shadowRoot;
  @override
  PageLoaderAttributes get style => super.style;
  @override
  String get innerText => super.innerText;
  @override
  String get visibleText => super.visibleText;
}

class _ShadowRootPageLoaderElement extends WebDriverPageLoaderElement {
  final wd.WebElement context;

  _ShadowRootPageLoaderElement(this.context, WebDriverPageLoader loader) :
      super._(loader) {
    if (!_execute(' != null')) {
      throw new PageLoaderException('$context does not have a ShadowRoot');
    }
  }

  @override
  String get name => '__shadow_root__';

  @override
  String get visibleText => context.text;

  @override
  String get innerText => _execute('.textContent').trim();

  @override
  bool get displayed => context.displayed;

  @override
  List<PageLoaderElement> getElementsByCss(String selector) =>
      _fromContextList(_execute('.querySelectorAll("$selector")'));

  dynamic _execute(String script) {
    return context.driver.execute(
        'return arguments[0].shadowRoot$script;', [ context ]);
  }

  // Overrides to make Analyzer happy.
  @override
  PageLoaderAttributes get attributes => super.attributes;
  @override
  List<String> get classes => super.classes;
  @override
  void clear() => super.clear();
  @override
  void click() => super.click();
  @override
  PageLoaderAttributes get computedStyle => super.computedStyle;
  @override
  PageLoaderElement get shadowRoot => super.shadowRoot;
  @override
  PageLoaderAttributes get style => super.style;
  @override
  void type(String keys) => super.type(keys);
}

class _ElementAttributes extends PageLoaderAttributes {
  final wd.WebElement _node;

  _ElementAttributes(this._node);

  @override
  String operator [](String name) => _node.attributes[name];
}

class _ElementComputedStyle extends PageLoaderAttributes {
  final wd.WebElement _node;

  _ElementComputedStyle(this._node);

  @override
  String operator [](String name) => _node.driver.execute(
      'return window.getComputedStyle(arguments[0]).${_cssPropName(name)}',
      [_node]);
}

class _ElementStyle extends PageLoaderAttributes {
  final wd.WebElement _node;

  _ElementStyle(this._node);

  @override
  String operator [](String name) => _node.driver.execute(
      'return arguments[0].style.${_cssPropName(name)}', [_node]);
}

/// Convert hyphenated-properties to camelCase.
String _cssPropName(String name) => name.splitMapJoin(new RegExp(r'-(\w)'),
    onMatch: (m) => m.group(1).toUpperCase(),
    onNonMatch: (m) => m);
