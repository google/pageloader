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
Matcher notExists = isNot(exists);

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

/// A matcher that matches the given matcher against an element's inner text.
Matcher hasInnerText(matcher) => _HasInnerText(matcher);

const _item = 'PageLoaderElement/PageObject';

class _Exists extends Matcher {
  const _Exists();

  @override
  bool matches(item, Map matchState) => utils.exists(item);

  @override
  Description describe(Description description) =>
      description.add('$_item exists');
}

class _HasClass extends Matcher {
  final String className;

  _HasClass(this.className);

  @override
  bool matches(item, Map matchState) => utils.hasClass(item, className);

  @override
  Description describe(Description description) =>
      description.add("$_item contains class '$className'");
}

class _IsDisplayed extends Matcher {
  const _IsDisplayed();

  @override
  bool matches(item, Map matchState) => utils.isDisplayed(item);

  @override
  Description describe(Description description) =>
      description.add('$_item is displayed');
}

class _IsHidden extends Matcher {
  const _IsHidden();

  @override
  bool matches(item, Map matchState) => utils.isHidden(item);

  @override
  Description describe(Description description) =>
      description.add('PageLoaderElement/PageObject is hidden');
}

class _IsFocused extends Matcher {
  const _IsFocused();

  @override
  bool matches(item, Map matchState) => utils.isFocused(item);

  @override
  Description describe(Description description) =>
      description.add('$_item is focused');
}

class _HasInnerText extends CustomMatcher {
  _HasInnerText(matcher)
      : super("Has inner text that is", "inner text", matcher);

  @override
  dynamic featureValueOf(item) => utils.getInnerText(item);
}
