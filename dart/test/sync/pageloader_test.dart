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

library pageloader.test;

import 'package:matcher/matcher.dart';
import 'package:pageloader/sync/objects.dart';
import 'package:unittest/unittest.dart';

import 'page_objects.dart';

PageLoader loader;

void runTests() {
  verifyRows(List<Row> rows) {
    expect(rows, hasLength(2));
    expect(rows.first.cells, hasLength(2));
    expect(rows[1].cells, hasLength(2));
    expect(rows.first.cells.first.visibleText, 'r1c1');
    expect(rows.first.cells[1].visibleText, 'r1c2');
    expect(rows[1].cells.first.visibleText, 'r2c1');
    expect(rows[1].cells[1].visibleText, 'r2c2');
  }

  verifyTable(Table table) {
    expect(table.root.name, equalsIgnoringCase('TABLE'));
    verifyRows(table.rows);
  }

  group('core tests', () {
    test('simple', () {
      PageForSimpleTest page = loader.getInstance(PageForSimpleTest);
      verifyTable(page.table);
      expect(page.loader, loader);
    });

    test('class annotations', () {
      Table table = loader.getInstance(Table);
      verifyTable(table);
    });

    test('EnsureTag annotation', () {
      TableForEnsureTag table = loader.getInstance(TableForEnsureTag);
      expect(table.root.name, 'table');
      verifyRows(table.rows);

      table = loader.getInstance(TableForEnsureTag, table.root);
      expect(table.root.name, 'table');
      verifyRows(table.rows);
    });

    test('class annotation on nested field', () {
      PageForClassAnnotationTest page =
          loader.getInstance(PageForClassAnnotationTest);
      verifyTable(page.table);
    });

    test('sub-class', () {
      SubclassPage page = loader.getInstance(SubclassPage);
      verifyTable(page.table);
    });

    test('displayed filtering', () {
      PageForDisplayedFilteringTest page =
          loader.getInstance(PageForDisplayedFilteringTest);

      expect(page.shouldHaveOneElement, hasLength(1));
      expect(page.shouldBeEmpty, isEmpty);
      expect(page.shouldAlsoBeEmpty, isEmpty);
    });

    test('setters', () {
      PageForSettersTest page = loader.getInstance(PageForSettersTest);
      expect(page.shouldHaveOneElement, hasLength(1));
      expect(page.loader, loader);
    });

    test('skip finals', () {
      PageForSkipFinalTest page = loader.getInstance(PageForSkipFinalTest);
      expect(page.shouldHaveOneElement, hasLength(1));
      expect(page.shouldBeNull, isNull);
      expect(page.loader, isNull);
    });

    test('skip fields without finders', () {
      PageForSkipFieldsWithoutFinderTest page =
          loader.getInstance(PageForSkipFieldsWithoutFinderTest);
      expect(page.shouldHaveOneElement, hasLength(1));
      expect(page.shouldBeNull, isNull);
    });

    test('no matching element', () {
      expect(() => loader.getInstance(PageForNoMatchingElementTest), throws);
    });

    test('no matching class element', () {
      expect(
          () => loader.getInstance(PageForNoMatchingClassElementTest), throws);
    });

    test('no matching but nullable element', () {
      PageForNullableElementTest page =
          loader.getInstance(PageForNullableElementTest);
      expect(page.doesntExist, isNull);
    });

    test('multiple matching element', () {
      expect(
          () => loader.getInstance(PageForMultipleMatchingElementTest), throws);
    });

    test('multiple matching element', () {
      expect(() => loader.getInstance(PageForMultipleMatchingClassElementTest),
          throws);
    });

    test('multiple finders', () {
      expect(() => loader.getInstance(PageForMultipleFinderTest), throws);
    });

    test('multiple class finders', () {
      expect(() => loader.getInstance(PageForMultipleClassFinderTest), throws);
    });

    test('invalid constructor', () {
      expect(() => loader.getInstance(PageForInvalidConstructorTest), throws);
    });

    test('WithAttribute', () {
      PageForWithAttributeTest page =
          loader.getInstance(PageForWithAttributeTest);
      expect(page.element.attributes['type'], 'checkbox');
    });

    test('WithClass', () {
      var page = loader.getInstance(PageForWithClassTest);
      expect(page.element.attributes['type'], 'checkbox');
      expect(page.element.classes,
          unorderedEquals(['with-class-test', 'class1', 'class2']));
    });

    test('ambiguous element test', () {
      expect(() => loader.getInstance(PageForAmbiguousTest), throws);
    });

    test('mixin', () {
      PageForMixinTest page = loader.getInstance(PageForMixinTest);
      verifyTable(page.table);
      expect(page.shouldHaveOneElement, hasLength(1));
      expect(page.shouldBeEmpty, isEmpty);
      expect(page.shouldAlsoBeEmpty, isEmpty);
    });

    test('private constructor', () {
      PageForPrivateConstructorTest page =
          loader.getInstance(PageForPrivateConstructorTest);

      verifyTable(page.table);
    });

    test('private fields', () {
      PageForPrivateFieldsTest page =
          loader.getInstance(PageForPrivateFieldsTest);
      verifyTable(page.table);
    });

    // TODO(DrMarcII) Change if private setters get fixed.
    test('private setters', () {
      PageForPrivateSettersTest page =
          loader.getInstance(PageForPrivateSettersTest);
      expect(page.table, isNull);
      //  verifyTable(page.table)
    });

    test('static field', () {
      PageForStaticFieldsTest page =
          loader.getInstance(PageForStaticFieldsTest);
      verifyTable(page.table);
      expect(PageForStaticFieldsTest.dontSet, isNull);
    });

    test('static setter', () {
      PageForStaticSettersTest page =
          loader.getInstance(PageForStaticSettersTest);
      verifyTable(page.table);
      expect(PageForStaticFieldsTest.dontSet, isNull);
    });

    test('function field', () {
      PageForFunctionTest page = loader.getInstance(PageForFunctionTest);
      // Functions
      expect(page.noReturnsFn().visibleText, contains('r1c1'));
      expect(page.noTypeFn().visibleText, contains('r1c1'));
      expect(page.pageLoaderElementFn().visibleText, contains('r1c1'));
      expect(page.lazyElement().visibleText, contains('r1c1'));
      verifyTable(page.tableFn());
      verifyTable(page.lazyTable());
      // Functions + Lists
      expect(page.noTypesFn(), hasLength(2));
      expect(page.returnsGenericListFn(), hasLength(2));
      expect(page.pageLoaderElementsFn(), hasLength(2));
      expect(page.lazyRowElements(), hasLength(2));
      verifyRows(page.rowsFn());
      verifyRows(page.lazyRows());
      // TypeDefs
      expect(page.noTypeDef().visibleText, contains('r1c1'));
      expect(page.plElementTypeDef().visibleText, contains('r1c1'));
      verifyTable(page.tableTypeDef());
      // TypeDefs + Lists
      expect(page.noListTypeDef(), hasLength(2));
      expect(page.plElementsTypeDef(), hasLength(2));
      verifyRows(page.rowsTypeDef());
    });

    test('shadow dom', () {
      PageForShadowDomTest page = loader.getInstance(PageForShadowDomTest);

      expect(page.button1.button.visibleText, contains('button 1'));
      expect(page.button1.button.visibleText, contains('some'));
      expect(page.button2.button.visibleText, contains('button 2'));
      expect(page.button2.button.visibleText, contains('some'));
      if (loader.useShadowDom) {
        expect(page.shouldBeEmpty, hasLength(0));
      }
    });

    test('WithVisibleText in shadow dom', () {
      PageForShadowDomWithVisibleTextTest page =
          loader.getInstance(PageForShadowDomWithVisibleTextTest);

      expect(page.button1.visibleText, contains('button 1'));
      expect(page.button1.visibleText, contains('some'));
    });

    test('chain', () {
      PageForChainTest page = loader.getInstance(PageForChainTest);

      expect(page.outerDivsText, anyElement(contains('outer div 1')));
      expect(page.outerDivsText, anyElement(contains('outer div 2')));
      expect(page.innerDivsText, orderedEquals(['inner div 1', 'inner div 2']));
      expect(page.innerDivSpecial.visibleText, 'inner div 2');
      expect(page.innerShadow.visibleText, contains('some'));
    });

    test('WithInnerText in shadow dom', () {
      if (!loader.useShadowDom) {
        // if shadow dom is disabled, then visibleText and innerText are
        // identical
        return;
      }
      PageForShadowDomWithInnerTextTest page =
          loader.getInstance(PageForShadowDomWithInnerTextTest);

      expect(page.shouldBeEmpty, isEmpty);
      expect(page.button1.visibleText, contains('button 1'));
      expect(page.button1.visibleText, contains('some'));
      expect(page.button1.innerText, contains('button 1'));
      expect(page.button1.innerText, isNot(contains('some')));
    });

    test('text methods on shadow root', () {
      PageForTextOnShadowRootTest page =
          loader.getInstance(PageForTextOnShadowRootTest);

      expect(page.buttons, hasLength(3));
      expect(page.buttons[1].shadowRoot.visibleText, contains('button 1'));
      expect(page.buttons[1].shadowRoot.visibleText, contains('some'));
      expect(page.buttons[2].shadowRoot.visibleText, contains('button 2'));
      expect(page.buttons[2].shadowRoot.visibleText, contains('some'));
      if (loader.useShadowDom) {
        expect(
            page.buttons[1].shadowRoot.innerText, isNot(contains('button 1')));
      } else {
        expect(page.buttons[1].shadowRoot.innerText, contains('button 1'));
      }
      expect(page.buttons[1].shadowRoot.innerText, contains('some'));
      if (loader.useShadowDom) {
        expect(
            page.buttons[2].shadowRoot.innerText, isNot(contains('button 2')));
      } else {
        expect(page.buttons[2].shadowRoot.innerText, contains('button 2'));
      }
      expect(page.buttons[2].shadowRoot.innerText, contains('some'));
    });

    test('classes', () {
      PageForSimpleTest page = loader.getInstance(PageForSimpleTest);

      expect(page.table.root.classes,
          orderedEquals(['class1', 'class2', 'class3']));
      expect(page.table.rows.first.cells.first.classes, hasLength(0));
    });

    test('style', () {
      PageForSimpleTest page = loader.getInstance(PageForSimpleTest);

      expect(page.table.root.style['color'], 'rgb(128, 0, 128)');
      expect(page.table.root.style['backgroundColor'], '');
    });

    test('computedStyle', () {
      PageForSimpleTest page = loader.getInstance(PageForSimpleTest);

      expect(page.table.root.computedStyle['color'], 'rgb(128, 0, 128)');
      expect(
          page.table.root.computedStyle['background-color'], 'rgb(0, 255, 0)');
    });

    test('equals/hashCode', () {
      PageForEqualityTest page = loader.getInstance(PageForEqualityTest);

      expect(page.buttons, hasLength(3));
    });

    test('optional with functions', () {
      PageForOptionalFunctionTest page =
          loader.getInstance(PageForOptionalFunctionTest);

      expect(page.shouldBeNull(), isNull);
      expect(page.shouldBeNonNull(), isNotNull);
    });

    test('mouse', () {
      PageForMouseTest page = loader.getInstance(PageForMouseTest);

      loader.mouse.moveTo(page.element, 2, 2);
      loader.waitFor(() => page.element.visibleText, contains('MouseMove'));
      loader.mouse.down(0);
      loader.waitFor(() => page.element.visibleText, contains('MouseDown'));
      loader.mouse
        ..moveTo(page.element, 10, 10)
        ..up(0);
      loader.waitFor(() => page.element.visibleText, contains('MouseUp'));
    });

    test('mouse with event target', () {
      PageForMouseTest page = loader.getInstance(PageForMouseTest);

      // make sure mouse is not on element;
      loader.mouse.moveTo(page.element, -10, -10);
      loader.mouse.down(0, eventTarget: page.element);
      loader.waitFor(() => page.element.visibleText, contains('MouseDown'));
      loader.mouse
        ..moveTo(page.element, 200, 200)
        ..up(0, eventTarget: page.element);
      loader.waitFor(() => page.element.visibleText, contains('MouseUp'));
    });

    test('@Global', () {
      PageForGlobalTest page = loader.getInstance(PageForGlobalTest);
      expect(page.nested.table, equals(page.table));
    });

    test('Type into textarea', () {
      PageForTextAreaTypingText page =
          loader.getInstance(PageForTextAreaTypingText);
      page.textArea.type('some');
      expect(page.textArea.attributes['value'], 'some');
      page.textArea.type(' string');
      expect(page.textArea.attributes['value'], 'some string');
      page.textArea.clear();
      expect(page.textArea.attributes['value'], '');
    });

    test('nbsp in text', () {
      PageForNbspTest page = loader.getInstance(PageForNbspTest);
      expect(page.span.visibleText, '   ');
      expect(page.span.innerText, '');
    });
  });

  group('waitFor()', () {
    test('that returns a string', () {
      var count = 0;
      var result = loader.waitFor(() {
        if (count == 2) return 'webdriver - Google Search';
        count++;
        return count;
      }, equals('webdriver - Google Search'));

      expect(result, equals('webdriver - Google Search'));
    });

    test('that returns null', () {
      var count = 0;
      var result = loader.waitFor(() {
        if (count == 2) return null;
        count++;
        return count;
      }, isNull);
      expect(result, isNull);
    });

    test('that returns false', () {
      var count = 0;
      var result = loader.waitFor(() {
        if (count == 2) return false;
        count++;
        return count;
      }, isFalse);
      expect(result, isFalse);
    });
  });

  group('waitForValue()', () {
    test('that returns a string', () {
      var count = 0;
      var result = loader.waitForValue(() {
        if (count == 2) return 'Google';
        count++;
        return null;
      });
      expect(result, equals('Google'));
    });

    test('that returns false', () {
      var count = 0;
      var result = loader.waitForValue(() {
        expect(count, lessThanOrEqualTo(2));
        if (count == 2) {
          count++;
          return false;
        }
        count++;
        return null;
      });
      expect(result, isFalse);
    });
  });

  group('attributes', () {
    test('style', () {
      var page = loader.getInstance(PageForAttributesTests);
      // According to the spec, red below should be returned as an
      // RGBA value.
      expect(page.divWithStyle.attributes['style'],
          'display: none; background-color: red;');
      expect(page.divWithStyle.attributes['STYLE'],
          'display: none; background-color: red;');
      expect(page.divWithStyle.attributes['StYlE'],
          'display: none; background-color: red;');
    });

    test('checked', () {
      var page = loader.getInstance(PageForAttributesTests);
      expect(page.checkbox.attributes['checked'], isNull);
      page.checkbox.click();
      expect(page.checkbox.attributes['checked'], 'true');
    });

    test('disabled', () {
      var page = loader.getInstance(PageForAttributesTests);
      expect(page.readOnly.attributes['disabled'], 'true');
      expect(page.text.attributes['disabled'], isNull);
    });

    test('not a property', () {
      var page = loader.getInstance(PageForAttributesTests);
      expect(page.table.attributes['non-standard'], 'a non standard attr');
    });

    test('option values', () {
      var page = loader.getInstance(PageForAttributesTests);
      // The expects below are according to the WebDriver spec, but currently
      // fail
      // expect(page.option1.attributes['value'], 'option 1');
      // expect(page.option1.attributes['VaLuE'], 'option 1');
      expect(page.option2.attributes['value'], 'value 2');
      expect(page.option2.attributes['VaLuE'], 'value 2');
    });

    test('option selected', () {
      var page = loader.getInstance(PageForAttributesTests);
      page.option2.click();
      expect(page.select1.attributes['value'], equals('value 2'));
    });

    test('selected on checkbox', () {
      var page = loader.getInstance(PageForAttributesTests);
      expect(page.checkbox.attributes['selected'], isNull);
      expect(page.checkbox.attributes['SeLeCtEd'], isNull);
      page.checkbox.click();
      expect(page.checkbox.attributes['selected'], 'true');
      expect(page.checkbox.attributes['SeLeCtEd'], 'true');
    });

    test('selected on radio', () {
      var page = loader.getInstance(PageForAttributesTests);
      expect(page.radio.attributes['selected'], isNull);
      expect(page.radio.attributes['SeLeCtEd'], isNull);
      page.radio.click();
      expect(page.radio.attributes['selected'], 'true');
      expect(page.radio.attributes['SeLeCtEd'], 'true');
    });

    test('href on a', () {
      var page = loader.getInstance(PageForAttributesTests);
      expect(page.anchor.attributes['href'], endsWith('/test.html'));
    });

    test('src on img', () {
      var page = loader.getInstance(PageForAttributesTests);
      expect(page.img.attributes['src'], endsWith('/test.png'));
    });

    test('class/className', () {
      var page = loader.getInstance(PageForAttributesTests);
      expect(page.table.attributes['class'], 'class1 class2 class3');
      expect(page.table.attributes['className'], 'class1 class2 class3');
    });

    test('readonly/readOnly', () {
      var page = loader.getInstance(PageForAttributesTests);
      expect(page.readOnly.attributes['readonly'], 'true');
      expect(page.readOnly.attributes['readOnly'], 'true');
      expect(page.text.attributes['readonly'], isNull);
      expect(page.text.attributes['readOnly'], isNull);
    });

    test('value on text', () {
      var page = loader.getInstance(PageForAttributesTests);
      expect(page.text.attributes['value'], '');
      page.text.type('some text');
      expect(page.text.attributes['value'], 'some text');
    });
  });

  group('typing', () {
    test('typing should append', () {
      var page = loader.getInstance(PageForAttributesTests);
      expect(page.text.attributes['value'], '');
      page.text.type('some text');
      expect(page.text.attributes['value'], 'some text');
      page.text.type(' and more text');
      expect(page.text.attributes['value'], 'some text and more text');
    });

    test('value after clear', () {
      var page = loader.getInstance(PageForAttributesTests);
      expect(page.text.attributes['value'], '');
      page.text.type('some text');
      expect(page.text.attributes['value'], 'some text');
      page.text.clear();
      expect(page.text.attributes['value'], '');
    });
  });
}
