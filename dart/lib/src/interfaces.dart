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
library pageloader.interfaces;

import 'package:matcher/matcher.dart';

import 'dart:collection';

abstract class Lazy<T> {
  T call();
}

abstract class PageLoader {
  PageLoaderElement get globalContext;

  Object getInstance(Type type, [dynamic context]);

  PageLoaderMouse get mouse;

  /// Waits for [condition] to be evaluated successful and return a value other
  /// than [null].
  waitForValue(condition(), {Duration timeout, Duration interval});

  /// Waits for [condition] to be evaluated successful and return a value
  /// that matches [matcher].
  waitFor(condition(), Matcher matcher, {Duration timeout, Duration interval});
}

abstract class PageLoaderMouse {
  /// Press [button] on the mouse at its current location. If [eventTarget] is
  /// specified, PageLoader will attempt to fire the corresponding mouse events
  /// on that target, otherwise it will fire the events on the target that is
  /// under the current mouse location.
  void down(int button, {PageLoaderElement eventTarget});

  /// Release [button] on the mouse at its current location. If [eventTarget] is
  /// specified, PageLoader will attempt to fire the corresponding mouse events
  /// on that target, otherwise it will fire the events on the target that is
  /// under the current mouse location.
  void up(int button, {PageLoaderElement eventTarget});

  /// Move the mouse to a location relative to [element].
  void moveTo(PageLoaderElement element, int xOffset, int yOffset);
}

abstract class PageLoaderElement {
  PageLoader get loader;

  PageLoaderElement get shadowRoot;
  String get innerText;
  String get visibleText;
  String get name;
  PageLoaderAttributes get attributes;
  PageLoaderAttributes get computedStyle;
  PageLoaderAttributes get style;
  bool get displayed;
  List<String> get classes;

  List<PageLoaderElement> getElementsByCss(String selector);

  void clear();
  void click();
  void type(String keys);
}

abstract class PageLoaderAttributes {
  String operator [](String name);
}

abstract class Finder {
  List<PageLoaderElement> findElements(PageLoaderElement context);
}

/// Enum of options that can be returned by [HasFilterFinderOptions.options].
class FilterFinderOption {
  final String option;

  const FilterFinderOption._(this.option);

  /// Disable the default implicit display filtering for a field.
  static const FilterFinderOption DISABLE_IMPLICIT_DISPLAY_FILTERING =
      const FilterFinderOption._('DISABLE_IMPLICIT_DISPLAY_FILTERING');
}

abstract class HasFilterFinderOptions {
  const HasFilterFinderOptions();

  List<FilterFinderOption> get options;
}

abstract class Filter {
  const Filter();

  List<PageLoaderElement> filter(List<PageLoaderElement> elements);
}

abstract class ElementFilter implements Filter {
  const ElementFilter();

  @override
  List<PageLoaderElement> filter(List<PageLoaderElement> elements) =>
      new UnmodifiableListView<PageLoaderElement>(
          elements.where(keep).toList(growable: false));

  bool keep(PageLoaderElement element);
}

class PageLoaderException {
  final String message;

  const PageLoaderException(this.message);

  @override
  String toString() => 'PageLoaderException: $message';
}
