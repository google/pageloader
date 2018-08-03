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

library pageloader.api.page_loader_element_interface;

import 'dart:async';
import 'dart:math';

import 'annotation_interfaces.dart';
import 'iterable_interfaces.dart';
import 'page_loader_listener.dart';
import 'page_loader_source_interface.dart';
import 'page_utils_interface.dart';

/// Base class for interacting with raw DOM elements, e.g. buttons, input
/// fields, etc.
abstract class PageLoaderElement extends PageLoaderSource {
  /// Creates a new element based on the current context plus the passed
  /// [Finder], [Filter]s, and [Checker]s.
  PageLoaderElement createElement(
      Finder finder, List<Filter> filter, List<Checker> checkers);

  /// Creates a new iterable based on the current context plus the passed
  /// [Finder], [Filter]s, and [Checker]s.
  PageElementIterable createIterable(
      Finder finder, List<Filter> filter, List<Checker> checkers);

  /// Creates a new list based on the current context plus the passed
  /// [Finder], [Filter]s, and [Checker]s.
  List<PageLoaderElement> createList(
      Finder finder, List<Filter> filter, List<Checker> checkers);

  /// Adds additional [Checker]s to the list already maintained by the element.
  void addCheckers(List<Checker> checkers);

  /// Adds listeners to element.
  void addListeners(List<PageLoaderListener> listeners);

  /// Gets registered listeners.
  List<PageLoaderListener> get listeners;

  /// Support for PageLoader2 page objects, needed for migration.
  @deprecated
  dynamic get context;

  /// Support for PageLoader2 page objects, needed for migration.
  @deprecated
  dynamic get contextSync;

  /// Returns an instance of [PageUtils].
  ///
  /// Note the instances returned may not be object equal across invocations.
  PageUtils get utils;

  /// The shadow root hosted by this element.
  PageLoaderElement get shadowRoot;

  /// The text content of this element.
  ///
  /// This should return the value of `<element>.innerText` (see
  /// https://developer.mozilla.org/en-US/docs/Web/API/Node/innerText), but
  /// behaviour may vary for the different pageloader implementations.
  String get innerText;

  /// Visible text within this element.
  ///
  /// This should return the value of webdriver's getText() call (see
  /// http://seleniumhq.github.io/selenium/docs/api/java/org/openqa/selenium/WebElement.html#getText--),
  /// but behaviour may vary for the different pageloader implementations.
  String get visibleText;

  /// The tag name of the node represented by this element.
  String get name;

  /// Attributes associated with this element.
  PageLoaderAttributes get attributes;

  /// Attributes associated with this element.
  ///
  /// Deprecated: use [attributes].
  @deprecated
  PageLoaderAttributes get seleniumAttributes;

  /// Attributes associated with this element.
  PageLoaderAttributes get properties;

  /// CSS properties of this element after applying the active stylesheets and
  /// resolving any basic computation, such as converting a percentage into an
  /// absolute length.
  PageLoaderAttributes get computedStyle;

  /// This element's inline style attributes.
  PageLoaderAttributes get style;

  /// Whether this element is displayed based on "display" style.
  bool get displayed;

  /// CSS classes associated with this element.
  List<String> get classes;

  /// Whether this element is focused.
  bool get isFocused;

  /// Whether this element exists on the page.
  bool get exists;

  /// The offset of this element relative to its parent.
  Rectangle get offset;

  /// The smallest bounding rectangle that encompasses this element's padding,
  /// scrollbar, and border.
  ///
  /// WebDriver only.
  Rectangle getBoundingClientRect();

  /// Returns the elements within this element that match the given CSS
  /// selector.
  List<PageLoaderElement> getElementsByCss(String selector);

  /// Note: all elements below here should remain asynchronous to allow
  /// component tests to function properly.

  /// Clears the text of this element, if possible (e.g. for text fields).
  ///
  /// [focusBefore] indicates whether to focus this element before clearing.
  /// [blurAfter] indicates whether to blur this element after clearing.
  Future<void> clear({bool focusBefore: true, bool blurAfter: true});

  /// Clicks on the element.
  Future<void> click();

  /// Clicks outside of the current element.
  ///
  /// If the current element does not exist or is not displayed, do nothing.
  Future<void> clickOutside();

  /// Types [keys] into this element, if possible (e.g. for an input element).
  ///
  /// [focusBefore] indicates whether to focus this element before typing.
  /// [blurAfter] indicates whether to blur this element after typing.
  Future<void> type(String keys,
      {bool focusBefore: true, bool blurAfter: true});

  /// Focuses the element.
  Future<void> focus();

  /// Blurs the element (= lose focus).
  Future<void> blur();
}

/// Generic attributes interface, allowing bracket notation referencing.
abstract class PageLoaderAttributes {
  /// Returns the value of attribute '[name]'.
  String operator [](String name);
}
