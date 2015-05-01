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

library pageloader.async.test.attribute;

import 'package:pageloader/async/objects.dart';
import 'package:test/test.dart';
import 'shared.dart';

void runTests() {
  group('attributes', () {
    test('style', () async {
      var page = await loader.getInstance(PageForAttributesTests);
      // According to the spec, red below should be returned as an
      // RGBA value.
      expect(await page.divWithStyle.attributes['style'],
          'display: none; background-color: red;');
      expect(await page.divWithStyle.attributes['STYLE'],
          'display: none; background-color: red;');
      expect(await page.divWithStyle.attributes['StYlE'],
          'display: none; background-color: red;');
    });

    test('checked', () async {
      var page = await loader.getInstance(PageForAttributesTests);
      expect(await page.checkbox.attributes['checked'], isNull);
      await page.checkbox.click();
      expect(await page.checkbox.attributes['checked'], 'true');
    });

    test('disabled', () async {
      var page = await loader.getInstance(PageForAttributesTests);
      expect(await page.readOnly.attributes['disabled'], 'true');
      expect(await page.text.attributes['disabled'], isNull);
    });

    test('not a property', () async {
      var page = await loader.getInstance(PageForAttributesTests);
      expect(
          await page.table.attributes['non-standard'], 'a non standard attr');
    });

    test('option values', () async {
      var page = await loader.getInstance(PageForAttributesTests);
      // The expects below are according to the WebDriver spec, but currently
      // fail
      // expect(page.option1.attributes['value'], 'option 1');
      // expect(page.option1.attributes['VaLuE'], 'option 1');
      expect(await page.option2.attributes['value'], 'value 2');
      expect(await page.option2.attributes['VaLuE'], 'value 2');
    });

    test('option selected', () async {
      var page = await loader.getInstance(PageForAttributesTests);
      await page.option2.click();
      expect(await page.select1.attributes['value'], equals('value 2'));
    });

    test('selected on checkbox', () async {
      var page = await loader.getInstance(PageForAttributesTests);
      expect(await page.checkbox.attributes['selected'], isNull);
      expect(await page.checkbox.attributes['SeLeCtEd'], isNull);
      await page.checkbox.click();
      expect(await page.checkbox.attributes['selected'], 'true');
      expect(await page.checkbox.attributes['SeLeCtEd'], 'true');
    });

    test('selected on radio', () async {
      var page = await loader.getInstance(PageForAttributesTests);
      expect(await page.radio.attributes['selected'], isNull);
      expect(await page.radio.attributes['SeLeCtEd'], isNull);
      await page.radio.click();
      expect(await page.radio.attributes['selected'], 'true');
      expect(await page.radio.attributes['SeLeCtEd'], 'true');
    });

    test('href on a', () async {
      var page = await loader.getInstance(PageForAttributesTests);
      expect(await page.anchor.attributes['href'], endsWith('/test.html'));
    });

    test('src on img', () async {
      var page = await loader.getInstance(PageForAttributesTests);
      expect(await page.img.attributes['src'], endsWith('/test.png'));
    });

    test('class/className', () async {
      var page = await loader.getInstance(PageForAttributesTests);
      expect(await page.table.attributes['class'], 'class1 class2 class3');
      expect(await page.table.attributes['className'], 'class1 class2 class3');
    });

    test('readonly/readOnly', () async {
      var page = await loader.getInstance(PageForAttributesTests);
      expect(await page.readOnly.attributes['readonly'], 'true');
      expect(await page.readOnly.attributes['readOnly'], 'true');
      expect(await page.text.attributes['readonly'], isNull);
      expect(await page.text.attributes['readOnly'], isNull);
    });

    test('value on text', () async {
      var page = await loader.getInstance(PageForAttributesTests);
      expect(await page.text.attributes['value'], '');
      await page.text.type('some text');
      expect(await page.text.attributes['value'], 'some text');
    });
  });
}

class PageForAttributesTests {
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
