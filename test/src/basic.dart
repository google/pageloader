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
import 'package:pageloader/testing.dart';

import 'package:test/test.dart';

import 'shared_list_page_objects.dart' as list_shared;
import 'shared_page_objects.dart';

part 'basic.g.dart';

typedef PageLoaderElement GetNewContext();

void runTests(GetNewContext contextGenerator) {
  group('basic', () {
    test('load', () async {
      final basic = Basic.create(contextGenerator());
      final innerNested = basic.outerNested.innerNested;
      expect(innerNested.visibleText, 'inner nested');
    });

    test('simple page', () async {
      final page = PageForSimpleTest.create(contextGenerator());
      await verifyTable(page.table);
    });

    test('class annotations', () async {
      final table = Table.create(contextGenerator());
      await verifyTable(table);
    });

    test('class annotation on nested field', () async {
      final page = PageForClassAnnotationTest.create(contextGenerator());
      await verifyTable(page.table);
    });

    test('private fields', () async {
      final page = PageForPrivateFieldsTest.create(contextGenerator());
      await verifyTable(page.table);
    });

    test('has focus', () async {
      final page = PageForFocusTest.create(contextGenerator());
      expect(page.textfield.isFocused, false);

      await page.textfield.focus();
      expect(page.textfield.isFocused, true);

      await page.textfield.blur();
      expect(page.textfield.isFocused, false);
    });

    test('classes', () async {
      final page = PageForSimpleTest.create(contextGenerator());

      expect(page.table.table.classes,
          orderedEquals(['class1', 'class2', 'class3']));
      expect((await (await page.table.rows.first).cells.first).classes,
          hasLength(0));
    });

    test('style', () async {
      final page = PageForSimpleTest.create(contextGenerator());

      expect(page.table.table.style['color'], 'rgb(128, 0, 128)');
      expect(page.table.table.style['backgroundColor'], '');
    });

    test('computedStyle', () async {
      final page = PageForSimpleTest.create(contextGenerator());

      expect(page.table.table.computedStyle['color'], 'rgb(128, 0, 128)');
      expect(
          page.table.table.computedStyle['background-color'], 'rgb(0, 255, 0)');
    });

    test('exists', () async {
      final page = PageForExistsTest.create(contextGenerator());
      expect(page.doesExist, exists);
      expect(page.doesntExist, notExists);
    });

    test('visibility', () async {
      final page = PageForVisibilityTest.create(contextGenerator());
      expect(page.visibleButton, isNot(hasClass('invisible')));
      expect(page.invisibleDiv, hasClass('invisible'));
    });

    test('exist throws on multiple elements with exists', () async {
      final page = PageForExistsTest.create(contextGenerator());
      try {
        page.tooManyExist.exists;
        fail('Expected to throw on exists with multiple element');
      } catch (e) {
        expect(
            e.toString(),
            contains(
                'PageLoaderException: Found 4 elements on call to exists'));
      }
    });

    test('actions throw on non-existant elements', () async {
      final page = PageForExistsTest.create(contextGenerator());
      try {
        await page.doesntExist.click();
        fail('Expected to throw on clicking non-existant element');
      } catch (e) {
        expect(e.toString(),
            contains('Expected to find exactly 1 match, but found 0 for:'));
      }
    });

    test('nbsp in text', () async {
      final page = PageForNbspTest.create(contextGenerator());
      expect(page.span.visibleText, '   ');
      expect(page.span.innerText, '');
    });

    test('list', () async {
      final page = list_shared.PageForSimpleTest.create(contextGenerator());
      await list_shared.verifyTable(page.table);
    });

    test('debugId', () async {
      final page = DebugId.create(contextGenerator());
      expect(page.debug.exists, isTrue);
    });

    test('displayed works', () async {
      final page = DebugId.create(contextGenerator());
      expect(page.debug.displayed, isTrue);
    });

    test('not displayed works', () async {
      final page = Display.create(contextGenerator());
      expect(page.notDisplayed.displayed, isFalse);
    });

    test('getElementsByCss works', () async {
      final element = contextGenerator(); // Top element.
      expect((element.getElementsByCss('td')).length, 4);
    });
  });
}

@PageObject()
abstract class PageForExistsTest {
  PageForExistsTest();
  factory PageForExistsTest.create(PageLoaderElement context) =
      $PageForExistsTest.create;

  @ByTagName('non-existant')
  PageLoaderElement get doesntExist;

  @ById('button-1')
  PageLoaderElement get doesExist;

  @ByTagName('td')
  PageLoaderElement get tooManyExist;
}

@PageObject()
abstract class PageForVisibilityTest {
  PageForVisibilityTest();
  factory PageForVisibilityTest.create(PageLoaderElement context) =
      $PageForVisibilityTest.create;

  @ById('invisible-div')
  PageLoaderElement get invisibleDiv;

  @ById('button-1')
  PageLoaderElement get visibleButton;
}

@PageObject()
abstract class PageForClassAnnotationTest {
  PageForClassAnnotationTest();
  factory PageForClassAnnotationTest.create(PageLoaderElement context) =
      $PageForClassAnnotationTest.create;

  @root
  Table get table;
}

@PageObject()
abstract class PageForPrivateFieldsTest {
  PageForPrivateFieldsTest();
  factory PageForPrivateFieldsTest.create(PageLoaderElement context) =
      $PageForPrivateFieldsTest.create;

  @ByTagName('table')
  Table get _privateTable;

  Table get table => _privateTable;
}

@PageObject()
abstract class PageForFocusTest {
  PageForFocusTest();
  factory PageForFocusTest.create(PageLoaderElement context) =
      $PageForFocusTest.create;

  @ById('text')
  PageLoaderElement get textfield;
}

@PageObject()
abstract class PageForNbspTest {
  PageForNbspTest();
  factory PageForNbspTest.create(PageLoaderElement context) =
      $PageForNbspTest.create;

  @ById('nbsp')
  PageLoaderElement get span;
}

@PageObject()
abstract class Basic {
  Basic();
  factory Basic.create(PageLoaderElement context) = $Basic.create;

  @ByClass('outer-nested')
  OuterNested get outerNested;
}

@PageObject()
abstract class OuterNested {
  OuterNested();
  factory OuterNested.create(PageLoaderElement context) = $OuterNested.create;

  @ByClass('inner-nested')
  PageLoaderElement get innerNested;
}

@PageObject()
abstract class DebugId {
  DebugId();
  factory DebugId.create(PageLoaderElement context) = $DebugId.create;

  @ByDebugId('debugId')
  PageLoaderElement get debug;
}

@PageObject()
abstract class Display {
  Display();
  factory Display.create(PageLoaderElement context) = $Display.create;

  @ById('div')
  PageLoaderElement get notDisplayed;
}
