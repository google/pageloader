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
import 'dart:html';
import 'dart:js' as js;
import 'dart:math';
import 'dart:svg' show SvgElement;

import 'package:pageloader/core.dart' as core;
import 'package:pageloader/pageloader.dart';

import 'html_iterators.dart';
import 'html_page_utils.dart';

/// Function used for synchronizing execution.
typedef Future<T> SyncFn<T>(Future<T> fn());

/// Default 'do nothing' sync function.
Future noOpExecuteSyncedFn(Future fn()) => fn().then<Null>((_) => null);

/// Base class for HTML elements.
class HtmlPageLoaderElement implements PageLoaderElement {
  final SyncFn syncFn;

  Element _cachedElement;
  HtmlPageLoaderElement _parentElement;

  Finder _finder;
  List<Filter> _filters;
  List<Checker> _checkers;
  List<PageLoaderListener> _listeners;

  HtmlPageLoaderElement({SyncFn externalSyncFn: noOpExecuteSyncedFn})
      : syncFn = externalSyncFn;

  HtmlPageLoaderElement.createFromElement(this._cachedElement,
      {SyncFn externalSyncFn: noOpExecuteSyncedFn})
      : _parentElement = null,
        _finder = null,
        _filters = [],
        _checkers = [],
        _listeners = [],
        syncFn = externalSyncFn;

  @override
  HtmlPageLoaderElement createElement(
      Finder finder, List<Filter> filters, List<Checker> checkers) {
    return HtmlPageLoaderElement(externalSyncFn: this.syncFn)
      .._finder = finder
      .._filters = filters
      .._checkers = checkers
      .._listeners = this._listeners
      .._parentElement = this;
  }

  @override
  HtmlPageElementIterable createIterable(
          Finder finder, List<Filter> filters, List<Checker> checkers) =>
      HtmlPageElementIterable(HtmlPageLoaderElement(externalSyncFn: this.syncFn)
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
        .map((elem) => HtmlPageLoaderElement.createFromElement(elem,
            externalSyncFn: syncFn))
        .toList();
    createdList.forEach((elem) => elem.addListeners(_listeners));
    return createdList;
  }

  // Quick cast from Node; used for [Filter]s and [Checker]s.
  HtmlPageLoaderElement._castFromElement(this.syncFn, this._cachedElement);

  @override
  void addCheckers(List<Checker> checkers) => _checkers.addAll(checkers);

  @override
  void addListeners(List<PageLoaderListener> listeners) {
    _listeners.addAll(listeners);
  }

  @override
  List<PageLoaderListener> get listeners => _listeners;

  @override
  PageUtils get utils => HtmlPageUtils(externalSyncFn: syncFn);

  @deprecated
  @override
  dynamic get context => _single;

  @deprecated
  @override
  dynamic get contextSync => _single;

  Element get _single {
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

  List<Element> get elements {
    Element base;
    if (_parentElement == null) {
      base = document.body;
    } else {
      base = _parentElement._single;
    }

    Iterable<Element> elements;
    if (_finder == null) {
      elements = [_cachedElement ?? base];
    } else if (_finder is ContextFinder) {
      elements = (_finder as ContextFinder)
          .findElements(this._parentElement)
          .map((p) => p.context);
    } else if (_finder is CssFinder) {
      elements = base.querySelectorAll((_finder as CssFinder).cssSelector);
    } else {
      throw 'Unknown Finder type, ${_finder.runtimeType}';
    }

    // Filter/Checker API is based on PageLoaderElements; casting for this.
    final tempElements = elements
        .map((e) => HtmlPageLoaderElement._castFromElement(this.syncFn, e))
        .toList();
    final filteredElements =
        core.applyFiltersAndChecks(tempElements, _filters, _checkers);
    return filteredElements
        .map((e) => (e as HtmlPageLoaderElement)._cachedElement)
        .toList();
  }

  void _clearCache() {
    HtmlPageLoaderElement elem = this;
    while (elem != null) {
      elem._cachedElement = null;
      elem = elem._parentElement;
    }
  }

  T _retryWhenStale<T>(core.MethodToRetry<T> method) =>
      core.staleElementWrapper(method, _clearCache, _isStaleElementException);

  @override
  String toString() =>
      '${_parentElement == null ? "(no parent)" : _parentElement.toString()} ->'
      '$_finder | $_filters | $_checkers';

  @override
  PageLoaderElement get shadowRoot => throw 'not implemented';

  @override
  String get innerText => _retryWhenStale(() => _single.text.trim());

  @override
  String get visibleText =>
      _retryWhenStale(() => _normalize(_elementText([_single])));

  @override
  String get name => _retryWhenStale(() => _single.tagName.toLowerCase());

  @override
  PageLoaderAttributes get attributes => _ElementAttributes(this);

  @override
  PageLoaderAttributes get seleniumAttributes => attributes;

  @override
  PageLoaderAttributes get properties => _ElementProperties(this);

  @override
  PageLoaderAttributes get computedStyle => _ElementComputedStyle(this);

  @override
  PageLoaderAttributes get style => _ElementStyle(this);

  @override
  bool get displayed =>
      _retryWhenStale(() => _single.getComputedStyle().display != 'none');

  @override
  List<String> get classes => _retryWhenStale(() => _single.classes.toList());

  @override
  bool get isFocused =>
      _retryWhenStale(() => document.activeElement == _single);

  @override
  bool get exists {
    final count = (elements).length;
    if (count == 1)
      return true;
    else if (count == 0) return false;
    throw PageLoaderException.withContext(
        'Found $count elements on call to exists', this);
  }

  @override
  Rectangle get offset => _retryWhenStale(() => _single.offset);

  @override
  Rectangle getBoundingClientRect() =>
      _retryWhenStale(() => _single.getBoundingClientRect());

  @override
  List<PageLoaderElement> getElementsByCss(String selector) =>
      _retryWhenStale(() {
        final element = _single;
        return element
            .querySelectorAll(selector)
            .map((elem) => HtmlPageLoaderElement.createFromElement(elem,
                externalSyncFn: syncFn))
            .toList();
      });

  @override
  PageLoaderElement byTag(String tagName) => getElementsByCss(tagName).single;

  @override
  Future<Null> clear({bool focusBefore: true, bool blurAfter: true}) async =>
      syncFn(() async => _retryWhenStale(() async {
            final element = _single;
            if (_hasValueProperty(element)) {
              if (focusBefore) await focus();
              _setValue(element, '');
              await _microtask(() => element.dispatchEvent(TextEvent('input')));
              await _microtask(
                  () => element.dispatchEvent(TextEvent('change')));
              if (blurAfter) await blur();
            } else {
              throw PageLoaderException(
                  '${element.runtimeType} does not support clear.');
            }
          }));

  @override
  Future<Null> click() async => syncFn(() async => _retryWhenStale(() async {
        final element = _single;
        if (element is OptionElement) {
          return _clickOptionElement();
        }

        await _microtask(() =>
            element.dispatchEvent(Event.eventType('MouseEvent', 'mousedown')));
        await _microtask(() =>
            element.dispatchEvent(Event.eventType('MouseEvent', 'mouseup')));

        if (element is SvgElement) {
          return _microtask(() =>
              element.dispatchEvent(Event.eventType('MouseEvent', 'click')));
        }

        return _microtask(element.click);
      }));

  @override
  Future<void> clickOutside() async {
    if (!exists || !displayed || utils.root == this) return;
    await utils.root.click();
  }

  Future<Null> _clickOptionElement() async => _retryWhenStale(() async {
        final option = _single as OptionElement;
        option.selected = true;
        return _microtask(() => option.dispatchEvent(Event('change')));
      });

  @override
  Future<Null> type(String keys,
          {bool focusBefore: true, bool blurAfter: true}) async =>
      syncFn(() async => _retryWhenStale(() async {
            final node = _single;
            if (focusBefore) await focus();
            await _fireKeyPressEvents(node, keys.length);
            if (_hasValueProperty(node)) {
              _setValue(node, _getValue(node) + keys);
              await _microtask(() => node.dispatchEvent(TextEvent('input')));
              await _microtask(() => node.dispatchEvent(TextEvent('change')));
            }
            if (blurAfter) await blur();
          }));

  // KeyEvent doesn't work in Dartium due to:
  // https://code.google.com/p/dart/issues/detail?id=13902
  // There is no reliable way to set the actual key values, so we just fire a number of
  // key presses instead.
  Future<Null> _fireKeyPressEvents(Element element, int numKeys) async {
    for (int i = 0; i < numKeys; ++i) {
      await _microtask(() => element.dispatchEvent(KeyboardEvent('keypress')));
    }
  }

  @override
  Future<Null> focus() async => syncFn(() async => _retryWhenStale(() async {
        await _microtask(_single.focus);
      }));

  @override
  Future<Null> blur() async => syncFn(() async => _retryWhenStale(() async {
        await _microtask(_single.blur);
      }));

  /// Dispatches an html [event] from [_single].
  bool dispatchEvent(Event event) => _single.dispatchEvent(event);
}

bool _isStaleElementException(Object e) =>
    e.toString().contains('StaleElementReferenceException');

class _ElementAttributes extends PageLoaderAttributes {
  final HtmlPageLoaderElement _node;

  _ElementAttributes(this._node);

  /// Based on algorithm from:
  /// https://dvcs.w3.org/hg/webdriver/raw-file/a9916dddac01/webdriver-spec.html#get-id-attribute
  @override
  String operator [](String name) => _node._single.attributes[name];
}

class _ElementComputedStyle extends PageLoaderAttributes {
  final HtmlPageLoaderElement _node;

  _ElementComputedStyle(this._node);

  @override
  String operator [](String name) => core.staleElementWrapper(
      () => _node._single.getComputedStyle().getPropertyValue(name),
      _node._clearCache,
      _isStaleElementException);
}

class _ElementProperties extends PageLoaderAttributes {
  final HtmlPageLoaderElement _node;

  _ElementProperties(this._node);

  @override
  String operator [](String name) => core.staleElementWrapper(() {
        final object = js.JsObject.fromBrowserObject(_node._single);
        if (object.hasProperty(name)) {
          return object[name].toString();
        }
        return null;
      }, _node._clearCache, _isStaleElementException);
}

class _ElementStyle extends PageLoaderAttributes {
  final HtmlPageLoaderElement _node;

  _ElementStyle(this._node);

  @override
  String operator [](String name) => core.staleElementWrapper(
      () => (_node._single).style.getPropertyValue(name),
      _node._clearCache,
      _isStaleElementException);
}

// Dart has a complex hierarchy for DOM elements with multiple interfaces
// implementing the same functions. These functions help us ignore this.
bool _hasValueProperty(Element element) =>
    element is InputElementBase || element is TextAreaElement;

String _getValue(Element element) {
  if (element is InputElementBase) return element.value;
  if (element is TextAreaElement) return element.value;
  throw PageLoaderException(
      'Cannot find value for type: ${element.runtimeType}');
}

void _setValue(Element element, String value) {
  if (element is InputElementBase) {
    element.value = value;
    return;
  }
  if (element is TextAreaElement) {
    element.value = value;
    return;
  }
  throw PageLoaderException(
      'Cannot find value for type: ${element.runtimeType}');
}

// execute [fn] as a separate microtask and return a [Future] that completes
// normally when that [Future] completes (normally or with an error).
Future<Null> _microtask(fn()) {
  return Future<Null>.microtask(() {
    fn();
  }).whenComplete(() {});
}

// Note: this is not exactly like PageLoader2's implementation, and I'm not 100%
// sure this if functionally equivalent. (But at least it has types.)
String _elementText(List<Node> elements) {
  if (elements.length > 1) {
    return elements.map((e) => _elementText([e])).join('');
  }

  final elem = elements.first;
  if (elem is Comment) {
    return '';
  }
  if (elem is ContentElement) {
    return _elementText(
        elem.getDistributedNodes().where((e) => e is Element).toList());
  }
  if (elem.nodes == null || elem.nodes.isEmpty) {
    return elem.text;
  }
  return _elementText(elem.nodes);
}

final _nonBreaking = RegExp(r'^[\S\xa0]$');

String _normalize(String string) {
  var skipWS = true;
  var addWS = false;
  final buffer = StringBuffer();
  for (int i = 0; i < string.length; i++) {
    final char = string[i];
    if (char.contains(_nonBreaking)) {
      if (addWS) {
        buffer.write(' ');
        addWS = false;
      }
      if (char == '\xa0') {
        buffer.write(' ');
      } else {
        buffer.write(char);
      }
      skipWS = false;
    } else if (!skipWS) {
      addWS = true;
      skipWS = true;
    }
  }
  return buffer.toString();
}
