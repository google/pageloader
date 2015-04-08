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

library pageloader.sync.test.page_objects;

import 'package:pageloader/sync/objects.dart';

class PageForSimpleTest {
  PageLoader loader;

  @ByTagName('table')
  Table table;
}

class SubclassPage extends PageForSimpleTest {}

@Union(const [Root, const ByTagName('table')])
@IsTag('table')
class Table {
  @Root
  PageLoaderElement root;

  @ByTagName('tr')
  List<Row> rows;
}

@EnsureTag('table')
class TableForEnsureTag {
  @Root
  PageLoaderElement root;

  @ByTagName('tr')
  List<Row> rows;
}

class Row {
  @ByTagName('td')
  List<PageLoaderElement> cells;
}

class PageForClassAnnotationTest {
  @Root
  Table table;
}

class PageForDisplayedFilteringTest {
  @ById('div')
  @WithState.present()
  List<PageLoaderElement> shouldHaveOneElement;

  @ById('div')
  List<PageLoaderElement> shouldBeEmpty;

  @ById('div')
  @WithState.visible()
  List shouldAlsoBeEmpty;
}

class PageForSettersTest {
  List<PageLoaderElement> _shouldHaveOneElement;
  var _loader;

  set loader(PageLoader l) {
    this._loader = l;
  }

  PageLoader get loader => _loader;

  @ById('div')
  @WithState.present()
  set shouldHaveOneElement(List<PageLoaderElement> elements) {
    _shouldHaveOneElement = elements;
  }

  get shouldHaveOneElement => _shouldHaveOneElement;
}

class PageForSkipFinalTest {
  @ById('div')
  @WithState.present()
  List<PageLoaderElement> shouldHaveOneElement;

  @ById('div')
  @WithState.present()
  final List<PageLoaderElement> shouldBeNull = null;

  final PageLoader loader = null;
}

class PageForSkipFieldsWithoutFinderTest {
  @ById('div')
  @WithState.present()
  List<PageLoaderElement> shouldHaveOneElement;

  @WithState.present()
  List<PageLoaderElement> shouldBeNull;
}

class PageForNoMatchingElementTest {
  @ById('non-existent id')
  PageLoaderElement doesntExist;
}

@ById('non-existent id')
class PageForNoMatchingClassElementTest {
  @Root
  PageLoaderElement doesntExist;
}

class PageForNullableElementTest {
  @ById('non-existent id')
  @Optional
  PageLoaderElement doesntExist;
}

class PageForMultipleMatchingElementTest {
  @ByTagName('td')
  PageLoaderElement doesntExist;
}

@ByTagName('td')
class PageForMultipleMatchingClassElementTest {
  @Root
  PageLoaderElement doesntExist;
}

class PageForMultipleFinderTest {
  @ById('non-existent id')
  @ByTagName('a-name')
  PageLoaderElement multipleFinder;
}

@ById('non-existent id')
@ByTagName('a-name')
class PageForMultipleClassFinderTest {
  @Root
  PageLoaderElement multipleFinder;
}

class PageForInvalidConstructorTest {
  PageForInvalidConstructorTest(String someArg);

  @ById('div')
  @WithState.present()
  List<PageLoaderElement> shouldHaveOneElement;
}

class PageForWithAttributeTest {
  @ByTagName('input')
  @WithAttribute('type', 'checkbox')
  PageLoaderElement element;
}

class PageForAmbiguousTest {
  @ByTagName('input')
  PageLoaderElement element;
}

class PageForMixinTest extends PageForSimpleTest
    with PageForDisplayedFilteringTest {}

class PageForPrivateConstructorTest extends PageForSimpleTest {
  PageForPrivateConstructorTest._();
}

class PageForPrivateFieldsTest {
  @ByTagName('table')
  Table _privateTable;

  Table get table => _privateTable;
}

class PageForPrivateSettersTest {
  Table table;

  @ByTagName('table')
  set _table(Table t) => table = t;
}

class PageForStaticFieldsTest extends PageForSimpleTest {
  @ByTagName("table")
  static PageLoaderElement dontSet;
}

class PageForStaticSettersTest extends PageForSimpleTest {
  static var _dontSet;

  @ByTagName("table")
  static set dontSet(PageLoaderElement el) {
    _dontSet = el;
  }

  static get dontSet => _dontSet;
}

typedef NoTypeFn();

typedef PageLoaderElement PageLoaderElementFn();

typedef Table TableFn();

typedef List NoListTypeFn();

typedef List<PageLoaderElement> PageLoaderElementsFn();

typedef List<Row> RowsFn();

class PageForFunctionTest {

  // Functions

  @ByTagName('table')
  Function noReturnsFn;

  @ByTagName('table')
  @Returns(PageLoaderElement)
  var noTypeFn;

  @ByTagName('table')
  @Returns(PageLoaderElement)
  Function pageLoaderElementFn;

  @ByTagName('table')
  @Returns(Table)
  Function tableFn;

  @ByTagName('table')
  Lazy lazyElement;

  @ByTagName('table')
  Lazy<Table> lazyTable;

  // Functions + Lists

  @ByCss('table tr')
  @Returns(List)
  var noTypesFn;

  @ByCss('table tr')
  @Returns(List)
  Function returnsGenericListFn;

  @ByCss('table tr')
  @ReturnsList(PageLoaderElement)
  Function pageLoaderElementsFn;

  @ByCss('table tr')
  @ReturnsList(Row)
  Function rowsFn;

  @ByCss('table tr')
  Lazy<List> lazyRowElements;

  @ByCss('table tr')
  Lazy<List<Row>> lazyRows;

  // TypeDefs

  @ByTagName('table')
  NoTypeFn noTypeDef;

  @ByTagName('table')
  PageLoaderElementFn plElementTypeDef;

  @ByTagName('table')
  TableFn tableTypeDef;

  // TypeDefs + Lists

  @ByCss('table tr')
  NoListTypeFn noListTypeDef;

  @ByCss('table tr')
  PageLoaderElementsFn plElementsTypeDef;

  @ByCss('table tr')
  RowsFn rowsTypeDef;
}

@InShadowDom()
class ButtonShadowDOM {
  @ById("inner")
  PageLoaderElement button;
}

class PageForShadowDomTest {
  @ById('button-1')
  ButtonShadowDOM button1;

  @ById('button-2')
  ButtonShadowDOM button2;

  @ById('inner')
  List<PageLoaderElement> shouldBeEmpty;
}

class PageForShadowDomWithVisibleTextTest {
  @ByTagName('a-custom-tag')
  @WithVisibleText('some')
  @WithVisibleText('button 1')
  PageLoaderElement button1;
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

  Iterable<String> get outerDivsText => outerDivs.map((e) => e.visibleText);
  Iterable<String> get innerDivsText => innerDivs.map((e) => e.visibleText);
}

class PageForShadowDomWithInnerTextTest {
  @ByTagName('a-custom-tag')
  @WithInnerText('some')
  @WithInnerText('button 1')
  List<PageLoaderElement> shouldBeEmpty;

  @ByTagName('a-custom-tag')
  @WithInnerText('button 1')
  PageLoaderElement button1;
}

class PageForTextOnShadowRootTest {
  @ByTagName('a-custom-tag')
  List<PageLoaderElement> buttons;
}

class PageForAttributesTests {
  @ById('div')
  @WithState.present()
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

class PageForEqualityTest {
  @Union(const [const ByTagName('a-custom-tag'), const ByCss('a-custom-tag')])
  List<PageLoaderElement> buttons;
}

class PageForWithClassTest {
  @ByTagName('input')
  @WithClass('with-class-test')
  PageLoaderElement element;
}

class PageForOptionalFunctionTest {
  @ByTagName('non-existant')
  @Optional
  @Returns(PageLoaderElement)
  var shouldBeNull;

  @ById('button-1')
  @Optional
  @Returns(PageLoaderElement)
  var shouldBeNonNull;
}

class PageForMouseTest {
  @ById('mouse')
  PageLoaderElement element;
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

class PageForTextAreaTypingText {
  @ById('textarea')
  PageLoaderElement textArea;
}

class PageForNbspTest {
  @ById('nbsp')
  PageLoaderElement span;
}
