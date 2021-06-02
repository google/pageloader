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

part 'shared_page_objects.g.dart';

@PageObject()
abstract class PageForSimpleTest {
  PageForSimpleTest();
  factory PageForSimpleTest.create(PageLoaderElement context) =
      $PageForSimpleTest.create;

  @ByTagName('table')
  Table get table;
}

@PageObject()
abstract class Table {
  Table();
  factory Table.create(PageLoaderElement context) = $Table.create;

  @root
  PageLoaderElement get table;

  @ByTagName('tr')
  PageObjectIterable<Row> get rows;

  Future doSlowAction() async {
    return Future.delayed(Duration(seconds: 5));
  }
}

@PageObject()
abstract class Row {
  Row();
  factory Row.create(PageLoaderElement context) = $Row.create;

  @ByTagName('td')
  PageObjectIterable<PageLoaderElement> get cells;
}

Future verifyRows(PageObjectIterable<Row> rows) async {
  final rowIt = await rows.iterator;
  var rowCount = 0;
  while (rowIt.moveNext()) {
    rowCount++;
    final cellIt = await rowIt.current.cells.iterator;
    var cellCount = 0;
    while (cellIt.moveNext()) {
      cellCount++;
      expect(cellIt.current.visibleText, 'r${rowCount}c$cellCount');
    }
    expect(cellCount, 2);
  }
  expect(rowCount, 2);
}

Future verifyTable(Table table) async {
  await verifyRows(table.rows);
}
