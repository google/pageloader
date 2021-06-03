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

import 'package:matcher/matcher.dart';
import 'package:pageloader/utils.dart' as utils;

/// A matcher that checks if a PageLoaderElement/PageObject exists.
const Matcher exists = _Exists();

/// A matcher that checks if a PageLoaderElement/PageObject does not exist.
const Matcher notExists = _NotExists();

/// A matcher that checks if a PageLoaderElement/PageObject
/// contains given class.
Matcher hasClass(String className) => _HasClass(className);

/// A matcher that checks if a PageLoaderElement/PageObject is displayed
/// based on "display" style.
const Matcher isDisplayed = _IsDisplayed();

/// A matcher that checks if a PageLoaderElement/PageObject is not displayed
/// based on "display" style.
Matcher isNotDisplayed = isNot(isDisplayed);

/// A matcher that checks if a PageLoaderElement/PageObject is hidden.
///
/// Checks that the item's `visibility` is `hidden` or `collapse`.
/// Does not check whether the item has been hidden by other means, e.g., being
/// obscured by other elements.
const Matcher isHidden = _IsHidden();

/// A matcher that checks if a PageLoaderElement/PageObject is not hidden.
Matcher isNotHidden = isNot(isHidden);

/// A matcher that checks if PageLoaderElement/PageObject is focused.
const Matcher isFocused = _IsFocused();

/// A matcher that checks if PageLoaderElement/PageObject is not focused.
Matcher isNotFocused = isNot(isFocused);

/// A matcher that checks if PageLoaderElement/PageObject is visible.
///
/// A PageLoaderElement/PageObject is considered visible if it:
/// *   exists
/// *   isDisplayed
/// *   isNotHidden
const Matcher isVisible = _IsVisible();

/// A matcher that checks if PageLoaderElement/PageObject is not visible.
Matcher isNotVisible = isNot(isVisible);

/// A matcher that matches the given matcher against an element's inner text.
Matcher hasInnerText(matcher) => _HasInnerText(matcher);

const _item = 'PageLoaderElement/PageObject/PageObjectList';

const _invalidTypeMessage = 'must be `PageLoaderElement` type, '
    'a PageObject type (class with `@PageObject` annotation), or a '
    '`PageObjectList` type';

class _Exists extends Matcher {
  const _Exists();

  @override
  bool matches(item, Map<Object?, Object?> matchState) => utils.exists(item);

  @override
  Description describe(Description description) =>
      description.add('$_item exists');

  @override
  Description describeMismatch(dynamic item, Description mismatchDescription,
      Map matchState, bool verbose) {
    if (utils.isPageObjectList(item)) {
      return mismatchDescription.add(
          '$item is a `PageObjectList` and must contain at least one element '
          'of `PageLoaderElement` type or a PageObject type'
          '(class with `@PageObject` annotation); '
          'currently contains zero elements');
    }
    try {
      utils.rootElementOf(item);
    } on utils.PageLoaderArgumentError {
      return mismatchDescription.add('$item $_invalidTypeMessage');
    }

    if (utils.isPageLoaderElement(item)) {
      return mismatchDescription
          .add('$item is a `PageLoaderElement`, but does not exist');
    }
    return mismatchDescription
        .add('${item}s root `PageLoaderElement` does not exist');
  }
}

class _NotExists extends Matcher {
  const _NotExists();

  @override
  bool matches(item, Map<Object?, Object?> matchState) => !utils.exists(item);

  @override
  Description describe(Description description) =>
      description.add('$_item does not exist');

  @override
  Description describeMismatch(dynamic item, Description mismatchDescription,
      Map matchState, bool verbose) {
    if (utils.isPageObjectList(item)) {
      return mismatchDescription.add(
          '$item is a `PageObjectList` and must contain exactly zero elements; '
          'currently contains ${item.length} element(s)');
    }
    try {
      utils.rootElementOf(item);
    } on utils.PageLoaderArgumentError {
      return mismatchDescription.add('$item $_invalidTypeMessage');
    }
    if (utils.isPageLoaderElement(item)) {
      return mismatchDescription
          .add('${item}s is a `PageLoaderElement` and exists');
    }
    return mismatchDescription.add('${item}s root `PageLoaderElement` exists');
  }
}

class _HasClass extends Matcher {
  final String className;

  _HasClass(this.className);

  @override
  bool matches(item, Map<Object?, Object?> matchState) =>
      utils.hasClass(item, className);

  @override
  Description describe(Description description) =>
      description.add("$_item contains class '$className'");
}

class _IsDisplayed extends Matcher {
  const _IsDisplayed();

  @override
  bool matches(item, Map<Object?, Object?> matchState) =>
      utils.isDisplayed(item);

  @override
  Description describe(Description description) =>
      description.add('$_item is displayed');
}

class _IsHidden extends Matcher {
  const _IsHidden();

  @override
  bool matches(item, Map<Object?, Object?> matchState) => utils.isHidden(item);

  @override
  Description describe(Description description) =>
      description.add('PageLoaderElement/PageObject is hidden');
}

class _IsFocused extends Matcher {
  const _IsFocused();

  @override
  bool matches(item, Map<Object?, Object?> matchState) => utils.isFocused(item);

  @override
  Description describe(Description description) =>
      description.add('$_item is focused');

  @override
  Description describeMismatch(dynamic item, Description mismatchDescription,
      Map matchState, bool verbose) {
    try {
      final e = utils.rootElementOf(item);

      // Lowercasing because it's a bit easier to read.
      final itemId = e.id.toLowerCase();
      final focusId = e.utils.focused.id.toLowerCase();

      // Find the common prefix xpath.
      var common = 0;
      for (var i = 0; i < itemId.length && i < focusId.length; i++) {
        if (itemId[i] != focusId[i]) break;
        if (itemId[i] == '/') common = i;
      }

      final commonPrefix = itemId.substring(0, common);
      final focusSuffix = focusId.substring(common + 1);
      final itemSuffix = itemId.substring(common + 1);
      return mismatchDescription.add(
          '$focusSuffix was focused instead of $itemSuffix (in $commonPrefix)');
    } on utils.PageLoaderArgumentError {
      return mismatchDescription.add('$item $_invalidTypeMessage');
    }
  }
}

class _IsVisible extends Matcher {
  const _IsVisible();

  @override
  bool matches(item, Map<Object?, Object?> matchState) => utils.isVisible(item);

  @override
  Description describe(Description description) =>
      description.add('$_item is visible');
}

class _HasInnerText extends CustomMatcher {
  _HasInnerText(matcher)
      : super('Has inner text that is', 'inner text', matcher);

  @override
  dynamic featureValueOf(item) => utils.getInnerText(item);
}
