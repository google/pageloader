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
 * PageLoader HTML provides the necessary bindings to support using PageLoader
 * Objects in tests that run within the browser.
 */
library pageloader.html;

import 'clock.dart';
import 'src/core.dart';
import 'src/interfaces.dart';
export 'src/interfaces.dart';

import 'dart:collection';
import 'dart:html';
import 'dart:mirrors' hide Comment;

/**
 * A function that will be executed after [click] and [type] and during
 * [waitFor] and [waitForValue] to allow events to
 * be processed. For example if using Angular's async test wrapper this should
 * be function that calls scope.apply() and clockTick.
 */
typedef void SyncActionFn(Duration interval);

const Duration _DEFAULT_INTERVAL = const Duration(milliseconds: 1);

class HtmlPageLoader extends BasePageLoader {
  HtmlPageLoaderElement _globalContext;

  final Duration defaultInterval;

  @override
  HtmlPageLoaderElement get globalContext => _globalContext;

  factory HtmlPageLoader(Node globalContext, [SyncActionFn syncActionFn]) {
    var clock;

    if (syncActionFn != null) {
      clock = new _SyncActionClock(syncActionFn);
    }

    return new HtmlPageLoader._(globalContext, clock);
  }

  HtmlPageLoader._(Node globalContext, Clock clock)
      : super(clock) {
    this._globalContext = new HtmlPageLoaderElement(globalContext, this);
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

  @override
  void sync() => clock.sleep(_DEFAULT_INTERVAL);
}

abstract class HtmlPageLoaderElement implements PageLoaderElement {
  final HtmlPageLoader _loader;
  dynamic get node;

  factory HtmlPageLoaderElement(Node node, HtmlPageLoader loader) {
    if (node is Element) {
      return new _ElementPageLoaderElement(node, loader);
    } else if (node is Document) {
      return new _DocumentPageLoaderElement(node, loader);
    } else if (node is ShadowRoot) {
      return new _ShadowRootPageLoaderElement(node, loader);
    }
    return null;
  }

  HtmlPageLoaderElement._(this._loader);

  @override
  @deprecated
  String get text => innerText;

  @override
  String get innerText => node.text.trim();

  // TODO(DrMarcII) consider normalizing string
  @override
  String get visibleText => _elementText(node).trim();

  @override
  List<HtmlPageLoaderElement> getElementsByCss(String selector) =>
      _fromNodeList(node.querySelectorAll(selector));

  List<HtmlPageLoaderElement> _fromNodeList(List<Node> nodes) =>
      nodes.map((e) => new HtmlPageLoaderElement(e, _loader)).toList();

  @override
  int get hashCode => node.hashCode;

  @override
  bool operator ==(other) =>
      other != null &&
      other.runtimeType == runtimeType &&
      other.node == node &&
      other._loader == _loader;

  @override
  String toString() => '$runtimeType<${node.toString()}>';
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
  PageLoaderElement get shadowRoot =>
      new HtmlPageLoaderElement(node.shadowRoot, _loader);
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
    _loader.sync();
  }

  void _clickOptionElement() {
    OptionElement option = node as OptionElement;
    option.selected = true;
    option.dispatchEvent(new Event('change'));
  }

  @override
  void type(String keys) {
    if (node is InputElement) {
      _setInputValue(node, (node as InputElement).value + keys);
    } else {
      super.type(keys);
    }
  }

  @override
  void clear() {
    if (node is InputElement) {
      _setInputValue(node, '');
    } else {
      super.clear();
    }
  }

  void _setInputValue(InputElement element, String value) {
    node.focus();
    bool attributeSet = node.attributes.containsKey('value');
    node.setAttribute('value', value);
    (node as InputElement).value = '';
    node.dispatchEvent(new TextEvent('textInput', data: value));
    node.blur();
    _loader.sync();
  }
}

class _ShadowRootPageLoaderElement extends HtmlPageLoaderElement {
  final ShadowRoot node;

  _ShadowRootPageLoaderElement(this.node, PageLoader loader): super._(loader);

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
  void type(String keys) => super.type(keys);
  @override
  PageLoaderAttributes get attributes => super.attributes;
  @override
  PageLoaderElement get shadowRoot => super.shadowRoot;
}

class _DocumentPageLoaderElement extends HtmlPageLoaderElement {
  final Document node;

  _DocumentPageLoaderElement(this.node, PageLoader loader): super._(loader);

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
  void type(String keys) => super.type(keys);
}

class _ElementAttributes extends PageLoaderAttributes {
  static const _BOOLEAN_ATTRIBUTES = const [
      'async', 'autofocus', 'autoplay', 'checked', 'compact', 'complete',
      'controls', 'declare', 'defaultchecked', 'defaultselected', 'defer',
      'disabled', 'draggable', 'ended', 'formnovalidate', 'hidden',
      'indeterminate', 'iscontenteditable', 'ismap', 'itemscope', 'loop',
      'multiple', 'muted', 'nohref', 'noresize', 'noshade', 'novalidate',
      'nowrap', 'open', 'paused', 'pubdate', 'readonly', 'required',
      'reversed', 'scoped', 'seamless', 'seeking', 'selected', 'spellcheck',
      'truespeed', 'willvalidate'
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
        if (_node is CheckboxInputElement || _node is RadioButtonInputElement) {
          return _node.checked ? 'true' : null;
        }
      }
      // 5
      if (_node is AnchorElement && name == 'href') {
        return _node.href;
      }
      // 5
      if (_node is ImageElement && name == 'src') {
        return _node.src;
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
    } catch (e) { /* 7.2 - 7.3 ignore and default to attribute value or null*/ }

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
  String operator [](String name) =>
      _node.style.getPropertyValue(name);
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
