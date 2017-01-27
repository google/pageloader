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

library pageloader.test.attribute;

import 'package:pageloader/objects.dart';
import 'package:test/test.dart';
import 'shared.dart';

void runTests() {
  group('properties', () {
    test('checked', () async {
      var page = await loader.getInstance(PageForPropertiesTests);
      expect(await page.checkbox.properties['checked'], 'false');
      await page.checkbox.click();
      expect(await page.checkbox.properties['checked'], 'true');
    });

    test('disabled', () async {
      var page = await loader.getInstance(PageForPropertiesTests);
      expect(await page.readOnly.properties['disabled'], 'true');
      expect(await page.text.properties['disabled'], 'false');
    });

    test('not a property', () async {
      var page = await loader.getInstance(PageForPropertiesTests);
      expect(await page.table.properties['non-standard'], isNull);
    });

    test('option values', () async {
      var page = await loader.getInstance(PageForPropertiesTests);

      expect(await page.option1.properties['value'], 'value 1');
      expect(await page.option2.properties['value'], 'value 2');
    });

    test('option selected', () async {
      var page = await loader.getInstance(PageForPropertiesTests);
      await page.option2.click();
      expect(await page.select1.properties['value'], equals('value 2'));
    });

    test('selected on checkbox', () async {
      var page = await loader.getInstance(PageForPropertiesTests);
      expect(await page.checkbox.properties['checked'], 'false');
      await page.checkbox.click();
      expect(await page.checkbox.properties['checked'], 'true');
    });

    test('selected on radio', () async {
      var page = await loader.getInstance(PageForPropertiesTests);
      expect(await page.radio.properties['checked'], 'false');
      await page.radio.click();
      expect(await page.radio.properties['checked'], 'true');
    });

    test('href on a', () async {
      var page = await loader.getInstance(PageForPropertiesTests);
      expect(await page.anchor.properties['href'], endsWith('/test.html'));
    });

    test('src on img', () async {
      var page = await loader.getInstance(PageForPropertiesTests);
      expect(await page.img.properties['src'], endsWith('/test.png'));
    });

    test('class/className', () async {
      var page = await loader.getInstance(PageForPropertiesTests);
      expect(await page.table.properties['class'], isNull);
      expect(await page.table.properties['className'], 'class1 class2 class3');
    });

    test('readonly/readOnly', () async {
      var page = await loader.getInstance(PageForPropertiesTests);
      expect(await page.readOnly.properties['readOnly'], 'true');
      expect(await page.text.properties['readOnly'], 'false');
    });

    test('value on text', () async {
      var page = await loader.getInstance(PageForPropertiesTests);
      expect(await page.text.properties['value'], '');
      await page.text.type('some text');
      expect(await page.text.properties['value'], 'some text');
    });
  });
}

class PageForPropertiesTests {
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
