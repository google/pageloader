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

library pageloader.test.mouse;

import 'package:pageloader/objects.dart';
import 'package:test/test.dart';
import 'package:webdriver/support/async.dart';
import 'shared.dart';

void runTests() {
  group('mouse tests', () {
    test('mouse', () async {
      PageForMouseTest page = await loader.getInstance(PageForMouseTest);

      await loader.loader.mouse.moveTo(page.element, 2, 2);
      await waitFor(() => page.element.visibleText,
          matcher: contains('MouseMove'));
      await loader.loader.mouse.down(MouseButton.primary);
      await waitFor(() => page.element.visibleText,
          matcher: contains('MouseDown'));
      await loader.loader.mouse.moveTo(page.element, 10, 10);
      await loader.loader.mouse.up(MouseButton.primary);
      await waitFor(() => page.element.visibleText,
          matcher: contains('MouseUp'));
    }, testOn: 'vm');

    test('mouse with event target', () async {
      PageForMouseTest page = await loader.getInstance(PageForMouseTest);

      // make sure mouse is not on element;
      await loader.loader.mouse.moveTo(page.element, -10, -10);
      await loader.loader.mouse
          .down(MouseButton.primary, eventTarget: page.element);
      await waitFor(() => page.element.visibleText,
          matcher: contains('MouseDown'));
      await loader.loader.mouse.moveTo(page.element, 200, 200);
      await loader.loader.mouse
        ..up(MouseButton.primary, eventTarget: page.element);
      await waitFor(() => page.element.visibleText,
          matcher: contains('MouseUp'));
    });
  });
}

class PageForMouseTest {
  @ById('mouse')
  PageLoaderElement element;
}
