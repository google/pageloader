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
import 'package:test/test.dart';

part 'test_creator_methods.g.dart';

typedef GetNewContext = PageLoaderElement Function();

void runTests(GetNewContext contextGenerator) {
  group('testCreatorMethods', () {
    test('returns methods with proper types', () async {
      final page = PageObjectHasPropertiesAndMethods.create(contextGenerator())
          as dynamic;
      expect(
          page.testCreatorMethods(),
          json.encode({
            'clear': [
              {'name': 'text', 'kind': 'required', 'type': 'String'}
            ],
            'getLength': []
          }));
    });

    test('returns correct return type for each method', () async {
      final page =
          PageObjectHasMethodsWithDifferentParameters.create(contextGenerator())
              as dynamic;
      expect(
          page.testCreatorMethods(),
          json.encode({
            'click': [],
            'type': [
              {'name': 'index', 'kind': 'required', 'type': 'int'},
              {
                'name': 'text',
                'kind': 'named',
                'type': 'String',
                'default': null
              }
            ],
            'cut': [
              {'name': 'start', 'kind': 'required', 'type': 'int'},
              {
                'name': 'end',
                'kind': 'positional',
                'type': 'int',
                'default': '12'
              }
            ],
            'defaultString': [
              {
                'name': 'end',
                'kind': 'positional',
                'type': 'String',
                'default': "'23'"
              }
            ],
            'defaultBool': [
              {
                'name': 'end',
                'kind': 'named',
                'type': 'bool',
                'default': 'true'
              }
            ],
            'varm': [
              {'name': 'x', 'kind': 'required', 'type': 'var'}
            ]
          }));
    });

    test('returns empty list when no method is in the page object', () async {
      final page = PageObjectHasNoMethods.create(contextGenerator()) as dynamic;
      expect(page.testCreatorMethods(), json.encode({}));
    });

    test('works with mixin', () async {
      final page = PageObjectWithMixin.create(contextGenerator()) as dynamic;
      expect(
          page.testCreatorMethods(),
          json.encode({
            'click': [],
            'cut': [
              {'name': 'start', 'kind': 'required', 'type': 'int'},
              {
                'name': 'end',
                'kind': 'positional',
                'type': 'int',
                'default': '12'
              }
            ]
          }));
    });

    test('works with mixin with proper override', () async {
      // Conflicting types are not allowed, but we should verify no duplicates.
      final page =
          PageObjectWithOverridingMixins.create(contextGenerator()) as dynamic;
      expect(
          page.testCreatorMethods(),
          json.encode({
            'click': [],
            'cut': [
              {'name': 'start', 'kind': 'required', 'type': 'int'},
              {
                'name': 'end',
                'kind': 'positional',
                'type': 'int',
                'default': '12'
              }
            ],
            'varm': [
              {'name': 'x', 'kind': 'required', 'type': 'var'}
            ]
          }));
    });
  });
}

@PageObject()
abstract class PageObjectHasPropertiesAndMethods {
  PageObjectHasPropertiesAndMethods();

  factory PageObjectHasPropertiesAndMethods.create(PageLoaderElement context) =
      $PageObjectHasPropertiesAndMethods.create;

  @ByTagName('input')
  PageLoaderElement get input;

  String get testContext => input.visibleText;

  String get name => input.name;

  Future<void> clear(String text) => input.clear();

  Future<int> getLength() => Future.value(0);

  void badClear(String text) => input.clear();
}

@PageObject()
abstract class PageObjectHasMethodsWithDifferentParameters {
  PageObjectHasMethodsWithDifferentParameters();

  factory PageObjectHasMethodsWithDifferentParameters.create(
          PageLoaderElement context) =
      $PageObjectHasMethodsWithDifferentParameters.create;

  Future<void> click() => Future.value(null);

  Future<void> type(int index, {String? text}) => Future.value(null);

  Future<void> cut(int start, [int end = 12]) => Future.value(null);

  Future<void> defaultString([String end = '23']) => Future.value(null);

  Future<void> defaultBool({bool end = true}) => Future.value(null);

  Future<void> varm(var x) => Future.value(null);
}

@PageObject()
abstract class PageObjectHasNoMethods {
  PageObjectHasNoMethods();

  factory PageObjectHasNoMethods.create(PageLoaderElement context) =
      $PageObjectHasNoMethods.create;

  @ByTagName('input')
  PageLoaderElement get inputs;
}

@PageObject()
abstract class PageObjectWithMixin with PageObjectMixin {
  PageObjectWithMixin();

  factory PageObjectWithMixin.create(PageLoaderElement context) =
      $PageObjectWithMixin.create;

  @ByTagName('input')
  PageLoaderElement get input;

  Future<void> cut(int start, [int end = 12]) => Future.value(null);
}

@PageObject()
abstract class PageObjectMixin {
  @ByTagName('tab')
  PageLoaderElement get tab;

  Future<void> click() => Future.value(null);
}

@PageObject()
abstract class PageObjectWithOverridingMixins with PageObjectMixin {
  PageObjectWithOverridingMixins();

  factory PageObjectWithOverridingMixins.create(PageLoaderElement context) =
      $PageObjectWithOverridingMixins.create;

  Future<void> cut(int start, [int end = 12]) => Future.value(null);

  @override
  Future<void> click() => Future.value(null);

  Future<void> varm(var x) => Future.value(null);
}
