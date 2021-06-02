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

part 'test_creator_invoke_method.g.dart';

typedef GetNewContext = PageLoaderElement Function();

void runTests(GetNewContext contextGenerator) {
  group('testCreatorInvokeMethod', () {
    late dynamic page;

    group('without mixin', () {
      setUp(() {
        page = PageObjectHasGettersAndMethods.create(contextGenerator());
      });

      test('should handle unannotated getters', () {
        expect(page.testCreatorInvokeMethod('getter', []), 'str');
      });

      test('should handle single finder', () {
        expect(page.testCreatorInvokeMethod('po', []) is PageLoaderElement,
            isTrue);
      });

      test('should handle list finder', () {
        expect(page.testCreatorInvokeMethod('poList', []) is List, isTrue);
      });

      test('should handle empty unannotated method', () {
        expect(page.testCreatorInvokeMethod('emptyFn', []), isNull);
      });

      test('should handle complex unannotated method', () async {
        expect(
            await page
                .testCreatorInvokeMethod('complexFn', ['s', 1, 2.5, true]),
            1);
      });
    });

    group('with mixin', () {
      setUp(() {
        page =
            PageObjectHasGettersAndMethodsWithMixin.create(contextGenerator());
      });

      test('should handle unannotated getters', () {
        expect(page.testCreatorInvokeMethod('getter', []), 'str');
      });

      test('should handle single finder', () {
        expect(page.testCreatorInvokeMethod('po', []) is PageLoaderElement,
            isTrue);
        expect(page.testCreatorInvokeMethod('po2', []) is PageLoaderElement,
            isTrue);
      });

      test('should handle list finder', () {
        expect(page.testCreatorInvokeMethod('poList', []) is List, isTrue);
        expect(page.testCreatorInvokeMethod('poList2', []) is List, isTrue);
      });

      test('should handle empty unannotated method', () {
        expect(page.testCreatorInvokeMethod('emptyFn', []), isNull);
      });

      test('should handle complex unannotated method', () async {
        expect(
            await page
                .testCreatorInvokeMethod('complexFn', ['s', 1, 2.5, true]),
            1);
      });

      test('should handle override unannotated method', () async {
        expect(await page.testCreatorInvokeMethod('intFn', []), 3);
      });
    });
  });
}

@PageObject()
abstract class PageObjectHasGettersAndMethods {
  PageObjectHasGettersAndMethods();

  factory PageObjectHasGettersAndMethods.create(PageLoaderElement context) =
      $PageObjectHasGettersAndMethods.create;

  @ByTagName('input')
  PageLoaderElement get po;

  @ByTagName('div')
  List<PageLoaderElement> get poList;

  String get getter => 'str';

  void emptyFn() {}

  Future<int> complexFn(
          String str, int number, double float, bool boolean) async =>
      1;
}

@PageObject()
abstract class PageObjectHasGettersAndMethodsWithMixin extends Object
    with PageObjectMixinHasGettersAndMethods, RightMostPageObjectMixin {
  PageObjectHasGettersAndMethodsWithMixin();

  factory PageObjectHasGettersAndMethodsWithMixin.create(
          PageLoaderElement context) =
      $PageObjectHasGettersAndMethodsWithMixin.create;

  @ByTagName('input')
  PageLoaderElement get po;

  @ByTagName('div')
  List<PageLoaderElement> get poList;

  @override
  String get getter => 'str';

  @override
  void emptyFn() {}

  @override
  Future<int> complexFn(
          String str, int number, double float, bool boolean) async =>
      1;
}

@PageObject()
abstract class PageObjectMixinHasGettersAndMethods {
  @ByTagName('input')
  PageLoaderElement get po2;

  @ByTagName('div')
  List<PageLoaderElement> get poList2;

  String get getter => 'str2';

  void emptyFn() {}

  int intFn() => 2;

  Future<int> complexFn(
          String str, int number, double float, bool boolean) async =>
      2;
}

@PageObject()
abstract class RightMostPageObjectMixin {
  int intFn() => 3;
}
