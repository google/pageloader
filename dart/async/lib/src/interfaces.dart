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

library pageloader.interfaces;

import 'dart:async';
import 'dart:math';
import 'package:webdriver/core.dart' show MouseButton;

export 'package:webdriver/core.dart' show MouseButton;

typedef Future<T> SyncedExecutionFn<T>(Future<T> fn());

abstract class Lazy<T> {
  Future<T> call();
}

abstract class PageLoader {
  bool get useShadowDom;
  PageLoaderElement get globalContext;

  Future/*<T>*/ getInstance/*<T>*/(Type type, [dynamic context]);

  PageLoaderMouse get mouse;
}

abstract class PageLoaderMouse {
  /// Press [button] on the mouse at its current location. If [eventTarget] is
  /// specified, PageLoader will attempt to fire the corresponding mouse events
  /// on that target, otherwise it will fire the events on the target that is
  /// under the current mouse location.
  Future down(MouseButton button,
      {PageLoaderElement eventTarget, bool sync: true});

  /// Release [button] on the mouse at its current location. If [eventTarget] is
  /// specified, PageLoader will attempt to fire the corresponding mouse events
  /// on that target, otherwise it will fire the events on the target that is
  /// under the current mouse location.
  Future up(MouseButton button,
      {PageLoaderElement eventTarget, bool sync: true});

  /// Move the mouse to a location relative to [element]. If [eventTarget] is
  /// specified, PageLoader will attempt to fire the corresponding mouse events
  /// on that target, otherwise it will fire the events on the target that is
  /// under the current mouse location.
  Future moveTo(PageLoaderElement element, int xOffset, int yOffset,
      {PageLoaderElement eventTarget, bool sync: true});
}

abstract class PageLoaderElement {
  PageLoader get loader;

  Future<PageLoaderElement> get shadowRoot;
  Future<String> get innerText;
  Future<String> get visibleText;
  Future<String> get name;
  PageLoaderAttributes get attributes;
  PageLoaderAttributes get computedStyle;
  PageLoaderAttributes get style;
  Future<bool> get displayed;
  Stream<String> get classes;
  Future<bool> get isFocused;

  Future<Rectangle> get offset;
  Future<Rectangle> getBoundingClientRect();

  Stream<PageLoaderElement> getElementsByCss(String selector);

  Future clear({bool sync: true, bool focusBefore: true, bool blurAfter: true});
  Future click({bool sync: true});
  Future type(String keys,
      {bool sync: true, bool focusBefore: true, bool blurAfter: true});
  Future focus({bool sync: true});
  Future blur({bool sync: true});
}

abstract class PageLoaderAttributes {
  Future<String> operator [](String name);
}

abstract class Finder {
  Stream<PageLoaderElement> findElements(PageLoaderElement context);
}

abstract class Filter {
  const Filter();

  Stream<PageLoaderElement> filter(Stream<PageLoaderElement> elements);
}

abstract class ElementFilter implements Filter {
  const ElementFilter();

  @override
  Stream<PageLoaderElement> filter(Stream<PageLoaderElement> elements) async* {
    for (PageLoaderElement el in await elements.toList()) {
      if (await keep(el)) {
        yield el;
      }
    }
  }

  Future<bool> keep(PageLoaderElement element);
}

class PageLoaderException {
  final String message;

  const PageLoaderException(this.message);

  @override
  String toString() => 'PageLoaderException: $message';
}
