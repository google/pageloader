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

import 'package:pageloader3/pageloader.dart';
import 'package:test/test.dart';

import 'shared_list_page_objects.dart';

typedef PageLoaderElement GetNewContext();

class TestListener extends PageLoaderListener {
  final String name;
  TestListener(this.name);
}

void runTests(GetNewContext contextGenerator) {
  PageLoaderElement root;

  group('listeners', () {
    setUp(() async {
      root = contextGenerator();
    });

    test('are shared with root element', () async {
      root.addListeners([new TestListener('A')]);

      final page = new PageForSimpleTest.create(root);

      expect(root.listeners, hasLength(1));
      expect(page.rootElement.listeners, hasLength(1));
    });

    test('are shared with created page object', () async {
      root.addListeners([new TestListener('A')]);

      final page = new PageForSimpleTest.create(root);

      expect(root.listeners, hasLength(1));
      expect(page.table.table.listeners, hasLength(1));
    });

    test('are shared with created list', () async {
      root.addListeners([new TestListener('A')]);

      final page = new PageForSimpleTest.create(root);

      expect(root.listeners, hasLength(1));
      expect((await page.table.rows)[0].rootElement.listeners, hasLength(1));
      expect(page.table.rowsSync[0].rootElement.listeners, hasLength(1));
    });
  });
}
