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

library pageloader.test.typing;

import 'package:pageloader/objects.dart';
import 'package:test/test.dart';
import 'shared.dart';

void runTests() {
  group('typing tests', () {
    test('Type into textarea', () async {
      PageForTextAreaTypingText page =
          await loader.getInstance(PageForTextAreaTypingText);
      await page.textArea.type('some');
      expect(await page.textArea.seleniumAttributes['value'], 'some');
      await page.textArea.type(' string');
      expect(await page.textArea.seleniumAttributes['value'], 'some string');
      await page.textArea.clear();
      expect(await page.textArea.seleniumAttributes['value'], '');
    });

    test('typing should append', () async {
      PageForTypingTests page = await loader.getInstance(PageForTypingTests);
      expect(await page.text.seleniumAttributes['value'], '');
      await page.text.type('some text');
      expect(await page.text.seleniumAttributes['value'], 'some text');
      await page.text.type(' and more text');
      expect(await page.text.seleniumAttributes['value'], 'some text and more text');
    });

    test('value after clear', () async {
      PageForTypingTests page = await loader.getInstance(PageForTypingTests);
      expect(await page.text.seleniumAttributes['value'], '');
      await page.text.type('some text');
      expect(await page.text.seleniumAttributes['value'], 'some text');
      await page.text.clear();
      expect(await page.text.seleniumAttributes['value'], '');
    });
  });
}

class PageForTextAreaTypingText {
  @ById('textarea')
  PageLoaderElement textArea;
}

class PageForTypingTests {
  @ById('text')
  PageLoaderElement text;
}
