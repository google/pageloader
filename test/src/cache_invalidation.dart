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

part 'cache_invalidation.g.dart';

typedef PageLoaderElement GetNewContext();

typedef void DoRefresh();

// Tests that require a refresh.
void runTests(GetNewContext contextGenerator, DoRefresh refresh) {
  group('cache invalidation ', () {
    test('handled correctly for single', () async {
      final cacheInvalidation =
          new CacheInvalidation.create(contextGenerator());
      final button1 = cacheInvalidation.button1;
      await button1.click();
      refresh();
      await button1.click();
    });

    test('stale elements handled correctly for nested', () async {
      final cacheInvalidation =
          new CacheInvalidation.create(contextGenerator());
      final select1 = cacheInvalidation.select1;
      expect(select1.option1.innerText, 'option 1');
      expect(select1.option2.innerText, 'option 2');
      refresh();
      expect(select1.option1.innerText, 'option 1');
      expect(select1.option2.innerText, 'option 2');
    });
  });
}

@PageObject()
abstract class CacheInvalidation {
  CacheInvalidation();
  factory CacheInvalidation.create(PageLoaderElement context) =
      $CacheInvalidation.create;

  @ById('button-1')
  PageLoaderElement get button1;

  @ById('select1')
  _Nested get select1;
}

@PageObject()
abstract class _Nested {
  _Nested();
  factory _Nested.create(PageLoaderElement context) = $_Nested.create;

  @ById('option1')
  PageLoaderElement get option1;

  @ById('option2')
  PageLoaderElement get option2;
}
