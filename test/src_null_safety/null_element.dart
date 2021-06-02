// Copyright 2018 Google Inc. All rights reserved.
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

part 'null_element.g.dart';

typedef GetNewContext = PageLoaderElement Function();

void runTests(GetNewContext contextGenerator) {
  group('nullElement works', () {
    late BasePO po;

    setUp(() {
      po = BasePO.create(contextGenerator());
    });

    test('single element', () {
      expect(po.button, exists);
      expect(po.nullButton, notExists);
    });

    test('single element po', () {
      expect(po.buttonPO, exists);
      expect(po.nullButtonPO, notExists);
    });

    test('list element', () {
      for (var i = 0; i < po.allRows.length; i++) {
        if (i == po.allRows.length - 1) {
          expect(po.allRows[i], notExists);
        } else {
          expect(po.allRows[i], exists);
        }
      }
    });

    test('list element POs', () {
      for (var i = 0; i < po.allRowPOs.length; i++) {
        if (i == po.allRowPOs.length - 1) {
          expect(po.allRowPOs[i], notExists);
        } else {
          expect(po.allRowPOs[i], exists);
        }
      }
    });
  });
}

@PageObject()
abstract class BasePO {
  BasePO();
  factory BasePO.create(PageLoaderElement context) = $BasePO.create;

  @ById('button-1')
  PageLoaderElement get button;

  @nullElement
  PageLoaderElement get nullButton;

  @ById('button-1')
  ButtonPO get buttonPO;

  @nullElement
  ButtonPO get nullButtonPO;

  @ByTagName('tr')
  List<PageLoaderElement> get _rowElements;

  @nullElement
  PageLoaderElement get _nullRowElement;

  List<PageLoaderElement> get allRows => _rowElements + [_nullRowElement];

  @ByTagName('tr')
  List<RowPO> get _rowPOs;

  @nullElement
  RowPO get _nullRowPO;

  List<RowPO> get allRowPOs => _rowPOs + [_nullRowPO];
}

@PageObject()
abstract class ButtonPO {
  ButtonPO();
  factory ButtonPO.create(PageLoaderElement context) = $ButtonPO.create;
}

@PageObject()
abstract class RowPO {
  RowPO();
  factory RowPO.create(PageLoaderElement context) = $RowPO.create;
}
