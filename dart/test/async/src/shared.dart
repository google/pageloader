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

library pageloader.async.test.shared;

import 'package:test/test.dart';
import 'package:pageloader/async/objects.dart';

PageLoader loader;

class PageForSimpleTest {
  @inject
  PageLoader loader;

  @ByTagName('table')
  Table table;
}

@EnsureTag('table')
class Table {
  @root
  PageLoaderElement table;

  @ByTagName('tr')
  List<Row> rows;
}

class Row {
  @ByTagName('td')
  List<PageLoaderElement> cells;
}

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
