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
import 'package:webdriver/support/async.dart';

part 'pointer.g.dart';

typedef GetNewContext = PageLoaderElement Function();

void runTests(GetNewContext contextGenerator) {
  group('pointer support', () {
    test('basically works', () async {
      final page = PageForPointerTest.create(contextGenerator());
      final pointer = page.pointer!;

      await pointer.moveTo(page.element, 2, 2);
      await waitFor(() => page.element.visibleText,
          matcher: contains('PointerMove'));
      await pointer.down(MouseButton.primary);
      await waitFor(() => page.element.visibleText,
          matcher: contains('PointerDown'));
      await pointer.moveTo(page.element, 10, 10);
      await pointer.up(MouseButton.primary);
      await waitFor(() => page.element.visibleText,
          matcher: contains('PointerUp'));
    }, testOn: 'vm');

    test('works with event target', () async {
      final page = PageForPointerTest.create(contextGenerator());
      final pointer = page.pointer!;

      // make sure pointer is not on element;
      await pointer.moveTo(page.element, -10, -10);
      await pointer.down(MouseButton.primary, eventTarget: page.element);
      await waitFor(() => page.element.visibleText,
          matcher: contains('PointerDown'));
      await pointer.moveTo(page.element, 200, 200);
      await pointer.up(MouseButton.primary, eventTarget: page.element);
      await waitFor(() => page.element.visibleText,
          matcher: contains('PointerUp'));
    });
  });
}

@PageObject()
abstract class PageForPointerTest {
  PageForPointerTest();
  factory PageForPointerTest.create(PageLoaderElement context) =
      $PageForPointerTest.create;

  @Pointer
  PageLoaderPointer? get pointer;

  @ById('pointer')
  PageLoaderElement get element;

  @ById('pointer-top')
  PageLoaderElement get topElement;

  @ById('pointer-center')
  PageLoaderElement get centerElement;

  @ById('pointer-bottom')
  PageLoaderElement get bottomElement;
}
