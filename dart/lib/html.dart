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
/// PageLoader HTML provides the necessary bindings to support using PageLoader
/// Objects in tests that run within the browser.
library pageloader.html;

import 'clock.dart';
import 'src/core.dart';
import 'src/interfaces.dart';
export 'src/interfaces.dart';

import 'dart:collection';
import 'dart:html';
import 'dart:mirrors' hide Comment;

/// A function that will be executed after [click] and [type] and during
/// [waitFor] and [waitForValue] to allow events to be processed. For example
/// if using Angular's async test wrapper this should be a function that calls
/// scope.apply() and clockTick.
typedef void SyncActionFn(Duration interval);

const Duration _DEFAULT_INTERVAL = const Duration(milliseconds: 1);

class HtmlPageLoader extends BasePageLoader {
  HtmlPageLoaderElement _globalContext;

  @override
  HtmlPageLoaderElement get globalContext => _globalContext;

  _HtmlMouse _mouse;

  @override
  _HtmlMouse get mouse => _mouse;

  factory HtmlPageLoader(Node globalContext,
      {SyncActionFn syncActionFn, bool useShadowDom: true}) {
    var clock;

    if (syncActionFn != null) {
      clock = new _SyncActionClock(syncActionFn);
    }

    return new HtmlPageLoader._(globalContext, clock, useShadowDom);
  }

  HtmlPageLoader._(Node globalContext, Clock clock, bool useShadowDom)
      : super(clock: clock, useShadowDom: useShadowDom) {
    this._globalContext = new HtmlPageLoaderElement(globalContext, this);
    this._mouse = new _HtmlMouse(this);
  }

  @override
  Object getInstance(Type type, [dynamic context]) {
    if (context != null) {
      if (context is Node) {
        context = new HtmlPageLoaderElement(context, this);
      } else if (context is! HtmlPageLoaderElement) {
        throw new PageLoaderException('Invalid context: $context');
      }
    }
    return getInstanceInternal(type, context);
  }

  void sync() => clock.sleep(_DEFAULT_INTERVAL);
}

class _HtmlMouse implements PageLoaderMouse {
  final HtmlPageLoader loader;

  int clientX = 0;
  int clientY = 0;

  _HtmlMouse(this.loader);

  @override
  void down(int button, {_ElementPageLoaderElement eventTarget}) {
    dispatchEvent('mousedown', eventTarget, button);
    loader.sync();
  }

  @override
  void moveTo(_ElementPageLoaderElement element, int xOffset, int yOffset,
      {_ElementPageLoaderElement eventTarget}) {
    clientX = (element.node.getBoundingClientRect().left + xOffset).ceil();
    clientY = (element.node.getBoundingClientRect().top + yOffset).ceil();
    dispatchEvent('mousemove', eventTarget);
    loader.sync();
  }

  @override
  void up(int button, {_ElementPageLoaderElement eventTarget}) {
    dispatchEvent('mouseup', eventTarget);
    loader.sync();
  }

  int get pageX => window.pageXOffset + clientX;
  int get pageY => window.pageYOffset + clientY;
  int get _borderWidth => (window.outerWidth - window.innerWidth) ~/ 2;
  int get screenX => window.screenLeft + _borderWidth + clientX;
  int get screenY => window.screenTop +
      window.outerHeight -
      window.innerHeight -
      _borderWidth +
      clientY;

  void dispatchEvent(String type, _ElementPageLoaderElement eventTarget,
      [int button = 0]) {
    var event = new MouseEvent(type,
        button: button,
        clientX: clientX,
        clientY: clientY,
        screenX: screenX,
        screenY: screenY);

    if (eventTarget != null) {
      eventTarget.node.dispatchEvent(event);
    } else {
      currentElement.dispatchEvent(event);
    }
  }

  Element get currentElement {
    var element = document.elementFromPoint(pageX, pageY);
    if (element == null) {
      element = document.body;
    }
    return element;
  }
}

abstract class HtmlPageLoaderElement implements PageLoaderElement {
  @override
  final HtmlPageLoader loader;

  dynamic get node;

  factory HtmlPageLoaderElement(Node node, HtmlPageLoader loader) {
    if (node is Element) {
      return new _ElementPageLoaderElement(node, loader);
    } else if (node is Document) {
      return new _DocumentPageLoaderElement(node, loader);
    } else if (node is ShadowRoot) {
      if (loader.useShadowDom) {
        return new _ShadowRootPageLoaderElement(node, loader);
      } else {
        throw new PageLoaderException(
            'Cannot create element for ShadowRoot when useShadowDom is false');
      }
    }
    return null;
  }

  HtmlPageLoaderElement._(this.loader);

  @override
  String get innerText => node.text.trim();

  // TODO(DrMarcII) consider normalizing string
  @override
  String get visibleText => _elementText(node).trim();

  @override
  List<HtmlPageLoaderElement> getElementsByCss(String selector) =>
      _fromNodeList(node.querySelectorAll(selector));

  List<HtmlPageLoaderElement> _fromNodeList(List<Node> nodes) =>
      nodes.map((e) => new HtmlPageLoaderElement(e, loader)).toList();

  @override
  int get hashCode => node.hashCode;

  @override
  bool operator ==(other) => other != null &&
      other.runtimeType == runtimeType &&
      other.node == node &&
      other.loader == loader;

  @override
  String toString() => '$runtimeType<${node.toString()}>';

  void type(String keys) {
    _fireKeyPressEvents(node, keys);
    loader.sync();
  }

  // This doesn't work in Dartium due to:
  // https://code.google.com/p/dart/issues/detail?id=13902
  void _fireKeyPressEvents(Element element, String keys) {
    for (int charCode in keys.codeUnits) {
      element
          .dispatchEvent(new KeyEvent('keypress', charCode: charCode).wrapped);
    }
  }
}

class _ElementPageLoaderElement extends HtmlPageLoaderElement {
  final Element node;
  final PageLoaderAttributes attributes;
  final PageLoaderAttributes computedStyle;
  final PageLoaderAttributes style;

  _ElementPageLoaderElement(Element _node, HtmlPageLoader loader)
      : super._(loader),
        this.node = _node,
        this.attributes = new _ElementAttributes(_node),
        this.computedStyle = new _ElementComputedStyle(_node),
        this.style = new _ElementStyle(_node);

  @override
  PageLoaderElement get shadowRoot => loader.useShadowDom
      ? new HtmlPageLoaderElement(node.shadowRoot, loader)
      : this;
  @override
  String get name => node.tagName.toLowerCase();
  // TODO(DrMarcII): implement this to recurse up the tree to see if displayed
  @override
  bool get displayed => node.getComputedStyle().display != 'none';

  @override
  List<String> get classes => new UnmodifiableListView(node.classes);

  @override
  void click() {
    if (node is OptionElement) {
      _clickOptionElement();
    } else {
      node.click();
    }
    loader.sync();
  }

  void _clickOptionElement() {
    OptionElement option = node as OptionElement;
    option.selected = true;
    option.dispatchEvent(new Event('change'));
  }

  @override
  void type(String keys) {
    node.focus();
    _fireKeyPressEvents(node, keys);
    if (node is InputElement || node is TextAreaElement) {
      // suppress warning by hiding field
      var node = this.node;
      var value = node.value + keys;
      node.value = '';
      node.dispatchEvent(new TextEvent('textInput', data: value));
    }
    node.blur();
    loader.sync();
  }

  @override
  void clear() {
    if (node is InputElement || node is TextAreaElement) {
      var node = this.node;
      node.value = '';
      node.dispatchEvent(new TextEvent('textInput', data: ''));
    } else {
      super.clear();
    }
  }
}

class _ShadowRootPageLoaderElement extends HtmlPageLoaderElement {
  final ShadowRoot node;

  _ShadowRootPageLoaderElement(this.node, PageLoader loader) : super._(loader) {
    assert(loader.useShadowDom);
  }

  @override
  String get name => '__shadow_root__';
  @override
  bool get displayed => true;

  // Overrides to make Analyzer happy.
  @override
  List<String> get classes => super.classes;
  @override
  void clear() => super.clear();
  @override
  void click() => super.click();
  @override
  PageLoaderAttributes get computedStyle => super.computedStyle;
  @override
  PageLoaderAttributes get style => super.style;
  @override
  PageLoaderAttributes get attributes => super.attributes;
  @override
  PageLoaderElement get shadowRoot => super.shadowRoot;
}

class _DocumentPageLoaderElement extends HtmlPageLoaderElement {
  final Document node;

  _DocumentPageLoaderElement(this.node, PageLoader loader) : super._(loader);

  @override
  String get name => '__document__';
  @override
  bool get displayed => true;

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
  void type(String keys) {
    // TODO(DrMarcII) consider whether this should be sent to
    // document.activeElement to more closely match WebDriver behavior.
    document.body.focus();
    _fireKeyPressEvents(document.body, keys);
    document.body.blur();
    loader.sync();
  }
}

class _ElementAttributes extends PageLoaderAttributes {
  static const _BOOLEAN_ATTRIBUTES = const [
    'async',
    'autofocus',
    'autoplay',
    'checked',
    'compact',
    'complete',
    'controls',
    'declare',
    'defaultchecked',
    'defaultselected',
    'defer',
    'disabled',
    'draggable',
    'ended',
    'formnovalidate',
    'hidden',
    'indeterminate',
    'iscontenteditable',
    'ismap',
    'itemscope',
    'loop',
    'multiple',
    'muted',
    'nohref',
    'noresize',
    'noshade',
    'novalidate',
    'nowrap',
    'open',
    'paused',
    'pubdate',
    'readonly',
    'required',
    'reversed',
    'scoped',
    'seamless',
    'seeking',
    'selected',
    'spellcheck',
    'truespeed',
    'willvalidate'
  ];

  final Element _node;

  _ElementAttributes(this._node);

  /// Based on algorithm from:
  /// https://dvcs.w3.org/hg/webdriver/raw-file/a9916dddac01/webdriver-spec.html#get-id-attribute
  @override
  String operator [](String name) {
    var result;
    var lcName = name.toLowerCase();

    // 1
    if (lcName == 'style') {
      return _node.style.cssText;
    }
    // 2
    if (_node.attributes.containsKey(name)) {
      // 2.1
      result = _node.attributes[name];
      // 2.2
      if (_BOOLEAN_ATTRIBUTES.contains(name)) {
        return 'true';
      }
      // 2.3 skip to 7
    } else {
      // 3
      if (_node is OptionElement && lcName == 'value') {
        return _node.text;
      }
      // 4
      if (lcName == 'selected') {
        if (_node is CheckboxInputElement) {
          return (_node as CheckboxInputElement).checked ? 'true' : null;
        }
        if (_node is RadioButtonInputElement) {
          return (_node as RadioButtonInputElement).checked ? 'true' : null;
        }
      }
      // 5
      if (_node is AnchorElement && name == 'href') {
        return (_node as AnchorElement).href;
      }
      // 5
      if (_node is ImageElement && name == 'src') {
        return (_node as ImageElement).src;
      }
      // 6
      if (name == 'class') {
        return this['className'];
      }
      // 6
      if (name == 'readonly') {
        return this['readOnly'];
      }
    }
    // 7
    try {
      //  7.1
      result = reflect(_node).getField(new Symbol(name)).reflectee;
    } catch (e) {/* 7.2 - 7.3 ignore and default to attribute value or null*/}

    if (result is bool) {
      return result ? 'true' : null;
    }
    if (result is CssStyleDeclaration) {
      return result.cssText;
    }
    if (result == null) {
      return null;
    }
    return result.toString();
  }
}

class _ElementComputedStyle extends PageLoaderAttributes {
  final Element _node;

  _ElementComputedStyle(this._node);

  @override
  String operator [](String name) =>
      _node.getComputedStyle().getPropertyValue(name);
}

class _ElementStyle extends PageLoaderAttributes {
  final Element _node;

  _ElementStyle(this._node);

  @override
  String operator [](String name) => _node.style.getPropertyValue(name);
}

String _elementText(n) {
  hasShadowRoot(n) => n is Element && n.shadowRoot != null;
  if (n is Iterable) return n.map((nn) => _elementText(nn)).join("");
  if (n is Comment) return '';
  if (n is ContentElement) return _elementText(n.getDistributedNodes());
  if (hasShadowRoot(n)) return _elementText(n.shadowRoot.nodes);
  if (n.nodes == null || n.nodes.isEmpty) return n.text;
  return _elementText(n.nodes);
}

class _SyncActionClock extends FakeClock {
  final SyncActionFn syncActionFn;

  _SyncActionClock(this.syncActionFn) : super();

  @override
  void sleep(Duration interval) {
    syncActionFn(interval);
    super.sleep(interval);
  }
}
