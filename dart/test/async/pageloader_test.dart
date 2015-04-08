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

library pageloader.async.test;

import 'package:matcher/matcher.dart';
import 'package:pageloader/async/objects.dart';
import 'package:unittest/unittest.dart';
import 'package:webdriver/async_helpers.dart';
import 'page_objects.dart';

PageLoader loader;

void runTests() {
  verifyRows(List<Row> rows) async {
    expect(rows, hasLength(2));
    expect(rows.first.cells, hasLength(2));
    expect(rows[1].cells, hasLength(2));
    expect(await rows.first.cells.first.visibleText, 'r1c1');
    expect(await rows.first.cells[1].visibleText, 'r1c2');
    expect(await rows[1].cells.first.visibleText, 'r2c1');
    expect(await rows[1].cells[1].visibleText, 'r2c2');
  }

  verifyTable(Table table) async {
    expect(await table.table.name, equalsIgnoringCase('TABLE'));
    await verifyRows(table.rows);
  }

  group('core tests', () {
    test('simple', () async {
      PageForSimpleTest page = await loader.getInstance(PageForSimpleTest);
      await verifyTable(page.table);
      expect(page.loader, loader);
    });

    test('class annotations', () async {
      Table table = await loader.getInstance(Table);
      await verifyTable(table);
    });

    test('EnsureTag annotation', () async {
      TableForEnsureTag table = await loader.getInstance(TableForEnsureTag);
      expect(await table.table.name, 'table');
      await verifyRows(table.rows);

      table = await loader.getInstance(TableForEnsureTag, table.table);
      expect(await table.table.name, 'table');
      await verifyRows(table.rows);
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

    test('displayed filtering', () async {
      PageForDisplayedFilteringTest page =
          await loader.getInstance(PageForDisplayedFilteringTest);

      expect(page.shouldHaveOneElement, hasLength(1));
      expect(page.shouldBeEmpty, isEmpty);
      expect(page.shouldAlsoBeEmpty, isEmpty);
    });

    test('setters', () async {
      PageForSettersTest page = await loader.getInstance(PageForSettersTest);
      expect(page.shouldHaveOneElement, hasLength(1));
      expect(page.loader, loader);
    });

    test('exception on finals', () {
      expect(loader.getInstance(PageForExceptionOnFinalsTest), throws);
    });

    test('skip fields without finders', () async {
      PageForSkipFieldsWithoutFinderTest page =
          await loader.getInstance(PageForSkipFieldsWithoutFinderTest);
      expect(page.shouldHaveOneElement, hasLength(1));
      expect(page.shouldBeNull, isNull);
    });

    test('no matching element', () {
      expect(loader.getInstance(PageForNoMatchingElementTest), throws);
    });

    test('no matching class element', () {
      expect(loader.getInstance(PageForNoMatchingClassElementTest), throws);
    });

    test('no matching but optional element', () async {
      PageForOptionalElementTest page =
          await loader.getInstance(PageForOptionalElementTest);
      expect(page.doesntExist, isNull);
    });

    test('multiple matching element', () {
      expect(loader.getInstance(PageForMultipleMatchingElementTest), throws);
    });

    test('multiple matching element', () {
      expect(
          loader.getInstance(PageForMultipleMatchingClassElementTest), throws);
    });

    test('multiple finders', () {
      expect(loader.getInstance(PageForMultipleFinderTest), throws);
    });

    test('multiple class finders', () {
      expect(loader.getInstance(PageForMultipleClassFinderTest), throws);
    });

    test('invalid constructor', () {
      expect(loader.getInstance(PageForInvalidConstructorTest), throws);
    });

    test('WithAttribute', () async {
      PageForWithAttributeTest page =
          await loader.getInstance(PageForWithAttributeTest);
      expect(await page.element.attributes['type'], 'checkbox');
    });

    test('WithClass', () async {
      var page = await loader.getInstance(PageForWithClassTest);
      expect(await page.element.attributes['type'], 'checkbox');
      expect(await page.element.classes.toList(),
          unorderedEquals(['with-class-test', 'class1', 'class2']));
    });

    test('ambiguous element test', () {
      expect(loader.getInstance(PageForAmbiguousTest), throws);
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

    test('private setters', () {
      expect(loader.getInstance(PageForPrivateSettersTest), throws);
    });

    test('static field', () {
      expect(loader.getInstance(PageForStaticFieldsTest), throws);
    });

    test('static setter', () {
      expect(loader.getInstance(PageForStaticSettersTest), throws);
    });

    test('Lazy fields', () async {
      PageForLazyTest page = await loader.getInstance(PageForLazyTest);

      expect(await (await page.lazyElement()).visibleText, contains('r1c1'));
      await verifyTable(await page.lazyTable());

      expect(await page.lazyRowElements(), hasLength(2));
      await verifyRows(await page.lazyRows());
    });

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

    test('chain', () async {
      PageForChainTest page = await loader.getInstance(PageForChainTest);

      expect(await page.outerDivsText.toList(),
          anyElement(contains('outer div 1')));
      expect(await page.outerDivsText.toList(),
          anyElement(contains('outer div 2')));
      expect(await page.innerDivsText.toList(),
          orderedEquals(['inner div 1', 'inner div 2']));
      expect(await page.innerDivSpecial.visibleText, 'inner div 2');
      expect(await page.innerShadow.visibleText, contains('some'));
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

    test('optional with functions', () async {
      PageForOptionalFunctionTest page =
          await loader.getInstance(PageForOptionalFunctionTest);

      expect(await page.shouldBeNull(), isNull);
      expect(await page.shouldBeNonNull(), isNotNull);
    });

    test('mouse', () async {
      PageForMouseTest page = await loader.getInstance(PageForMouseTest);

      await loader.mouse.moveTo(page.element, 2, 2);
      await waitFor(() => page.element.visibleText,
          matcher: contains('MouseMove'));
      await loader.mouse.down(0);
      await waitFor(() => page.element.visibleText,
          matcher: contains('MouseDown'));
      await loader.mouse.moveTo(page.element, 10, 10);
      await loader.mouse.up(0);
      await waitFor(() => page.element.visibleText,
          matcher: contains('MouseUp'));
    });

    test('mouse with event target', () async {
      PageForMouseTest page = await loader.getInstance(PageForMouseTest);

      // make sure mouse is not on element;
      await loader.mouse.moveTo(page.element, -10, -10);
      await loader.mouse.down(0, eventTarget: page.element);
      await waitFor(() => page.element.visibleText,
          matcher: contains('MouseDown'));
      await loader.mouse.moveTo(page.element, 200, 200);
      await loader.mouse..up(0, eventTarget: page.element);
      await waitFor(() => page.element.visibleText,
          matcher: contains('MouseUp'));
    });

    test('@Global', () async {
      PageForGlobalTest page = await loader.getInstance(PageForGlobalTest);
      expect(page.nested.table, equals(page.table));
    });

    test('Type into textarea', () async {
      PageForTextAreaTypingText page =
          await loader.getInstance(PageForTextAreaTypingText);
      await page.textArea.type('some');
      expect(await page.textArea.attributes['value'], 'some');
      await page.textArea.type(' string');
      expect(await page.textArea.attributes['value'], 'some string');
      await page.textArea.clear();
      expect(await page.textArea.attributes['value'], '');
    });

    test('nbsp in text', () async {
      PageForNbspTest page = await loader.getInstance(PageForNbspTest);
      expect(await page.span.visibleText, '   ');
      expect(await page.span.innerText, '');
    });
  });

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

  group('typing', () {
    test('typing should append', () async {
      var page = await loader.getInstance(PageForAttributesTests);
      expect(await page.text.attributes['value'], '');
      await page.text.type('some text');
      expect(await page.text.attributes['value'], 'some text');
      await page.text.type(' and more text');
      expect(await page.text.attributes['value'], 'some text and more text');
    });

    test('value after clear', () async {
      var page = await loader.getInstance(PageForAttributesTests);
      expect(await page.text.attributes['value'], '');
      await page.text.type('some text');
      expect(await page.text.attributes['value'], 'some text');
      await page.text.clear();
      expect(await page.text.attributes['value'], '');
    });
  });
}
