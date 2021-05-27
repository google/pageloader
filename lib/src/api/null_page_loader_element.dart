// Copyright 2018 Google Inc. All rights reserved.
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
import 'dart:math';

import 'annotation_interfaces.dart';
import 'exceptions.dart';
import 'iterable_interfaces.dart';
import 'page_loader_click_option.dart';
import 'page_loader_element_interface.dart';
import 'page_loader_keyboard.dart';
import 'page_loader_listener.dart';
import 'page_utils_interface.dart';

/// Null PageLoaderElement is used in place of 'null' value.
///
/// Users should not construct this class directly and instead
/// use the `@nullElement` annotation instead.
class NullPageLoaderElement implements PageLoaderElement {
  @override
  NullPageLoaderElement createElement(
          Finder finder, List<Filter> filter, List<Checker> checkers) =>
      NullPageLoaderElement();

  @override
  PageElementIterable createIterable(
          Finder finder, List<Filter> filter, List<Checker> checkers) =>
      throw NullPageLoaderElementAccessException('createIterable', this);

  @override
  List<NullPageLoaderElement> createList(
          Finder finder, List<Filter> filter, List<Checker> checkers) =>
      <NullPageLoaderElement>[];

  @override
  PageLoaderElement byTag(String tag) => NullPageLoaderElement();

  @override
  void addCheckers(List<Checker> checkers) {}

  @override
  void addListeners(List<PageLoaderListener> listeners) {}

  @override
  List<PageLoaderListener> get listeners => <PageLoaderListener>[];

  @override
  dynamic get context =>
      throw NullPageLoaderElementAccessException('context', this);

  /// Same as [context].
  @override
  dynamic get contextSync =>
      throw NullPageLoaderElementAccessException('contextSync', this);

  @override
  PageUtils get utils =>
      throw NullPageLoaderElementAccessException('utils', this);

  @override
  PageLoaderElement get shadowRoot =>
      throw NullPageLoaderElementAccessException('shadowRoot', this);

  @override
  List<PageLoaderElement> get shadowRootChildren =>
      throw NullPageLoaderElementAccessException('shadowRootChildren', this);

  @override
  String get id => '<id>';

  @override
  String get innerText =>
      throw NullPageLoaderElementAccessException('innerText', this);

  @override
  String get visibleText =>
      throw NullPageLoaderElementAccessException('visibleText', this);

  @override
  String get name => throw NullPageLoaderElementAccessException('name', this);

  @override
  PageLoaderAttributes get attributes =>
      throw NullPageLoaderElementAccessException('attributes', this);

  @override
  @deprecated
  PageLoaderAttributes get seleniumAttributes =>
      throw NullPageLoaderElementAccessException('seleniumAttributes', this);

  @override
  PageLoaderAttributes get properties =>
      throw NullPageLoaderElementAccessException('attributes', this);

  @override
  PageLoaderAttributes get computedStyle =>
      throw NullPageLoaderElementAccessException('computedStyle', this);

  @override
  PageLoaderAttributes get style =>
      throw NullPageLoaderElementAccessException('style', this);

  @override
  bool get displayed =>
      throw NullPageLoaderElementAccessException('style', this);

  @override
  List<String> get classes =>
      throw NullPageLoaderElementAccessException('classes', this);

  @override
  bool get isFocused =>
      throw NullPageLoaderElementAccessException('isFocused', this);

  @override
  bool get exists => false;

  @override
  Rectangle get offset =>
      throw NullPageLoaderElementAccessException('rectangle', this);

  @override
  Rectangle getBoundingClientRect() =>
      throw NullPageLoaderElementAccessException('getBoundingClientRect', this);

  @override
  List<PageLoaderElement> getElementsByCss(String selector) =>
      throw NullPageLoaderElementAccessException('getElementsBycss', this);

  @override
  Future<void> clear({bool focusBefore = true, bool blurAfter = true}) =>
      throw NullPageLoaderElementAccessException('clear', this);

  @override
  Future<void> click({ClickOption clickOption}) =>
      throw NullPageLoaderElementAccessException('click', this);

  @override
  Future<void> clickOutside() =>
      throw NullPageLoaderElementAccessException('clickOutside', this);

  @override
  Future<void> scroll({int x, int y}) =>
      throw NullPageLoaderElementAccessException('scroll', this);

  @override
  Future<void> scrollIntoView() =>
      throw NullPageLoaderElementAccessException('scrollIntoView', this);

  @override
  Future<void> type(String keys,
          {bool focusBefore = true, bool blurAfter = true}) =>
      throw NullPageLoaderElementAccessException('type', this);

  @override
  Future<void> typeSequence(PageLoaderKeyboard keys) =>
      throw NullPageLoaderElementAccessException('typeSequence', this);

  @override
  Future<void> focus() =>
      throw NullPageLoaderElementAccessException('focus', this);

  @override
  Future<void> blur() =>
      throw NullPageLoaderElementAccessException('blur', this);

  @override
  String toStringDeep() => 'NullPageLoaderElement';

  @override
  String testCreatorGetters() =>
      throw NullPageLoaderElementAccessException('testCreatorGetters', this);

  @override
  String testCreatorMethods() =>
      throw NullPageLoaderElementAccessException('testCreatorMethods', this);
}

class NullPageLoaderElementAccessException extends PageLoaderException {
  NullPageLoaderElementAccessException(
      String callName, PageLoaderElement element)
      : super(
            "'$callName' cannot be called on a NullPageLoaderElement."
            'To avoid this error, ensure that the PageLoaderElement or '
            'PageObject being called (directly or indirectly) with '
            "'$callName' has been checked for existence.",
            element);
}
