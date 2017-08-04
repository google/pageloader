// Copyright 2014 Google Inc. All rights reserved.
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

library pageloader.test.display_filtering;

import 'package:pageloader/objects.dart';
import 'package:test/test.dart';
import 'shared.dart';

void runTests() {
  group('display filtering tests', () {
    test('displayed filtering', () async {
      PageForDisplayedFilteringTest page =
          await loaderUtil.getInstance(PageForDisplayedFilteringTest);

      expect(page.shouldHaveOneElement, hasLength(1));
      expect(page.shouldBeEmpty, isEmpty);
      expect(page.shouldAlsoBeEmpty, isEmpty);
    });
  });
}

class PageForDisplayedFilteringTest {
  @ById('div')
  @disableDisplayedCheck
  List<PageLoaderElement> shouldHaveOneElement;

  @ById('div')
  List<PageLoaderElement> shouldBeEmpty;

  @ById('div')
  @IsDisplayed()
  @disableDisplayedCheck
  List shouldAlsoBeEmpty;
}
