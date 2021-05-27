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

part 'list.g.dart';

typedef GetNewContext = PageLoaderElement Function();

String _removeWhiteSpace(String s) =>
    s.replaceAll(' ', '').replaceAll('\n', '');

void runTests(GetNewContext contextGenerator) {
  group('list works', () {
    test('asynchronously', () async {
      final list = Lists.create(contextGenerator());
      expect(await list.tableRows, hasLength(2));
    });

    test('synchronously', () async {
      final list = Lists.create(contextGenerator());
      final rows = list.tableRowsSync;
      final rowsAsPO = list.tableRowsSyncAsPO;
      expect(rows, hasLength(2));
      expect(rowsAsPO, hasLength(2));
      expect(rowsAsPO[0].exists, isTrue);
      expect(rowsAsPO[1].exists, isTrue);
      expect(rows[0].exists, isTrue);
      expect(rows[1].exists, isTrue);
      expect(_removeWhiteSpace(rows[0].innerText), 'r1c1r1c2');
      expect(_removeWhiteSpace(rows[1].innerText), 'r2c1r2c2');
    });
  });
}

@PageObject()
abstract class Lists {
  Lists();
  factory Lists.create(PageLoaderElement context) = $Lists.create;

  @ByTagName('tr')
  Future<List<PageLoaderElement>> get tableRows;

  @ByTagName('tr')
  List<PageLoaderElement> get tableRowsSync;

  @ByTagName('tr')
  List<RowPO> get tableRowsSyncAsPO;
}

@CheckTag('tr')
@PageObject()
abstract class RowPO {
  RowPO();
  factory RowPO.create(PageLoaderElement context) = $RowPO.create;

  @root
  PageLoaderElement get _root;

  bool get exists => _root.exists;
}
