// Copyright 2017 Google Inc. All rights reserved.
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

import 'dart:async';
import 'dart:math';

import 'package:pageloader/core.dart' as core;
import 'package:pageloader/pageloader.dart';
import 'package:webdriver/async_core.dart' as async_wd;
import 'package:webdriver/sync_core.dart' as sync_wd;

import 'webdriver_finder.dart';
import 'webdriver_iterators.dart';
import 'webdriver_page_utils.dart';

/// Implements [PageLoaderElement] for WebDriver test environments.
///
/// Internally, this operates using lazy semantics, resolving the underlying
/// [sync_wd.WebElement]s only when some DOM interaction is requested. Resolved
/// elements are cached until WebDriver indicates they are stale, at which point
/// an attempt to re-resolve the element(s) is made.
class WebDriverPageLoaderElement implements PageLoaderElement {
  sync_wd.WebDriver _driver;
  WebDriverPageUtils _utils;
  WebDriverPageLoaderElement _parentElement;
  sync_wd.WebElement _cachedElement;

  Finder _finder;
  List<Filter> _filters;
  List<Checker> _checkers;
  List<PageLoaderListener> _listeners;

  /// Constructs an element without context. Corresponds to the global context,
  /// i.e. the root HTML node.
  WebDriverPageLoaderElement(this._driver)
      : _utils = WebDriverPageUtils(_driver),
        _cachedElement = null,
        _finder = null,
        _filters = <Filter>[],
        _checkers = <Checker>[],
        _listeners = <PageLoaderListener>[],
        _parentElement = null {
    assert(_driver != null);
  }

  /// Constructs an element from a [WebElement].
  WebDriverPageLoaderElement.createFromElement(sync_wd.WebElement element) {
    this._driver = element.driver;
    this._utils = WebDriverPageUtils(_driver);
    this._parentElement = null;
    this._cachedElement = element;
    _finder = WebElementFinder(element);
    _filters = [];
    _checkers = [];
    _listeners = [];
  }

  /// Creates a new element, using the current element as the parent context
  /// for the newly created element.
  @override
  WebDriverPageLoaderElement createElement(
      Finder finder, List<Filter> filters, List<Checker> checkers) {
    return WebDriverPageLoaderElement(this._driver)
      .._finder = finder
      .._filters = filters
      .._checkers = checkers
      .._listeners = this._listeners
      .._parentElement = this;
  }

  /// Creates a new iterable, using the current element as the parent context
  /// for the newly created iterable.
  @override
  WebDriverPageElementIterable createIterable(
          Finder finder, List<Filter> filters, List<Checker> checkers) =>
      WebDriverPageElementIterable(WebDriverPageLoaderElement(this._driver)
        .._finder = finder
        .._filters = filters
        .._checkers = checkers
        .._listeners = this._listeners
        .._parentElement = this);

  /// Create a new list using the current element as the parent context.
  @override
  List<PageLoaderElement> createList(
      Finder finder, List<Filter> filter, List<Checker> checkers) {
    final rootElement = createElement(finder, filter, checkers);
    final createdList = (rootElement.elements)
        .map((elem) => WebDriverPageLoaderElement.createFromElement(elem))
        .toList();
    createdList.forEach((elem) => elem.addListeners(_listeners));
    return createdList;
  }

  @override
  void addListeners(List<PageLoaderListener> x) {
    _listeners.addAll(x);
  }

  @override
  List<PageLoaderListener> get listeners => _listeners;

  // Quick cast from WebElement; useful for applying [Filter]s and [Checker]s.
  WebDriverPageLoaderElement._castFromElement(sync_wd.WebElement element)
      : this._cachedElement = element,
        this._driver = element.driver;

  @override
  void addCheckers(List<Checker> checkers) {
    _checkers.addAll(checkers);
  }

  @override
  WebDriverPageUtils get utils => _utils;

  @override
  async_wd.SearchContext get context => contextSync.asyncContext;

  /// Needed to power mouse actions.
  @override
  sync_wd.SearchContext get contextSync => _single;

  /// Resolves the elements, throwing an exception if the # elements != 1.
  sync_wd.WebElement get _single {
    if (_cachedElement != null) {
      return _cachedElement;
    }

    final elems = elements;
    if (elems.isEmpty) {
      throw FoundZeroElementsInSingleException(this);
    } else if (elems.length > 1) {
      throw FoundMultipleElementsInSingleException(this);
    }
    _cachedElement = elems[0];
    return _cachedElement;
  }

  /// Returns all elements resolved.
  List<sync_wd.WebElement> get elements {
    sync_wd.WebElement base;
    if (_parentElement == null) {
      final root = _driver.findElements(sync_wd.By.tagName('html')).toList();
      if (root.isEmpty) {
        throw PageLoaderException('Could not find HTML tag at root');
      }
      if (root.length > 1) {
        throw PageLoaderException('Found multiple HTML tags');
      }
      base = root[0];
    } else {
      base = _parentElement._single;
    }

    Iterable<sync_wd.WebElement> elements;
    if (_finder == null) {
      elements = [_cachedElement ?? base];
    } else if (_finder is ContextFinder) {
      elements = (_finder as ContextFinder)
          .findElements(this._parentElement)
          .map((p) => p.contextSync);
    } else if (_finder is WebElementFinder) {
      elements = [(_finder as WebElementFinder).element];
    } else if (_finder is CssFinder) {
      elements = base
          .findElements(
              sync_wd.By.cssSelector((_finder as CssFinder).cssSelector))
          .toList();
    } else {
      throw 'Unknown Finder type, ${_finder.runtimeType}';
    }

    // Filter/Checker API is based on PageLoaderElements; casting for this.
    final tempElements = elements
        .map((e) => WebDriverPageLoaderElement._castFromElement(e))
        .toList();
    final filteredElements =
        core.applyFiltersAndChecks(tempElements, _filters, _checkers);
    return filteredElements
        .map((e) => (e as WebDriverPageLoaderElement)._cachedElement)
        .toList();
  }

  @override
  String toString() =>
      '${_parentElement == null ? "(no parent)" : _parentElement.toString()} ->'
      '$_finder | $_filters | $_checkers';

  @override
  WebDriverPageLoaderElement get shadowRoot => throw 'not implemented';

  // We could incrementally clear until we find a web element that's still
  // good, but that's 50ms min for each check. Instead we clear the whole chain.
  void _clearCache() {
    WebDriverPageLoaderElement elem = this;
    while (elem != null) {
      elem._cachedElement = null;
      elem = elem._parentElement;
    }
  }

  T _retryWhenStale<T>(core.MethodToRetry<T> method) =>
      core.staleElementWrapper(method, _clearCache, _isStaleElementException);

  @override
  String get innerText => _retryWhenStale(() =>
      (_driver.execute('return arguments[0].textContent;', [_single])).trim());

  @override
  String get visibleText => _retryWhenStale(() => _single.text);

  @override
  String get name => _retryWhenStale(() => _single.name);

  @override
  PageLoaderAttributes get attributes =>
      _retryWhenStale(() => _ElementAttributes(this));

  @override
  PageLoaderAttributes get seleniumAttributes => attributes;

  @override
  PageLoaderAttributes get properties =>
      _retryWhenStale(() => _ElementProperties(this));

  @override
  PageLoaderAttributes get computedStyle =>
      _retryWhenStale(() => _ElementComputedStyle(this));

  @override
  PageLoaderAttributes get style => _ElementStyle(this);

  @override
  bool get displayed => _retryWhenStale(() => _single.displayed);

  @override
  List<String> get classes {
    final classAttr = attributes['class'];
    if (classAttr != null && classAttr != '') {
      return classAttr.split(' ');
    }
    return <String>[];
  }

  @override
  bool get isFocused => _retryWhenStale(() => _single == _driver.activeElement);

  @override
  bool get exists {
    final count = elements.length;
    if (count == 1)
      return true;
    else if (count == 0) return false;
    throw PageLoaderException.withContext(
        'Found $count elements on call to exists', this);
  }

  @override
  Rectangle get offset {
    final rect = _retryWhenStale<Map>(() => _driver.execute('''return {
          left: arguments[0].offsetLeft,
          top: arguments[0].offsetTop,
          width: arguments[0].offsetWidth,
          height: arguments[0].offsetHeight
        }''', [_single]));
    return Rectangle<num>(
        rect['left'], rect['top'], rect['width'], rect['height']);
  }

  @override
  Rectangle getBoundingClientRect() {
    final rect = _retryWhenStale<Map>(() => _driver
        .execute('return arguments[0].getBoundingClientRect();', [_single]));
    return Rectangle<num>(
        rect['left'], rect['top'], rect['width'], rect['height']);
  }

  @override
  List<WebDriverPageLoaderElement> getElementsByCss(String selector) =>
      _retryWhenStale(() => _single
          .findElements(sync_wd.By.cssSelector(selector))
          .map((elem) => WebDriverPageLoaderElement.createFromElement(elem))
          .map((elem) => elem..addListeners(this.listeners))
          .toList());

  @override
  WebDriverPageLoaderElement byTag(String tagName) =>
      getElementsByCss(tagName).single;

  @override
  Future<Null> clear({bool focusBefore: true, bool blurAfter: true}) async =>
      _retryWhenStale(() async {
        if (focusBefore) await focus();
        _single.clear();
        if (blurAfter) await blur();
      });

  @override
  Future<Null> click() => _retryWhenStale<Null>(() {
        _single.click();
      });

  @override
  Future<void> clickOutside() async {
    if (!exists || !displayed) return;

    final rect = getBoundingClientRect();
    // ignore: await_only_futures
    await _retryWhenStale<void>(() {
      final bodyElement = _utils.byTag('body');
      final bodyRect = bodyElement.getBoundingClientRect();
      if (!rect.intersects(bodyRect)) {
        // No intersection. Just click the body which is outside of [_single].
        bodyElement.click();
        return;
      }

      // Find a [Point] that is not in the current element.
      final point = [
        bodyRect.topLeft,
        bodyRect.topRight,
        bodyRect.bottomLeft,
        bodyRect.bottomRight
      ].firstWhere((p) => !rect.containsPoint(p), orElse: () => null);

      if (point != null) {
        _utils.driver.mouse.moveTo(
            element: bodyElement.contextSync,
            xOffset: point.x.toInt() - bodyRect.left,
            yOffset: point.y.toInt() - bodyRect.top);
        _utils.driver.mouse.click();
      } else {
        throw PageLoaderException(
            'Could not click outside of the current element [$this].'
            ' It is because it covers the whole <body>.');
      }
    });
  }

  @override
  Future<Null> type(String keys,
          {bool focusBefore: true, bool blurAfter: true}) async =>
      _retryWhenStale(() async {
        if (focusBefore) await focus();
        _single.sendKeys(keys);
        if (blurAfter) await blur();
      });

  @override
  Future<Null> focus() async => _retryWhenStale(
      () => _driver.execute('arguments[0].focus();', [_single]));

  @override
  Future<Null> blur() async =>
      _retryWhenStale(() => _driver.execute('arguments[0].blur();', [_single]));
}

// Hack to support JSON and W3c style exception handling.
bool _isStaleElementException(Object e) =>
    e.toString().contains('StaleElementReferenceException');

class _ElementAttributes extends PageLoaderAttributes {
  final WebDriverPageLoaderElement _node;

  _ElementAttributes(this._node);

  @override
  String operator [](String name) => core.staleElementWrapper(
      () => (_node._driver.execute("""
    var attr = arguments[0].attributes["$name"];
    if(attr) {
      return attr.value;
    }
    return null;
    """, [_node._single]))?.toString(),
      _node._clearCache,
      _isStaleElementException);
}

class _ElementComputedStyle extends PageLoaderAttributes {
  final WebDriverPageLoaderElement _node;

  _ElementComputedStyle(this._node);

  @override
  String operator [](String name) => core.staleElementWrapper(
      () => _node._driver.execute(
          'return window.getComputedStyle(arguments[0]).${_cssPropName(name)};',
          [_node._single]),
      _node._clearCache,
      _isStaleElementException);
}

// Retrieves properties via Javascript.
class _ElementProperties extends PageLoaderAttributes {
  final WebDriverPageLoaderElement _node;

  _ElementProperties(this._node);

  @override
  String operator [](String name) => core.staleElementWrapper(
      () => (_node._driver
              .execute('return arguments[0]["$name"];', [_node._single]))
          ?.toString(),
      _node._clearCache,
      _isStaleElementException);
}

// Retrieves style via JavaScript '.style'.
class _ElementStyle extends PageLoaderAttributes {
  final WebDriverPageLoaderElement _node;

  _ElementStyle(this._node);

  @override
  String operator [](String name) => core.staleElementWrapper(
      () => _node._driver.execute(
          'return arguments[0].style.${_cssPropName(name)};', [_node._single]),
      _node._clearCache,
      _isStaleElementException);
}

/// Convert hyphenated-properties to camelCase.
String _cssPropName(String name) => name.splitMapJoin(RegExp(r'-(\w)'),
    onMatch: (m) => m.group(1).toUpperCase(), onNonMatch: (m) => m);
