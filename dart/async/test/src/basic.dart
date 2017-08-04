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

library pageloader.test.basic;

import 'package:pageloader/objects.dart';
import 'package:test/test.dart';
import 'shared.dart';

void runTests() {
  group('basic tests', () {
    test('simple', () async {
      PageForSimpleTest page = await loader.getInstance(PageForSimpleTest);
      await verifyTable(page.table);
      expect(page.loader, loader.loader);
    });

    test('class annotations', () async {
      Table table = await loader.getInstance(Table);
      await verifyTable(table);
    });

    test('class annotation on nested field', () async {
      PageForClassAnnotationTest page =
          await loader.getInstance(PageForClassAnnotationTest);
      await verifyTable(page.table);
    });

    test('sub-class', () async {
      SubclassPage page = await loader.getInstance(SubclassPage);
      await verifyTable(page.table);
    });

    test('setters', () async {
      PageForSettersTest page = await loader.getInstance(PageForSettersTest);
      expect(page.shouldHaveOneElement, hasLength(1));
      expect(page.loader, loader.loader);
    });

    test('skip fields without finders', () async {
      PageForSkipFieldsWithoutFinderTest page =
          await loader.getInstance(PageForSkipFieldsWithoutFinderTest);
      expect(page.shouldHaveOneElement, hasLength(1));
      expect(page.shouldBeNull, isNull);
    });

    test('mixin', () async {
      PageForMixinTest page = await loader.getInstance(PageForMixinTest);
      await verifyTable(page.table);
      expect(page.shouldHaveOneElement, hasLength(1));
      expect(page.shouldBeEmpty, isEmpty);
      expect(page.shouldAlsoBeEmpty, isEmpty);
    });

    test('private constructor', () async {
      PageForPrivateConstructorTest page =
          await loader.getInstance(PageForPrivateConstructorTest);

      await verifyTable(page.table);
    });

    test('private fields', () async {
      PageForPrivateFieldsTest page =
          await loader.getInstance(PageForPrivateFieldsTest);
      await verifyTable(page.table);
    });

    test('Lazy fields', () async {
      PageForLazyTest page = await loader.getInstance(PageForLazyTest);

      expect(await (await page.lazyElement()).visibleText, contains('r1c1'));
      await verifyTable(await page.lazyTable());

      expect(await page.lazyRowElements(), hasLength(2));
      await verifyRows(await page.lazyRows());
    });

    test('has focus', () async {
      PageForFocusTest page = await loader.getInstance(PageForFocusTest);

      expect(await page.textfield.isFocused, false);

      await page.textfield.focus();
      expect(await page.textfield.isFocused, true);

      await page.textfield.blur();
      expect(await page.textfield.isFocused, false);
    }, onPlatform: {
      'content-shell': new Skip('Focus events do not work in content-shell')
    });

    test('classes', () async {
      PageForSimpleTest page = await loader.getInstance(PageForSimpleTest);

      expect(await page.table.table.classes.toList(),
          orderedEquals(['class1', 'class2', 'class3']));
      expect(await page.table.rows.first.cells.first.classes.toList(),
          hasLength(0));
    });

    test('style', () async {
      PageForSimpleTest page = await loader.getInstance(PageForSimpleTest);

      expect(await page.table.table.style['color'], 'rgb(128, 0, 128)');
      expect(await page.table.table.style['backgroundColor'], '');
    });

    test('computedStyle', () async {
      PageForSimpleTest page = await loader.getInstance(PageForSimpleTest);

      expect(await page.table.table.computedStyle['color'], 'rgb(128, 0, 128)');
      expect(await page.table.table.computedStyle['background-color'],
          'rgb(0, 255, 0)');
    });

    test('optional with Lazy', () async {
      PageForOptionalFunctionTest page =
          await loader.getInstance(PageForOptionalFunctionTest);

      expect(await page.shouldBeNull(), isNull);
      expect(await page.shouldBeNonNull(), isNotNull);
    });

    test('nbsp in text', () async {
      PageForNbspTest page = await loader.getInstance(PageForNbspTest);
      expect(await page.span.visibleText, '   ');
      expect(await page.span.innerText, '');
    });

    test('optional', () async {
      PageForOptionalElementTest page =
          await loader.getInstance(PageForOptionalElementTest);
      expect(page.doesntExist, isNull);
    });
  });
}

class PageForOptionalFunctionTest {
  @ByTagName('non-existant')
  @optional
  Lazy shouldBeNull;

  @ById('button-1')
  @optional
  Lazy shouldBeNonNull;
}

class SubclassPage extends PageForSimpleTest {}

class PageForClassAnnotationTest {
  @root
  Table table;
}

class PageForSettersTest {
  List<PageLoaderElement> _shouldHaveOneElement;
  var _loader;

  @inject
  set loader(PageLoader l) {
    this._loader = l;
  }

  PageLoader get loader => _loader;

  @ById('div')
  @disableDisplayedCheck
  set shouldHaveOneElement(List<PageLoaderElement> elements) {
    _shouldHaveOneElement = elements;
  }

  get shouldHaveOneElement => _shouldHaveOneElement;
}

class PageForSkipFieldsWithoutFinderTest {
  @ById('div')
  @disableDisplayedCheck
  List<PageLoaderElement> shouldHaveOneElement;

  List<PageLoaderElement> shouldBeNull;
}

class PageForOptionalElementTest {
  @ById('non-existent id')
  @optional
  PageLoaderElement doesntExist;
}

class MixinForMixinTest {
  @ById('div')
  @disableDisplayedCheck
  List<PageLoaderElement> shouldHaveOneElement;

  @ById('div')
  List<PageLoaderElement> shouldBeEmpty;

  @ById('div')
  @IsDisplayed()
  @disableDisplayedCheck
  List shouldAlsoBeEmpty;
}

class PageForAmbiguousTest {
  @ByTagName('input')
  PageLoaderElement element;
}

class PageForMixinTest extends PageForSimpleTest with MixinForMixinTest {}

class PageForPrivateConstructorTest extends PageForSimpleTest {
  PageForPrivateConstructorTest._();
}

class PageForPrivateFieldsTest {
  @ByTagName('table')
  Table _privateTable;

  Table get table => _privateTable;
}

class PageForLazyTest {
  @ByTagName('table')
  Lazy lazyElement;

  @ByTagName('table')
  Lazy<Table> lazyTable;

  @ByCss('table tr')
  Lazy<List> lazyRowElements;

  @ByCss('table tr')
  Lazy<List<Row>> lazyRows;
}

class PageForNbspTest {
  @ById('nbsp')
  PageLoaderElement span;
}

class PageForFocusTest {
  @ById('text')
  PageLoaderElement textfield;
}
