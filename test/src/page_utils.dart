// @dart = 2.9

// Copyright 2019 Google Inc. All rights reserved.
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

part 'page_utils.g.dart';

typedef GetNewContext = PageLoaderElement Function();

void runTests(GetNewContext contextGenerator) {
  group('page_utils', () {
    group('focused', () {
      test('returns body initially', () {
        final page = PageForPageUtilsTests.create(contextGenerator());
        expect(page.rootElement.utils.focused.name, equals('body'));
      });

      test('returns element that has focus', () async {
        final page = PageForPageUtilsTests.create(contextGenerator());
        await page.textInput.focus();
        expect(page.rootElement.utils.focused.id, equals(page.textInput.id));
      });
    });
  });
}

@PageObject()
abstract class PageForPageUtilsTests {
  PageForPageUtilsTests();
  factory PageForPageUtilsTests.create(PageLoaderElement context) =
      $PageForPageUtilsTests.create;

  @root
  PageLoaderElement get rootElement;

  @ById('text')
  PageLoaderElement get textInput;
}
