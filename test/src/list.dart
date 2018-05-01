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

import 'dart:async';
import 'package:pageloader3/pageloader.dart';
import 'package:test/test.dart';

part 'list.g.dart';

typedef PageLoaderElement GetNewContext();

String _removeWhiteSpace(String s) =>
    s.replaceAll(' ', '').replaceAll('\n', '');

void runTests(GetNewContext contextGenerator) {
  group('list works', () {
    test('asynchronously', () async {
      final list = new Lists.create(contextGenerator());
      expect(await list.tableRows, hasLength(2));
    });

    test('synchronously', () async {
      final list = new Lists.create(contextGenerator());
      final rows = list.tableRowsSync;
      expect(rows, hasLength(2));
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
}
