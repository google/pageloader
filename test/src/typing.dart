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

import 'package:pageloader3/pageloader.dart';
import 'package:test/test.dart';

part 'typing.g.dart';

typedef PageLoaderElement GetNewContext();

void runTests(GetNewContext contextGenerator) {
  group('typing', () {
    test('Type into textarea', () async {
      final page = new PageForTextAreaTypingText.create(contextGenerator());
      await page.textArea.type('some');
      expect(page.textArea.properties['value'], 'some');
      await page.textArea.type(' string');
      expect(page.textArea.properties['value'], 'some string');
      await page.textArea.clear();
      expect(page.textArea.properties['value'], '');
    });

    test('typing should append', () async {
      final page = new PageForTypingTests.create(contextGenerator());
      expect(page.text.properties['value'], '');
      await page.text.type('some text');
      expect(page.text.properties['value'], 'some text');
      await page.text.type(' and more text');
      expect(page.text.properties['value'], 'some text and more text');
    });

    test('value after clear', () async {
      final page = new PageForTypingTests.create(contextGenerator());
      expect(page.text.properties['value'], '');
      await page.text.type('some text');
      expect(page.text.properties['value'], 'some text');
      await page.text.clear();
      expect(page.text.properties['value'], '');
    });
  });
}

@PageObject()
abstract class PageForTextAreaTypingText {
  PageForTextAreaTypingText();
  factory PageForTextAreaTypingText.create(PageLoaderElement context) =
      $PageForTextAreaTypingText.create;

  @ById('textarea')
  PageLoaderElement get textArea;
}

@PageObject()
abstract class PageForTypingTests {
  PageForTypingTests();
  factory PageForTypingTests.create(PageLoaderElement context) =
      $PageForTypingTests.create;

  @ById('text')
  PageLoaderElement get text;
}
