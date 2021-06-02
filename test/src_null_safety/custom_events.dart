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
import 'package:webdriver/support/async.dart';

part 'custom_events.g.dart';

typedef GetNewContext = PageLoaderElement Function();

void runTests(GetNewContext contextGenerator) {
  group('custom event support', () {
    test('dispatches', () async {
      final page = PageForCustomEventsTest.create(contextGenerator());

      await page.customEventsElement.dispatchCustomEvent('customizedevent');
      await waitFor(() => page.customEventsElement.innerText,
          matcher: contains('CustomizedEvent'));
    });
  });
}

@PageObject()
abstract class PageForCustomEventsTest {
  PageForCustomEventsTest();
  factory PageForCustomEventsTest.create(PageLoaderElement context) =
      $PageForCustomEventsTest.create;

  @ByTagName('custom-events-element')
  PageLoaderElement get customEventsElement;
}
