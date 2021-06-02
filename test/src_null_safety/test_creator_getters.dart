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

part 'test_creator_getters.g.dart';

typedef GetNewContext = PageLoaderElement Function();

void runTests(GetNewContext contextGenerator) {
  group('testCreatorGetters', () {
    test('returns unannotated getters', () async {
      final page =
          PageObjectHasGettersAndActions.create(contextGenerator()) as dynamic;
      expect(page.testCreatorGetters(),
          json.encode({'testContext': 'String', 'name': 'String'}));
    });

    test('returns correct return type for each getters', () async {
      final page = PageObjectHasGettersThatUseDifferentReturnTypes.create(
          contextGenerator()) as dynamic;
      expect(
          page.testCreatorGetters(),
          json.encode(
              {'testContext': 'String', 'exists': 'bool', 'size': 'int'}));
    });

    test('returns empty list when no unannotated getter is in the page object',
        () async {
      final page = PageObjectHasNoGetters.create(contextGenerator()) as dynamic;
      expect(page.testCreatorGetters(), '{}');
    });

    test('works with mixin', () async {
      final page = PageObjectWithMixin.create(contextGenerator()) as dynamic;
      expect(
          page.testCreatorGetters(),
          json.encode({
            'tabContext': 'String',
            'tabName': 'String',
            'testContext': 'String',
            'name': 'String'
          }));
    });

    test('works with mixin with proper override', () async {
      // Conflicting types are not allowed, but we should verify no duplicates.
      final page =
          PageObjectWithOverridingMixins.create(contextGenerator()) as dynamic;
      expect(page.testCreatorGetters(),
          json.encode({'tabContext': 'String', 'tabName': 'String'}));
    });
  });
}

@PageObject()
abstract class PageObjectHasGettersAndActions {
  PageObjectHasGettersAndActions();

  factory PageObjectHasGettersAndActions.create(PageLoaderElement context) =
      $PageObjectHasGettersAndActions.create;

  @ByTagName('input')
  PageLoaderElement get input;

  String get testContext => input.visibleText;

  String get name => input.name;

  Future<void> clear(String text) => input.clear();
}

@PageObject()
abstract class PageObjectHasGettersThatUseDifferentReturnTypes {
  PageObjectHasGettersThatUseDifferentReturnTypes();

  factory PageObjectHasGettersThatUseDifferentReturnTypes.create(
          PageLoaderElement context) =
      $PageObjectHasGettersThatUseDifferentReturnTypes.create;

  @ByTagName('input')
  PageLoaderElement get input;

  @ByTagName('input2')
  List<PageLoaderElement> get inputs;

  String get testContext => input.visibleText;

  bool get exists => input.exists;

  int get size => inputs.length;
}

@PageObject()
abstract class PageObjectHasNoGetters {
  PageObjectHasNoGetters();

  factory PageObjectHasNoGetters.create(PageLoaderElement context) =
      $PageObjectHasNoGetters.create;

  @ByTagName('input')
  PageLoaderElement get inputs;

  Future<void> clear(String text) => inputs.clear();
}

@PageObject()
abstract class PageObjectWithMixin with PageObjectMixin {
  PageObjectWithMixin();

  factory PageObjectWithMixin.create(PageLoaderElement context) =
      $PageObjectWithMixin.create;

  @ByTagName('input')
  PageLoaderElement get input;

  String get testContext => input.visibleText;

  String get name => input.name;
}

@PageObject()
abstract class PageObjectMixin {
  @ByTagName('tab')
  PageLoaderElement get tab;

  String get tabContext => tab.visibleText;

  String get tabName => tab.name;
}

@PageObject()
abstract class PageObjectWithOverridingMixins with PageObjectMixin {
  PageObjectWithOverridingMixins();

  factory PageObjectWithOverridingMixins.create(PageLoaderElement context) =
      $PageObjectWithOverridingMixins.create;

  @override
  String get tabContext => '';
}
