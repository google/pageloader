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

import 'package:pageloader/pageloader.dart';
import 'package:pageloader/testing.dart';
import 'package:test/test.dart';

import 'generation_test_setup/dummy_page_loader_element.dart'
    show DummyPageLoaderElement, DummyPageLoaderAttributes;

void main() {
  test('exists', () {
    final context = DummyPageLoaderElement(exists: true);
    final po = DummyPO(context);

    expect(context, exists);
    expect(po, exists);
  });

  group('exists violation - ', () {
    test('invalid type', () {
      final description = exists
          .describeMismatch('foo', StringDescription(), null, null)
          .toString();
      expect(
          description,
          contains('must be `PageLoaderElement` type, a PageObject type '
              '(class with `@PageObject` annotation), '
              'or a `PageObjectList` type'));
    });

    test('PageObjectList contains zero elements', () {
      final list = PageObjectList<PageLoaderElement>(
          <PageLoaderElement>[], (PageLoaderElement e) => e);
      final description = exists
          .describeMismatch(list, StringDescription(), null, null)
          .toString();
      expect(
          description,
          contains(
              'is a `PageObjectList` and must contain at least one element '
              'of `PageLoaderElement` type or a PageObject type'
              '(class with `@PageObject` annotation); '
              'currently contains zero elements'));
    });

    test('non-existing PageLoaderElement', () {
      final ple = DummyPageLoaderElement(exists: false);
      final description = exists
          .describeMismatch(ple, StringDescription(), null, null)
          .toString();
      expect(description,
          contains('is a `PageLoaderElement`, but does not exist'));
    });

    test('non-existing PageObject', () {
      final po = DummyPO(DummyPageLoaderElement(exists: false));
      final description = exists
          .describeMismatch(po, StringDescription(), null, null)
          .toString();
      expect(description, contains('root `PageLoaderElement` does not exist'));
    });
  });

  test('notExists', () {
    final context = DummyPageLoaderElement(exists: false);
    final po = DummyPO(context);

    expect(context, notExists);
    expect(po, notExists);
  });

  group('notExists violation - ', () {
    test('invalid type', () {
      final description = notExists
          .describeMismatch('foo', StringDescription(), null, null)
          .toString();
      expect(
          description,
          contains('must be `PageLoaderElement` type, a PageObject type '
              '(class with `@PageObject` annotation), '
              'or a `PageObjectList` type'));
    });

    test('PageObjectList contains non-zero elements', () {
      final list = PageObjectList<PageLoaderElement>(
          <PageLoaderElement>[DummyPageLoaderElement(exists: true)],
          (PageLoaderElement e) => e);
      final description = notExists
          .describeMismatch(list, StringDescription(), null, null)
          .toString();
      expect(
          description,
          contains(
              'is a `PageObjectList` and must contain exactly zero elements; '
              'currently contains 1 element(s)'));
    });

    test('existing PageLoaderElement', () {
      final ple = DummyPageLoaderElement(exists: true);
      final description = notExists
          .describeMismatch(ple, StringDescription(), null, null)
          .toString();
      expect(description, contains('is a `PageLoaderElement` and exists'));
    });

    test('non-existing PageObject', () {
      final po = DummyPO(DummyPageLoaderElement(exists: true));
      final description = notExists
          .describeMismatch(po, StringDescription(), null, null)
          .toString();
      expect(description, contains('root `PageLoaderElement` exists'));
    });
  });

  test('hasClass', () {
    final context = DummyPageLoaderElement(classes: ['foo']);
    final po = DummyPO(context);

    expect(context, hasClass('foo'));
    expect(po, hasClass('foo'));
  });

  test('isDisplayed', () {
    final context = DummyPageLoaderElement(displayed: true);
    final po = DummyPO(context);

    expect(context, isDisplayed);
    expect(po, isDisplayed);
  });

  test('isNotDisplayed', () {
    final context = DummyPageLoaderElement(displayed: false);
    final po = DummyPO(context);

    expect(context, isNotDisplayed);
    expect(po, isNotDisplayed);
  });

  test('isHidden', () {
    final context1 = DummyPageLoaderElement();
    (context1.computedStyle as DummyPageLoaderAttributes)['visibility'] =
        'hidden';
    final context2 = DummyPageLoaderElement();
    (context2.computedStyle as DummyPageLoaderAttributes)['visibility'] =
        'collapse';

    final po1 = DummyPO(context1);
    final po2 = DummyPO(context2);

    expect(context1, isHidden);
    expect(context2, isHidden);
    expect(po1, isHidden);
    expect(po2, isHidden);
  });

  test('isNotHidden', () {
    final context = DummyPageLoaderElement();
    final po = DummyPO(context);

    expect(context, isNotHidden);
    expect(po, isNotHidden);
  });

  test('isFocused', () {
    final context = DummyPageLoaderElement(focused: true);
    final po = DummyPO(context);

    expect(context, isFocused);
    expect(po, isFocused);
  });

  test('isNotFocused', () {
    final context = DummyPageLoaderElement(focused: false);
    final po = DummyPO(context);

    expect(context, isNotFocused);
    expect(po, isNotFocused);
  });

  test('isVisible', () {
    final context = DummyPageLoaderElement();
    final po = DummyPO(context);

    expect(context, isVisible);
    expect(po, isVisible);
  });

  test('isNotVisible', () {
    final context1 = DummyPageLoaderElement();
    (context1.computedStyle as DummyPageLoaderAttributes)['visibility'] =
        'hidden';
    final context2 = DummyPageLoaderElement();
    (context2.computedStyle as DummyPageLoaderAttributes)['visibility'] =
        'collapse';
    final context3 = DummyPageLoaderElement(exists: false);
    final context4 = DummyPageLoaderElement(displayed: false);

    final po1 = DummyPO(context1);
    final po2 = DummyPO(context2);
    final po3 = DummyPO(context3);
    final po4 = DummyPO(context4);

    expect(context1, isNotVisible);
    expect(context2, isNotVisible);
    expect(context3, isNotVisible);
    expect(context4, isNotVisible);
    expect(po1, isNotVisible);
    expect(po2, isNotVisible);
    expect(po3, isNotVisible);
    expect(po4, isNotVisible);
  });
}

class DummyPO {
  // ignore: non_constant_identifier_names
  final PageLoaderElement __root__;

  PageLoaderElement get $root => __root__;

  DummyPO(this.__root__);
}
