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

library pageloader.async.test.shadow_dom;

import 'package:matcher/matcher.dart';
import 'package:pageloader/async/objects.dart';
import 'package:unittest/unittest.dart';
import 'shared.dart';

void runTests() {
  group('shadow dom tests', () {
    test('shadow dom', () async {
      PageForShadowDomTest page =
          await loader.getInstance(PageForShadowDomTest);

      expect(await page.button1.button.visibleText, contains('button 1'));
      expect(await page.button1.button.visibleText, contains('some'));
      expect(await page.button2.button.visibleText, contains('button 2'));
      expect(await page.button2.button.visibleText, contains('some'));
      if (loader.useShadowDom) {
        expect(page.shouldBeEmpty, hasLength(0));
      }
    });

    test('WithVisibleText in shadow dom', () async {
      PageForShadowDomWithVisibleTextTest page =
          await loader.getInstance(PageForShadowDomWithVisibleTextTest);

      expect(await page.button1.visibleText, contains('button 1'));
      expect(await page.button1.visibleText, contains('some'));
    });

    test('WithInnerText in shadow dom', () async {
      if (!loader.useShadowDom) {
        // if shadow dom is disabled, then visibleText and innerText are
        // identical
        return;
      }
      PageForShadowDomWithInnerTextTest page =
          await loader.getInstance(PageForShadowDomWithInnerTextTest);

      expect(page.shouldBeEmpty, isEmpty);
      expect(await page.button1.visibleText, contains('button 1'));
      expect(await page.button1.visibleText, contains('some'));
      expect(await page.button1.innerText, contains('button 1'));
      expect(await page.button1.innerText, isNot(contains('some')));
    });

    test('text methods on shadow root', () async {
      PageForTextOnShadowRootTest page =
          await loader.getInstance(PageForTextOnShadowRootTest);

      expect(page.buttons, hasLength(3));
      expect(await (await page.buttons[1].shadowRoot).visibleText,
          contains('button 1'));
      expect(await (await page.buttons[1].shadowRoot).visibleText,
          contains('some'));
      expect(await (await page.buttons[2].shadowRoot).visibleText,
          contains('button 2'));
      expect(await (await page.buttons[2].shadowRoot).visibleText,
          contains('some'));
      if (loader.useShadowDom) {
        expect(await (await page.buttons[1].shadowRoot).innerText,
            isNot(contains('button 1')));
      } else {
        expect(await (await page.buttons[1].shadowRoot).innerText,
            contains('button 1'));
      }
      expect(
          await (await page.buttons[1].shadowRoot).innerText, contains('some'));
      if (loader.useShadowDom) {
        expect(await (await page.buttons[2].shadowRoot).innerText,
            isNot(contains('button 2')));
      } else {
        expect(await (await page.buttons[2].shadowRoot).innerText,
            contains('button 2'));
      }
      expect(
          await (await page.buttons[2].shadowRoot).innerText, contains('some'));
    });
  });
}

class PageForShadowDomTest {
  @ById('button-1')
  ButtonShadowDOM button1;

  @ById('button-2')
  ButtonShadowDOM button2;

  @ById('inner')
  List<PageLoaderElement> shouldBeEmpty;
}

@InShadowDom()
class ButtonShadowDOM {
  @ById("inner")
  PageLoaderElement button;
}

class PageForShadowDomWithVisibleTextTest {
  @ByTagName('a-custom-tag')
  @WithVisibleText('some')
  @WithVisibleText('button 1')
  PageLoaderElement button1;
}

class PageForShadowDomWithInnerTextTest {
  @ByTagName('a-custom-tag')
  @WithInnerText('some')
  @WithInnerText('button 1')
  List<PageLoaderElement> shouldBeEmpty;

  @ByTagName('a-custom-tag')
  @WithInnerText('button 1')
  PageLoaderElement button1;
}

class PageForTextOnShadowRootTest {
  @ByTagName('a-custom-tag')
  List<PageLoaderElement> buttons;
}

class PageForOptionalFunctionTest {
  @ByTagName('non-existant')
  @optional
  Lazy shouldBeNull;

  @ById('button-1')
  @optional
  Lazy shouldBeNonNull;
}
