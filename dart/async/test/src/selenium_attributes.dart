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

library pageloader.test.selenium_attributes;

import 'package:pageloader/objects.dart';
import 'package:test/test.dart';
import 'shared.dart';

void runTests() {
  group('seleniumAttributes', () {
    test('style', () async {
      var page = await loaderUtil.getInstance(PageForSeleniumAttributesTests);
      // According to the spec, red below should be returned as an
      // RGBA value.
      expect(await page.divWithStyle.seleniumAttributes['style'],
          'display: none; background-color: red;');
      expect(await page.divWithStyle.seleniumAttributes['STYLE'],
          'display: none; background-color: red;');
      expect(await page.divWithStyle.seleniumAttributes['StYlE'],
          'display: none; background-color: red;');
    });

    test('checked', () async {
      var page = await loaderUtil.getInstance(PageForSeleniumAttributesTests);
      expect(await page.checkbox.seleniumAttributes['checked'], isNull);
      await page.checkbox.click();
      print('----HERE-----');
      print(await page.checkbox.properties['checked']);
      print(await page.checkbox.attributes['checked']);
      print(await page.checkbox.seleniumAttributes['checked']);
      expect(await page.checkbox.seleniumAttributes['checked'], 'true');
    });

    test('disabled', () async {
      var page = await loaderUtil.getInstance(PageForSeleniumAttributesTests);
      expect(await page.readOnly.seleniumAttributes['disabled'], 'true');
      expect(await page.text.seleniumAttributes['disabled'], isNull);
    });

    test('not a property', () async {
      var page = await loaderUtil.getInstance(PageForSeleniumAttributesTests);
      expect(await page.table.seleniumAttributes['non-standard'],
          'a non standard attr');
    });

    test('option values', () async {
      var page = await loaderUtil.getInstance(PageForSeleniumAttributesTests);
      // The expects below are according to the WebDriver spec, but currently
      // fail
      // expect(page.option1.seleniumAttributes['value'], 'option 1');
      // expect(page.option1.seleniumAttributes['VaLuE'], 'option 1');
      expect(await page.option2.seleniumAttributes['value'], 'value 2');
      expect(await page.option2.seleniumAttributes['VaLuE'], 'value 2');
    });

    test('option selected', () async {
      var page = await loaderUtil.getInstance(PageForSeleniumAttributesTests);
      await page.option2.click();
      expect(await page.select1.seleniumAttributes['value'], equals('value 2'));
    });

    test('selected on checkbox', () async {
      var page = await loaderUtil.getInstance(PageForSeleniumAttributesTests);
      expect(await page.checkbox.seleniumAttributes['selected'], isNull);
      expect(await page.checkbox.seleniumAttributes['SeLeCtEd'], isNull);
      await page.checkbox.click();
      expect(await page.checkbox.seleniumAttributes['selected'], 'true');
      expect(await page.checkbox.seleniumAttributes['SeLeCtEd'], 'true');
    });

    test('selected on radio', () async {
      var page = await loaderUtil.getInstance(PageForSeleniumAttributesTests);
      expect(await page.radio.seleniumAttributes['selected'], isNull);
      expect(await page.radio.seleniumAttributes['SeLeCtEd'], isNull);
      await page.radio.click();
      expect(await page.radio.seleniumAttributes['selected'], 'true');
      expect(await page.radio.seleniumAttributes['SeLeCtEd'], 'true');
    });

    test('href on a', () async {
      var page = await loaderUtil.getInstance(PageForSeleniumAttributesTests);
      expect(
          await page.anchor.seleniumAttributes['href'], endsWith('/test.html'));
    });

    test('src on img', () async {
      var page = await loaderUtil.getInstance(PageForSeleniumAttributesTests);
      expect(await page.img.seleniumAttributes['src'], endsWith('/test.png'));
    });

    test('class/className', () async {
      var page = await loaderUtil.getInstance(PageForSeleniumAttributesTests);
      expect(
          await page.table.seleniumAttributes['class'], 'class1 class2 class3');
      expect(await page.table.seleniumAttributes['className'],
          'class1 class2 class3');
    });

    test('readonly/readOnly', () async {
      var page = await loaderUtil.getInstance(PageForSeleniumAttributesTests);
      expect(await page.readOnly.seleniumAttributes['readonly'], 'true');
      expect(await page.readOnly.seleniumAttributes['readOnly'], 'true');
      expect(await page.text.seleniumAttributes['readonly'], isNull);
      expect(await page.text.seleniumAttributes['readOnly'], isNull);
    });

    test('value on text', () async {
      var page = await loaderUtil.getInstance(PageForSeleniumAttributesTests);
      expect(await page.text.seleniumAttributes['value'], '');
      await page.text.type('some text');
      expect(await page.text.seleniumAttributes['value'], 'some text');
    });
  });
}

class PageForSeleniumAttributesTests {
  @ById('div')
  @disableDisplayedCheck
  PageLoaderElement divWithStyle;

  @ByCss('input[type=checkbox]')
  PageLoaderElement checkbox;

  @ById('table1')
  PageLoaderElement table;

  @ById('select1')
  PageLoaderElement select1;

  @ById('option1')
  PageLoaderElement option1;

  @ById('option2')
  PageLoaderElement option2;

  @ByCss('input[value=radio1]')
  PageLoaderElement radio;

  @ById('anchor')
  PageLoaderElement anchor;

  @ByTagName('img')
  PageLoaderElement img;

  @ById('readonly')
  PageLoaderElement readOnly;

  @ById('text')
  PageLoaderElement text;
}
