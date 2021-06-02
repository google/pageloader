// @dart = 2.9

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

part 'findchain.g.dart';

typedef GetNewContext = PageLoaderElement Function();

void runTests(GetNewContext contextGenerator,
    List<String> Function(String xpath) getParents) {
  group('findchain can locate', () {
    test('single page object member', () async {
      final page = PageForFindChainTests.create(contextGenerator()) as dynamic;
      expect(page.findChain(getParents('/HTML[1]/BODY[1]/BUTTON[1]'), 'click'),
          'custom.click');
    });

    test('list page object member', () async {
      final page = PageForFindChainTests.create(contextGenerator()) as dynamic;
      expect(page.findChain(getParents('/HTML[1]/BODY[1]/DIV[9]'), 'click'),
          'outers[1].click');
    });

    test('page object getter', () async {
      final page = PageForFindChainTests.create(contextGenerator()) as dynamic;
      expect(page.findChain(getParents('/HTML[1]/BODY[1]/DIV[8]'), 'click'),
          'firstOuter.click');
    });

    test('single PageLoaderElement member', () async {
      final page = PageForFindChainTests.create(contextGenerator()) as dynamic;
      expect(
          page.findChain(getParents('/HTML[1]/BODY[1]/DIV[9]/DIV[2]'), 'click'),
          'outers[1].specialInner.click');
    });

    test('member from mixin', () async {
      final page = PageForFindChainTests.create(contextGenerator()) as dynamic;
      expect(
          page.findChain(getParents('/HTML[1]/BODY[1]/DIV[9]/DIV[3]'), 'click'),
          'outers[1].inners[2].click');
    });

    test('List PageLoaderElement member', () async {
      final page = PageForFindChainTests.create(contextGenerator()) as dynamic;
      expect(page.findChain(getParents('/HTML[1]/BODY[1]/INPUT[2]'), 'click'),
          'inputs[2].click');
    });

    test('PageLoaderElement getter', () async {
      final page = PageForFindChainTests.create(contextGenerator()) as dynamic;
      expect(
          page.findChain(getParents('/HTML[1]/BODY[1]/DIV[9]/DIV[1]'), 'click'),
          'outers[1].firstInner.click');
    });

    test('with @Global selector', () async {
      final page = PageForFindChainTests.create(contextGenerator()).firstOuter
          as dynamic;
      expect(page.findChain(getParents('/HTML[1]/BODY[1]/DIV[2]'), 'click'),
          'divDiv.click');
    });
  });
  group('PageLoader.code', () {
    test('works.', () async {
      final page = PageForFindChainTests.create(contextGenerator()) as dynamic;
      expect(
          page.findChain(
              getParents('/HTML[1]/BODY[1]/TABLE[1]/TBODY[1]/TR[2]/TD[1]'),
              'value'),
          'table.rows[1].test');
    });

    test('works with different action.', () async {
      final page = PageForFindChainTests.create(contextGenerator()) as dynamic;
      expect(
          page.findChain(
              getParents('/HTML[1]/BODY[1]/TABLE[1]/TBODY[1]/TR[2]/TD[1]'),
              'click'),
          'table.rows[1].focus');
    });

    test('works with default action.', () async {
      final page = PageForFindChainTests.create(contextGenerator()) as dynamic;
      expect(
          page.findChain(
              getParents('/HTML[1]/BODY[1]/TABLE[1]/TBODY[1]/TR[2]/TD[1]')),
          'table.rows[1].cells[0]');
    });

    test('works with invalid action.', () async {
      final page = PageForFindChainTests.create(contextGenerator()) as dynamic;
      expect(
          page.findChain(
              getParents('/HTML[1]/BODY[1]/TABLE[1]/TBODY[1]/TR[2]/TD[1]')),
          'table.rows[1].cells[0]');
    });
  });
}

@PageObject()
abstract class PageForFindChainTests {
  PageForFindChainTests();

  factory PageForFindChainTests.create(PageLoaderElement context) =
      $PageForFindChainTests.create;

  @ByTagName('input')
  List<PageLoaderElement> get inputs;

  @ByClass('outer-div')
  List<OuterPO> get outers;

  OuterPO get firstOuter => outers.first;

  @ById('button-1')
  CustomPO get custom;

  @ByCheckTag()
  List<CustomPO> get customPOs;

  @ById('table1')
  TablePO get table;
}

@PageObject()
@CheckTag('button')
abstract class CustomPO {
  CustomPO();

  factory CustomPO.create(PageLoaderElement context) = $CustomPO.create;
}

@PageObject()
abstract class OuterPO with OuterMixin {
  OuterPO();

  factory OuterPO.create(PageLoaderElement context) = $OuterPO.create;

  @ByClass('special')
  PageLoaderElement get specialInner;

  @Global(ById('div'))
  PageLoaderElement get divDiv;

  PageLoaderElement get firstInner => inners.first;
}

@PageObject()
abstract class OuterMixin {
  @ByClass('inner-div')
  List<PageLoaderElement> get inners;
}

@PageObject()
abstract class TablePO {
  TablePO();

  factory TablePO.create(PageLoaderElement context) = $TablePO.create;

  @ByTagName('tr')
  List<RowPO> get rows;
}

@PageObject(code: {'value': 'test', 'click': 'focus'})
abstract class RowPO {
  RowPO();

  factory RowPO.create(PageLoaderElement context) = $RowPO.create;

  @ByTagName('td')
  List<PageLoaderElement> get cells;
}
