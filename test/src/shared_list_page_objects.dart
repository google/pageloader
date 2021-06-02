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

part 'shared_list_page_objects.g.dart';

@PageObject()
abstract class PageForSimpleTest {
  PageForSimpleTest();
  factory PageForSimpleTest.create(PageLoaderElement? context) =
      $PageForSimpleTest.create;

  @root
  PageLoaderElement? get rootElement;

  @ByTagName('table')
  Table get table;
}

@PageObject()
abstract class Table {
  Table();
  factory Table.create(PageLoaderElement context) = $Table.create;

  @root
  PageLoaderElement? get table;

  @ByTagName('tr')
  Future<List<Row>> get rows;

  @ByTagName('tr')
  List<Row> get rowsSync;
}

@PageObject()
abstract class Row {
  Row();
  factory Row.create(PageLoaderElement context) = $Row.create;

  @root
  PageLoaderElement? get rootElement;

  @ByTagName('td')
  Future<List<PageLoaderElement>> get cells;
}

Future verifyRows(List<Row> rows) async {
  expect(rows.length, 2);
  var rowCount = 0;
  for (final row in rows) {
    final cells = await row.cells;
    expect(cells.length, 2);

    rowCount++;
    var cellCount = 0;
    for (final cell in cells) {
      cellCount++;
      expect(cell.visibleText, 'r${rowCount}c$cellCount');
    }
  }
}

Future verifyTable(Table table) async {
  await verifyRows(await table.rows);
}
