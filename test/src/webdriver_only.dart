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

part 'webdriver_only.g.dart';

typedef PageLoaderElement GetNewContext();

typedef void DoRefresh();

// Tests that are specific to WebDriver.
void runTests(GetNewContext contextGenerator) {
  group('webdriver ', () {
    test('computes offset sensibly', () async {
      final webdriverOnly = new WebDriverOnly.create(contextGenerator());
      expect(webdriverOnly.button1.offset.width, greaterThan(300));
      expect(webdriverOnly.button1.offset.height, greaterThan(300));
    });

    test('computes bounding rect sensibly', () async {
      final webdriverOnly = new WebDriverOnly.create(contextGenerator());
      final boundingRect = webdriverOnly.button1.getBoundingClientRect();
      expect(boundingRect.height, greaterThan(300));
      expect(boundingRect.width, greaterThan(300));
    });
  });
}

@PageObject()
abstract class WebDriverOnly {
  WebDriverOnly();
  factory WebDriverOnly.create(PageLoaderElement context) =
      $WebDriverOnly.create;

  @ById('button-1')
  PageLoaderElement get button1;
}
