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

part 'attributes.g.dart';

typedef PageLoaderElement GetNewContext();

void runTests(GetNewContext contextGenerator) {
  group('attributes ', () {
    test('style', () async {
      final page = PageForAttributesTests.create(contextGenerator());
      // According to the spec, red below should be returned as an
      // RGBA value.
      expect(page.divWithStyle.attributes['style'],
          'display: none; background-color: red;');
      expect(page.divWithStyle.attributes['STYLE'],
          'display: none; background-color: red;');
      expect(page.divWithStyle.attributes['StYlE'],
          'display: none; background-color: red;');
    });

    test('checked', () async {
      final page = PageForAttributesTests.create(contextGenerator());
      expect(page.checkbox.attributes['checked'], isNull);
      await page.checkbox.click();
      expect(page.checkbox.attributes['checked'], isNull);
    });

    test('disabled', () async {
      final page = PageForAttributesTests.create(contextGenerator());
      expect(page.readOnly.attributes['disabled'], '');
      expect(page.text.attributes['disabled'], isNull);
    });

    test('not a property', () async {
      final page = PageForAttributesTests.create(contextGenerator());
      expect(page.table.attributes['non-standard'], 'a non standard attr');
    });

    test('option values', () async {
      final page = PageForAttributesTests.create(contextGenerator());
      expect(page.option1.attributes['value'], 'value 1');
      expect(page.option1.attributes['VaLuE'], 'value 1');
      expect(page.option2.attributes['value'], 'value 2');
      expect(page.option2.attributes['VaLuE'], 'value 2');
    });

    test('option selected', () async {
      final page = PageForAttributesTests.create(contextGenerator());
      await page.option2.click();
      expect(page.select1.attributes['value'], isNull);
    });

    test('selected on checkbox', () async {
      final page = PageForAttributesTests.create(contextGenerator());
      expect(page.checkbox.attributes['selected'], isNull);
      expect(page.checkbox.attributes['SeLeCtEd'], isNull);
      await page.checkbox.click();
      expect(page.checkbox.attributes['selected'], isNull);
      expect(page.checkbox.attributes['SeLeCtEd'], isNull);
    });

    test('selected on radio', () async {
      final page = PageForAttributesTests.create(contextGenerator());
      expect(page.radio.attributes['selected'], isNull);
      expect(page.radio.attributes['SeLeCtEd'], isNull);
      await page.radio.click();
      expect(page.radio.attributes['selected'], isNull);
      expect(page.radio.attributes['SeLeCtEd'], isNull);
    });

    test('href on a', () async {
      final page = PageForAttributesTests.create(contextGenerator());
      expect(page.anchor.attributes['href'], endsWith('test.html'));
    });

    test('src on img', () async {
      final page = PageForAttributesTests.create(contextGenerator());
      expect(page.img.attributes['src'], endsWith('test.png'));
    });

    test('class/className', () async {
      final page = PageForAttributesTests.create(contextGenerator());
      expect(page.table.attributes['class'], 'class1 class2 class3');
      expect(page.table.attributes['className'], isNull);
    });

    test('readonly/readOnly', () async {
      final page = PageForAttributesTests.create(contextGenerator());
      expect(page.readOnly.attributes['readonly'], '');
      expect(page.readOnly.attributes['readOnly'], '');
      expect(page.text.attributes['readonly'], isNull);
      expect(page.text.attributes['readOnly'], isNull);
    });

    test('value on text', () async {
      final page = PageForAttributesTests.create(contextGenerator());
      expect(page.text.attributes['value'], isNull);
      await page.text.type('some text');
      expect(page.text.attributes['value'], isNull);
    });
  });
}

@PageObject()
abstract class PageForAttributesTests {
  PageForAttributesTests();
  factory PageForAttributesTests.create(PageLoaderElement context) =
      $PageForAttributesTests.create;

  @ById('div')
  PageLoaderElement get divWithStyle;

  @ByCss('input[type=checkbox]')
  PageLoaderElement get checkbox;

  @ById('table1')
  PageLoaderElement get table;

  @ById('select1')
  PageLoaderElement get select1;

  @ById('option1')
  PageLoaderElement get option1;

  @ById('option2')
  PageLoaderElement get option2;

  @ByCss('input[value=radio1]')
  PageLoaderElement get radio;

  @ById('anchor')
  PageLoaderElement get anchor;

  @ByTagName('img')
  PageLoaderElement get img;

  @ById('readonly')
  PageLoaderElement get readOnly;

  @ById('text')
  PageLoaderElement get text;
}
