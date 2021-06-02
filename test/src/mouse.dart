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
import 'package:webdriver/support/async.dart';

part 'mouse.g.dart';

typedef GetNewContext = PageLoaderElement Function();

void runTests(GetNewContext contextGenerator) {
  group('mouse support', () {
    test('basically works', () async {
      final page = PageForMouseTest.create(contextGenerator());
      final mouse = page.mouse;

      await mouse.moveTo(page.element, 2, 2);
      await waitFor(() => page.element.visibleText,
          matcher: contains('MouseMove'));
      await mouse.down(MouseButton.primary);
      await waitFor(() => page.element.visibleText,
          matcher: contains('MouseDown'));
      await mouse.moveTo(page.element, 3, 3);
      await mouse.up(MouseButton.primary);
      await waitFor(() => page.element.visibleText,
          matcher: contains('MouseUp'));
    }, testOn: 'vm');

    test('works with event target', () async {
      final page = PageForMouseTest.create(contextGenerator());
      final mouse = page.mouse;

      // make sure mouse is not on element;
      await mouse.moveTo(page.element, -10, -10);
      await mouse.down(MouseButton.primary, eventTarget: page.element);
      await waitFor(() => page.element.visibleText,
          matcher: contains('MouseDown'));
      await mouse.moveTo(page.element, 200, 200);
      await mouse.up(MouseButton.primary, eventTarget: page.element);
      await waitFor(() => page.element.visibleText,
          matcher: contains('MouseUp'));
    });
  });
}

@PageObject()
abstract class PageForMouseTest {
  PageForMouseTest();
  factory PageForMouseTest.create(PageLoaderElement context) =
      $PageForMouseTest.create;

  @Mouse
  PageLoaderMouse get mouse;

  @ById('mouse')
  PageLoaderElement get element;

  @ById('mouse-top')
  PageLoaderElement get topElement;

  @ById('mouse-center')
  PageLoaderElement get centerElement;

  @ById('mouse-bottom')
  PageLoaderElement get bottomElement;

  @ById('svg-element')
  PageLoaderElement get svgElement;

  @ById('svg-output')
  PageLoaderElement get svgOutputElement;
}
