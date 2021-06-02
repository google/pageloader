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

part 'typing.g.dart';

typedef GetNewContext = PageLoaderElement? Function();

void runTests(GetNewContext contextGenerator, {isHtmlTest = false}) {
  group('typing', () {
    test('Type into textarea', () async {
      final page = PageForTextAreaTypingText.create(contextGenerator());
      await page.textArea.type('Some');
      expect(page.textArea.properties['value'], 'Some');
      await page.textArea.type(' string');
      expect(page.textArea.properties['value'], 'Some string');
      await page.textArea.clear();
      expect(page.textArea.properties['value'], '');
    });

    test('typing should append', () async {
      final page = PageForTypingTests.create(contextGenerator());
      expect(page.text.properties['value'], '');
      await page.text.type('some Text');
      expect(page.text.properties['value'], 'some Text');
      await page.text.type(' and more Text');
      expect(page.text.properties['value'], 'some Text and more Text');
    });

    test('value after clear', () async {
      final page = PageForTypingTests.create(contextGenerator());
      expect(page.text.properties['value'], '');
      await page.text.type('soMe text');
      expect(page.text.properties['value'], 'soMe text');
      await page.text.clear();
      expect(page.text.properties['value'], '');
    });

    test('repeated caps does not blow up', () async {
      final page = PageForTextAreaTypingText.create(contextGenerator());
      await page.textArea.type('FOO BAR BAZ');
      expect(page.textArea.properties['value'], 'FOO BAR BAZ');
    });

    group('HTML/Webdriver: Special keyboard events are sent', () {
      late PageLoaderKeyboard kb;
      late PageLoaderElement listener;

      setUp(() {
        kb = PageLoaderKeyboard();
        listener = KeyboardListenerPO.create(contextGenerator()).listener;
      });

      test('enter all sent', () async {
        kb.typeSpecialKey(PageLoaderSpecialKey.enter);
        await listener.typeSequence(kb);
        final expected = isHtmlTest
            ? 'Listening: enter keydown; (Enter key value); '
                'enter keypress; '
                'enter keyup; (Enter key value);'
            : 'Listening: enter keydown; enter keypress; enter keyup;';
        expect(listener.visibleText, equals(expected));
      });
    });
  });

  group('typing with focus and blur', () {
    late PageForTypingTestsWithFocusAndBlur page;

    setUp(() {
      page = PageForTypingTestsWithFocusAndBlur.create(contextGenerator());
      expect(page.text.properties['value'], '');
      expect(page.focusCount, 0);
      expect(page.blurCount, 0);
    });

    test('with default type API', () async {
      await page.text.type('soMe text');
      expect(page.text.properties['value'], 'soMe text');
      expect(page.focusCount, 1);
      expect(page.blurCount, 1);
    });

    test('without focusBefore and blurAfter', () async {
      await page.text.focus();
      expect(page.focusCount, 1);
      expect(page.blurCount, 0);

      await page.text.type('soMe text', focusBefore: false, blurAfter: false);
      expect(page.text.properties['value'], 'soMe text');
      expect(page.focusCount, 1);
      expect(page.blurCount, 0);
    });

    // WebDriver sendKey API will scroll to the element (e.g. a focus event)
    // even when it is not focused.
    // https://www.w3.org/TR/webdriver/#dfn-element-send-keys
    test('without focusBefore when not focused', () async {
      await page.text.type('soMe text', focusBefore: false);
      expect(page.text.properties['value'], 'soMe text');
      expect(page.focusCount, isHtmlTest ? 0 : 1);
      // If HTML test, this will be 0 since the focus event never happened.
      expect(page.blurCount, isHtmlTest ? 0 : 1);
    });
  });

  group('clear with focus and blur', () {
    late PageForTypingTestsWithFocusAndBlur page;
    late int focusCount;
    late int blurCount;

    setUp(() {
      page = PageForTypingTestsWithFocusAndBlur.create(contextGenerator());
      focusCount = 0;
      blurCount = 0;
    });

    group('with empty text', () {
      setUp(() async {
        focusCount = 0;
        blurCount = 0;
      });

      test('with default clear API', () async {
        await page.text.clear();
        expect(page.text.properties['value'], '');
        expect(page.focusCount, ++focusCount);
        expect(page.blurCount, ++blurCount);
      });

      test('without focusBefore and blurAfter', () async {
        await page.text.focus();
        expect(page.focusCount, ++focusCount);
        expect(page.blurCount, blurCount);

        await page.text.clear(focusBefore: false, blurAfter: false);
        expect(page.text.properties['value'], '');
        expect(page.focusCount, focusCount);
        expect(page.blurCount, blurCount);
      });
    });

    group('with non-empty text', () {
      setUp(() async {
        await page.text.type('soMe very long text');
        expect(page.text.properties['value'], 'soMe very long text');
        expect(page.focusCount, 1);
        expect(page.blurCount, 1);

        focusCount = 1;
        blurCount = 1;
      });

      test('with default clear API', () async {
        await page.text.clear();
        expect(page.text.properties['value'], '');
        expect(page.focusCount, ++focusCount);
        expect(page.blurCount, ++blurCount);
      });

      test('without focusBefore and blurAfter', () async {
        await page.text.focus();
        expect(page.focusCount, ++focusCount);
        expect(page.blurCount, blurCount);

        await page.text.clear(focusBefore: false, blurAfter: false);
        expect(page.text.properties['value'], '');
        expect(page.focusCount, focusCount);
        expect(page.blurCount, blurCount);
      });
    });
  });

  group('Special keyboard events are sent', () {
    late PageLoaderKeyboard kb;
    late PageLoaderElement listener;

    setUp(() {
      kb = PageLoaderKeyboard();
      listener = KeyboardListenerPO.create(contextGenerator()).listener;
    });

    test('enter only keydown and keypress sent', () async {
      final result = isHtmlTest
          ? 'Listening: enter keydown; (Enter key value); enter keypress;'
          : 'Listening: enter keydown; enter keypress; enter keyup;';
      kb.typeSpecialKey(PageLoaderSpecialKey.enter, keyUp: false);
      await listener.typeSequence(kb);
      expect(listener.visibleText, equals(result));
    });

    test('enter only keyup sent', () async {
      final result = isHtmlTest
          ? 'Listening: enter keyup; (Enter key value);'
          : 'Listening: enter keydown; enter keypress; enter keyup;';
      kb.typeSpecialKey(PageLoaderSpecialKey.enter, keyDown: false);
      await listener.typeSequence(kb);
      expect(listener.visibleText, equals(result));
    });
  });
}

@PageObject()
abstract class PageForTextAreaTypingText {
  PageForTextAreaTypingText();
  factory PageForTextAreaTypingText.create(PageLoaderElement? context) =
      $PageForTextAreaTypingText.create;

  @ById('textarea')
  PageLoaderElement get textArea;
}

@PageObject()
abstract class PageForTypingTests {
  PageForTypingTests();
  factory PageForTypingTests.create(PageLoaderElement? context) =
      $PageForTypingTests.create;

  @ById('text')
  PageLoaderElement get text;
}

@PageObject()
abstract class PageForTypingTestsWithFocusAndBlur {
  PageForTypingTestsWithFocusAndBlur();
  factory PageForTypingTestsWithFocusAndBlur.create(
      PageLoaderElement? context) = $PageForTypingTestsWithFocusAndBlur.create;

  @ById('text-with-focus-and-blur')
  PageLoaderElement get text;

  @ById('text-with-focus-and-blur-focus-count')
  PageLoaderElement get _focusCount;

  @ById('text-with-focus-and-blur-blur-count')
  PageLoaderElement get _blurCount;

  int get focusCount => int.parse(_focusCount.innerText!);

  int get blurCount => int.parse(_blurCount.innerText!);
}

@PageObject()
abstract class KeyboardListenerPO {
  KeyboardListenerPO();
  factory KeyboardListenerPO.create(PageLoaderElement? context) =
      $KeyboardListenerPO.create;

  @ById('keyboard-listener')
  PageLoaderElement get listener;
}
