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

@TestOn('browser')
@Tags(['html'])

import 'package:pageloader/html.dart';
import 'package:test/test.dart';

import 'data/html_setup.dart' as html_setup;
import 'src_null_safety/pointer.dart';

void main() {
  runTests(() => html_setup.getRoot());

  group('HTML-only pointer tests', () {
    late PageForPointerTest page;
    late PageLoaderPointer pointer;

    setUp(() {
      page = PageForPointerTest.create(html_setup.getRoot());
      pointer = page.pointer;
    });

    test('additional events are fired on moveTo', () async {
      // make sure pointer is not on element;
      await pointer.moveTo(page.element, -10, -10);
      expect(page.element.visibleText, equals('area for pointer events'));

      // move to element...
      await pointer.moveTo(page.element, 0, 0);
      expect(page.element.visibleText, isNot(contains('PointerLeave')));
      expect(page.element.visibleText, isNot(contains('PointerOut')));
      expect(page.element.visibleText, contains('PointerMove'));
      expect(page.element.visibleText, contains('PointerEnter'));
      expect(page.element.visibleText, contains('PointerOver'));

      // then move out
      await pointer.moveTo(page.element, -10, -10);
      expect(page.element.visibleText, contains('PointerLeave'));
      expect(page.element.visibleText, contains('PointerOut'));
    });

    group('moves to center on', () {
      late int expectedXCenter;
      late int expectedYCenter;

      setUp(() {
        final rect =
            (page.element as HtmlPageLoaderElement).getBoundingClientRect();
        expectedXCenter = (rect.left as int) + (rect.width * 0.5).ceil();
        expectedYCenter = (rect.top as int) + (rect.height * 0.5).ceil();
      });

      test('moveTo with null,null coords', () async {
        await pointer.moveTo(page.element, null, null);
        expect(page.element.visibleText,
            contains('PointerMove: $expectedXCenter, $expectedYCenter'));
      });

      test('down with eventTarget', () async {
        await pointer.down(MouseButton.primary, eventTarget: page.element);
        expect(page.element.visibleText,
            contains('PointerMove: $expectedXCenter, $expectedYCenter'));
      });

      test('up with eventTarget', () async {
        await pointer.up(MouseButton.primary, eventTarget: page.element);
        expect(page.element.visibleText,
            contains('PointerMove: $expectedXCenter, $expectedYCenter'));
      });
    });

    test('stepPixels and trackedElements works', () async {
      // Send pointer events to only top and bottom, and expect
      // center pointer event to also detect pointer events
      final center = page.centerElement;

      // Make sure center element has no events registered initially
      expect(center.visibleText, equals('center area for pointer events'));

      await pointer.moveTo(page.topElement, 0, null);
      // Track the center element and move at 2 pixel at a time
      // between every movement.
      await pointer.moveTo(page.bottomElement, 0, null,
          dispatchTo: [center], stepPixels: 2);

      expect(center.visibleText, contains('PointerLeave'));
      expect(center.visibleText, contains('PointerOut'));
      expect(center.visibleText, contains('PointerMove'));
      expect(center.visibleText, contains('PointerEnter'));
      expect(center.visibleText, contains('PointerOver'));
    });
  });
}
