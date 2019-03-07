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

  HtmlPageLoaderElement({SyncFn externalSyncFn = noOpExecuteSyncedFn})
      : syncFn = externalSyncFn;

  HtmlPageLoaderElement.createFromElement(this._cachedElement,
      {SyncFn externalSyncFn = noOpExecuteSyncedFn})
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

  @override
  dynamic get context => _single;

  /// Same as [context].
  @override
  dynamic get contextSync => _single;

  Element get _single {
    if (_cachedElement != null) {
      return _cachedElement;
    }

    final elems = elements;
    if (elems.length != 1) {
      throw SinglePageObjectException(this, elems.length);
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
  String toString() => _finder == null
      ? _parentElement.toString()
      : 'Element selected by $_finder,' +
          (_filters.isNotEmpty ? ' filtered by $_filters,' : '') +
          (_checkers.isNotEmpty ? ' checked with $_checkers,' : '') +
          ' in:\n${(_parentElement ?? utils.root).properties['outerHTML']}';

  @override
  String toStringDeep() =>
      "<$name>\n\nHTML:\n${properties['outerHTML']}\n\n$this";

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
    throw PageLoaderException('Found $count elements on call to exists', this);
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
  Future<Null> clear({bool focusBefore = true, bool blurAfter = true}) async =>
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
          {bool focusBefore = true, bool blurAfter = true}) async =>
      syncFn(() async => _retryWhenStale(() async {
            if (focusBefore) await focus();
            await _typeSequence(_keysToKeyboard(keys));
            if (blurAfter) await blur();
          }));

  PageLoaderKeyboard _keysToKeyboard(String keys) {
    final kb = PageLoaderKeyboard();
    for (var i = 0; i < keys.length; i++) {
      final key = keys[i];
      if (PageLoaderKeyboard.isShiftValue(key)) {
        kb
          ..typeSpecialKey(PageLoaderSpecialKey.shift, keyUp: false)
          ..typeKey(key)
          ..typeSpecialKey(PageLoaderSpecialKey.shift, keyDown: false);
      } else {
        kb.typeKey(key);
      }
    }
    return kb;
  }

  @override
  Future<void> typeSequence(PageLoaderKeyboard keys) =>
      _retryWhenStale(() => _typeSequence(keys));

  Future<void> _typeSequence(PageLoaderKeyboard keys) async {
    // Variables used for adjusting text input values.
    final keypressCharCodes = <int>[];
    String initialValue;

    if (_hasValueProperty(_single)) {
      initialValue = _getValue(_single) ?? '';
    }

    // Handle key events.
    for (final event in keys.events) {
      // Handle 'keypress' event. If element has value, insert into value.
      if (event.type == KeyboardEventType.keyPress) {
        var charCode = 0;
        if (!event.isSpecial) {
          charCode = event.key.codeUnitAt(0);
        } else if (event.specialKey == PageLoaderSpecialKey.enter) {
          charCode = KeyCode.ENTER;
        }

        // Dispatch associated events on contenteditable elements.
        if (_isContentEditable(_single)) {
          final keyValue = String.fromCharCode(charCode);
          _single.text += keyValue;
          await _microtask(() => _single.dispatchEvent(TextEvent('input')));
        }

        await _fireKeyboardEvent('keypress',
            keyCode: charCode, // In 'keypress', this is charCode
            charCode: charCode,
            altKey: event.altMod,
            ctrlKey: event.ctrlMod,
            metaKey: event.metaMod,
            shiftKey: event.shiftMod);
        keypressCharCodes.add(charCode);
      } else {
        // 'keydown' or 'keyup' events
        var keyCode = 0;
        if (event.isSpecial) {
          keyCode = _specialToKeyCode[event.specialKey];
        } else {
          final charCode = event.key.codeUnitAt(0);
          if (charCode >= _charCodeSmallA && charCode <= _charCodeSmallZ) {
            keyCode = KeyCode.A + (charCode - _charCodeSmallA);
          } else if (charCode >= _charCodeA && charCode <= _charCodeZ) {
            keyCode = KeyCode.A + (charCode - _charCodeA);
          } else if (charCode >= _charCode0 && charCode <= _charCode9) {
            keyCode = KeyCode.ZERO + (charCode - _charCode0);
          } else {
            keyCode = _charToKeyCodes[event.key];
          }
        }
        // If 'keyCode' could not be determined to a value (ex: '\n'), keep
        // it at 0 and use this instead.
        final type =
            event.type == KeyboardEventType.keyDown ? 'keydown' : 'keyup';
        await _fireKeyboardEvent(type,
            keyCode: keyCode,
            charCode: 0, // Always 0 in 'keydown' or 'keyup'
            altKey: event.altMod,
            ctrlKey: event.ctrlMod,
            metaKey: event.metaMod,
            shiftKey: event.shiftMod);
      }
    }

    // Dispatch associated [TextEvent]s if needed on keypresses.
    if (_hasValueProperty(_single)) {
      final toAppend =
          keypressCharCodes.map((c) => String.fromCharCode(c)).join();
      // This is needed since on some elements, sending 'keypress' will
      // automatically update the value while on some they don't and must
      // be manually injected. If the 'initialValue' differs, then we know
      // that the keypress events updated the values and we do not have to
      // manually update.
      if (initialValue == _getValue(_single)) {
        _setValue(_single, _getValue(_single) + toAppend);
      }
      await _microtask(() => _single.dispatchEvent(TextEvent('input')));
      await _microtask(() => _single.dispatchEvent(TextEvent('change')));
    }
  }

  Future<Null> _fireKeyboardEvent(String event,
          {int keyCode = 0,
          int charCode = 0,
          bool altKey = false,
          bool ctrlKey = false,
          bool metaKey = false,
          bool shiftKey = false}) =>
      _microtask(() => dispatchEvent(KeyEvent(event,
              keyCode: keyCode,
              charCode: charCode,
              altKey: altKey,
              ctrlKey: ctrlKey,
              metaKey: metaKey,
              shiftKey: shiftKey)
          .wrapped));

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

bool _isContentEditable(Element element) {
  final editable = element.attributes['contenteditable'];
  return editable == '' || editable == 'true';
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

// Values and functions used for key mapping.

final _charCodeSmallA = 'a'.codeUnitAt(0);
final _charCodeA = 'A'.codeUnitAt(0);
final _charCodeSmallZ = 'z'.codeUnitAt(0);
final _charCodeZ = 'z'.codeUnitAt(0);
final _charCode0 = '0'.codeUnitAt(0);
final _charCode9 = '9'.codeUnitAt(0);

// Mapping of String-based keys to its keyCode.
const _charToKeyCodes = {
  ')': KeyCode.ZERO,
  '!': KeyCode.ONE,
  '@': KeyCode.TWO,
  '#': KeyCode.THREE,
  r'$': KeyCode.FOUR,
  '%': KeyCode.FIVE,
  '^': KeyCode.SIX,
  '&': KeyCode.SEVEN,
  '*': KeyCode.EIGHT,
  '(': KeyCode.NINE,
  ';': KeyCode.SEMICOLON,
  ':': KeyCode.SEMICOLON,
  '=': KeyCode.EQUALS,
  '+': KeyCode.EQUALS,
  ',': KeyCode.COMMA,
  '<': KeyCode.COMMA,
  '-': KeyCode.DASH,
  '_': KeyCode.DASH,
  '.': KeyCode.PERIOD,
  '>': KeyCode.PERIOD,
  '/': KeyCode.SLASH,
  '?': KeyCode.SLASH,
  '`': KeyCode.TILDE,
  '~': KeyCode.TILDE,
  '[': KeyCode.OPEN_SQUARE_BRACKET,
  '{': KeyCode.OPEN_SQUARE_BRACKET,
  r'\': KeyCode.BACKSLASH,
  '|': KeyCode.BACKSLASH,
  ']': KeyCode.CLOSE_SQUARE_BRACKET,
  '}': KeyCode.CLOSE_SQUARE_BRACKET,
  '\'': KeyCode.SINGLE_QUOTE,
  '"': KeyCode.SINGLE_QUOTE,
  '\t': KeyCode.TAB,
  ' ': KeyCode.SPACE,
};

// Mapping of special keys to its keyCode
const _specialToKeyCode = {
  PageLoaderSpecialKey.backSpace: KeyCode.BACKSPACE,
  PageLoaderSpecialKey.tab: KeyCode.TAB,
  PageLoaderSpecialKey.enter: KeyCode.ENTER,
  PageLoaderSpecialKey.shift: KeyCode.SHIFT,
  PageLoaderSpecialKey.control: KeyCode.CTRL,
  PageLoaderSpecialKey.alt: KeyCode.ALT,
  PageLoaderSpecialKey.pause: KeyCode.PAUSE,
  PageLoaderSpecialKey.escape: KeyCode.ESC,
  PageLoaderSpecialKey.pageUp: KeyCode.PAGE_UP,
  PageLoaderSpecialKey.pageDown: KeyCode.PAGE_DOWN,
  PageLoaderSpecialKey.end: KeyCode.END,
  PageLoaderSpecialKey.home: KeyCode.HOME,
  PageLoaderSpecialKey.left: KeyCode.LEFT,
  PageLoaderSpecialKey.up: KeyCode.UP,
  PageLoaderSpecialKey.right: KeyCode.RIGHT,
  PageLoaderSpecialKey.down: KeyCode.DOWN,
  PageLoaderSpecialKey.insert: KeyCode.INSERT,
  PageLoaderSpecialKey.f1: KeyCode.F1,
  PageLoaderSpecialKey.f2: KeyCode.F2,
  PageLoaderSpecialKey.f3: KeyCode.F3,
  PageLoaderSpecialKey.f4: KeyCode.F4,
  PageLoaderSpecialKey.f5: KeyCode.F5,
  PageLoaderSpecialKey.f6: KeyCode.F6,
  PageLoaderSpecialKey.f7: KeyCode.F7,
  PageLoaderSpecialKey.f8: KeyCode.F8,
  PageLoaderSpecialKey.f9: KeyCode.F9,
  PageLoaderSpecialKey.f10: KeyCode.F10,
  PageLoaderSpecialKey.f11: KeyCode.F11,
  PageLoaderSpecialKey.f12: KeyCode.F12,
  PageLoaderSpecialKey.meta: KeyCode.META,
};
