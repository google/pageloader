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

library pageloader.test.annotation;

import 'dart:async';
import 'package:pageloader/objects.dart';
import 'package:test/test.dart';
import 'shared.dart';

void runTests() {
  group('annotation tests', () {
    test('EnsureTag annotation', () async {
      TableForEnsureTag table = await loader.getInstance(TableForEnsureTag);
      expect(await table.table.name, 'table');
      await verifyRows(table.rows);

      table = await loader.getInstance(TableForEnsureTag, table.table);
      expect(await table.table.name, 'table');
      await verifyRows(table.rows);
    });

    test('FirstByCss', () async {
      PageForFirstByCssTest page =
          await loader.getInstance(PageForFirstByCssTest);
      expect(await page.element.visibleText, 'r1c1');
    });

    test('WithSeleniumAttribute', () async {
      PageForWithSeleniumAttributeTest page =
          await loader.getInstance(PageForWithSeleniumAttributeTest);
      expect(await page.element.seleniumAttributes['type'], 'checkbox');
    });

    test('WithAttribute', () async {
      PageForWithAttributeTest page =
          await loader.getInstance(PageForWithAttributeTest);
      expect(await page.element.attributes['type'], 'checkbox');
    });

    test('WithProperty', () async {
      PageForWithPropertyTest page =
          await loader.getInstance(PageForWithPropertyTest);
      expect(await page.element.properties['type'], 'checkbox');
    });

    test('WithClass', () async {
      var page = await loader.getInstance(PageForWithClassTest);
      expect(await page.element.seleniumAttributes['type'], 'checkbox');
      expect(await page.element.classes.toList(),
          unorderedEquals(['with-class-test', 'class1', 'class2']));
    });

    test('Chain', () async {
      PageForChainTest page = await loader.getInstance(PageForChainTest);

      expect(await page.outerDivsText.toList(),
          anyElement(contains('outer div 1')));
      expect(await page.outerDivsText.toList(),
          anyElement(contains('outer div 2')));
      expect(await page.innerDivsText.toList(),
          orderedEquals(['inner div 1', 'inner div 2']));
      expect(await page.innerDivSpecial.visibleText, 'inner div 2');
      expect(await page.innerShadow.visibleText, contains('some'));
    }, testOn: 'browser');

    test('@Global', () async {
      PageForGlobalTest page = await loader.getInstance(PageForGlobalTest);
      expect(page.nested.table, equals(page.table));
    });
  });
}

@EnsureTag('table')
class TableForEnsureTag {
  @root
  PageLoaderElement table;

  @ByTagName('tr')
  List<Row> rows;
}

@FirstByCss('td')
class PageForFirstByCssTest {
  @root
  PageLoaderElement element;
}

class PageForWithSeleniumAttributeTest {
  @ByTagName('input')
  @WithSeleniumAttribute('type', 'checkbox')
  PageLoaderElement element;
}

class PageForWithAttributeTest {
  @ByTagName('input')
  @WithAttribute('type', 'checkbox')
  PageLoaderElement element;
}

class PageForWithPropertyTest {
  @ByTagName('input')
  @WithProperty('type', 'checkbox')
  PageLoaderElement element;
}

class PageForWithClassTest {
  @ByTagName('input')
  @WithClass('with-class-test')
  PageLoaderElement element;
}

class PageForChainTest {
  @ByClass('outer-div')
  List<PageLoaderElement> outerDivs;

  @Chain(const [const ByClass('outer-div'), const ByClass('inner-div')])
  List<PageLoaderElement> innerDivs;

  @Chain(const [
    const ByClass('outer-div'),
    const ByClass('inner-div'),
    const WithClass('special')
  ])
  PageLoaderElement innerDivSpecial;

  @Chain(const [
    const ByClass('outer-div'),
    const ByTagName('a-custom-tag'),
    const InShadowDom(find: const ById('inner'))
  ])
  PageLoaderElement innerShadow;

  Stream<String> get outerDivsText async* {
    for (var div in outerDivs) {
      yield await div.visibleText;
    }
  }

  Stream<String> get innerDivsText async* {
    for (var div in innerDivs) {
      yield await div.visibleText;
    }
  }
}

class PageForGlobalTest {
  @ByTagName('table')
  PageLoaderElement table;

  @ByCss('input[value=radio1]')
  NestedPageForGlobalTest nested;
}

class NestedPageForGlobalTest {
  @Global(const ByTagName('table'))
  PageLoaderElement table;
}
