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

part 'properties.g.dart';

typedef PageLoaderElement GetNewContext();

void runTests(GetNewContext contextGenerator) {
  group('properties', () {
    test('checked', () async {
      final page = new PageForPropertiesTests.create(contextGenerator());
      expect(page.checkbox.properties['checked'], 'false');
      await page.checkbox.click();
      expect(page.checkbox.properties['checked'], 'true');
    });

    test('disabled', () async {
      final page = new PageForPropertiesTests.create(contextGenerator());
      expect(page.readOnly.properties['disabled'], 'true');
      expect(page.text.properties['disabled'], 'false');
    });

    test('not a property', () async {
      final page = new PageForPropertiesTests.create(contextGenerator());
      expect(page.table.properties['non-standard'], isNull);
    });

    test('option values', () async {
      final page = new PageForPropertiesTests.create(contextGenerator());

      expect(page.option1.properties['value'], 'value 1');
      expect(page.option2.properties['value'], 'value 2');
    });

    test('option selected', () async {
      final page = new PageForPropertiesTests.create(contextGenerator());
      await page.option2.click();
      expect(page.select1.properties['value'], equals('value 2'));
    });

    test('selected on checkbox', () async {
      final page = new PageForPropertiesTests.create(contextGenerator());
      expect(page.checkbox.properties['checked'], 'false');
      await page.checkbox.click();
      expect(page.checkbox.properties['checked'], 'true');
    });

    test('selected on radio', () async {
      final page = new PageForPropertiesTests.create(contextGenerator());
      expect(page.radio.properties['checked'], 'false');
      await page.radio.click();
      expect(page.radio.properties['checked'], 'true');
    });

    test('href on a', () async {
      final page = new PageForPropertiesTests.create(contextGenerator());
      expect(page.anchor.properties['href'], endsWith('/test.html'));
    });

    test('src on img', () async {
      final page = new PageForPropertiesTests.create(contextGenerator());
      expect(page.img.properties['src'], endsWith('/test.png'));
    });

    test('class/className', () async {
      final page = new PageForPropertiesTests.create(contextGenerator());
      expect(page.table.properties['class'], isNull);
      expect(page.table.properties['className'], 'class1 class2 class3');
    });

    test('readonly/readOnly', () async {
      final page = new PageForPropertiesTests.create(contextGenerator());
      expect(page.readOnly.properties['readOnly'], 'true');
      expect(page.text.properties['readOnly'], 'false');
    });

    test('value on text', () async {
      final page = new PageForPropertiesTests.create(contextGenerator());
      expect(page.text.properties['value'], '');
      await page.text.type('some text');
      expect(page.text.properties['value'], 'some text');
    });
  });
}

@PageObject()
abstract class PageForPropertiesTests {
  PageForPropertiesTests();
  factory PageForPropertiesTests.create(PageLoaderElement context) =
      $PageForPropertiesTests.create;

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
