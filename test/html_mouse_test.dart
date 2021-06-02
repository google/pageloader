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

@TestOn('browser')

import 'package:pageloader/html.dart';
import 'package:test/test.dart';

import 'data/html_setup.dart' as html_setup;
import 'src/mouse.dart';

void main() {
  runTests(() => html_setup.getRoot());

  group('HTML-only mouse tests', () {
    PageForMouseTest page;
    PageLoaderMouse mouse;

    setUp(() {
      page = PageForMouseTest.create(html_setup.getRoot());
      mouse = page.mouse;
    });

    test('additional events are fired on moveTo', () async {
      // make sure mouse is not on element;
      await mouse.moveTo(page.element, -10, -10);
      expect(page.element.visibleText, equals('area for mouse events'));

      // move to element...
      await mouse.moveTo(page.element, 0, 0);
      expect(page.element.visibleText, isNot(contains('MouseLeave')));
      expect(page.element.visibleText, isNot(contains('MouseOut')));
      expect(page.element.visibleText, contains('MouseMove'));
      expect(page.element.visibleText, contains('MouseEnter'));
      expect(page.element.visibleText, contains('MouseOver'));

      // then move out
      await mouse.moveTo(page.element, -10, -10);
      expect(page.element.visibleText, contains('MouseLeave'));
      expect(page.element.visibleText, contains('MouseOut'));
    });

    group('moves to center on', () {
      int expectedXCenter;
      int expectedYCenter;

      setUp(() {
        final rect =
            (page.element as HtmlPageLoaderElement).getBoundingClientRect();
        expectedXCenter = rect.left + (rect.width * 0.5).ceil();
        expectedYCenter = rect.top + (rect.height * 0.5).ceil();
      });

      test('moveTo with null,null coords', () async {
        await mouse.moveTo(page.element, null, null);
        expect(page.element.visibleText,
            contains('MouseMove: $expectedXCenter, $expectedYCenter'));
      });

      test('down with eventTarget', () async {
        await mouse.down(MouseButton.primary, eventTarget: page.element);
        expect(page.element.visibleText,
            contains('MouseMove: $expectedXCenter, $expectedYCenter'));
      });

      test('up with eventTarget', () async {
        await mouse.up(MouseButton.primary, eventTarget: page.element);
        expect(page.element.visibleText,
            contains('MouseMove: $expectedXCenter, $expectedYCenter'));
      });
    });

    group('click on ', () {
      int expectedXCenter;
      int expectedYCenter;
      int expectedXLeft;
      int expectedYTop;
      final clickOption = ClickOption();

      setUp(() {
        final rect =
            (page.element as HtmlPageLoaderElement).getBoundingClientRect();
        expectedXCenter = rect.left + (rect.width * 0.5).ceil();
        expectedYCenter = rect.top + (rect.height * 0.5).ceil();
        expectedXLeft = rect.left;
        expectedYTop = rect.top;
      });

      test('non-svg element', () async {
        await page.element.click(clickOption: clickOption);

        expect(page.svgOutputElement.visibleText.contains('Click: '), isFalse);
      });

      test('svg element on top-left', () async {
        clickOption.clientX = expectedXLeft;
        clickOption.clientY = expectedYTop;

        await page.svgElement.click(clickOption: clickOption);

        expect(page.svgOutputElement.visibleText,
            contains('Click: $expectedXLeft, $expectedYTop'));
      });

      test('svg element in the center', () async {
        clickOption.clientX = expectedXCenter;
        clickOption.clientY = expectedYCenter;

        await page.svgElement.click(clickOption: clickOption);

        expect(page.svgOutputElement.visibleText,
            contains('Click: $expectedXCenter, $expectedYCenter'));
      });
    });

    test('stepPixels and trackedElements works', () async {
      // Send mouse events to only top and bottom, and expect
      // center mouse event to also detect mouse events
      final center = page.centerElement;

      // Make sure center element has no events registered initially
      expect(center.visibleText, equals('center area for mouse events'));

      await mouse.moveTo(page.topElement, 0, null);
      // Track the center element and move at 2 pixel at a time
      // between every movement.
      await mouse.moveTo(page.bottomElement, 0, null,
          dispatchTo: [center], stepPixels: 2);

      expect(center.visibleText, contains('MouseLeave'));
      expect(center.visibleText, contains('MouseOut'));
      expect(center.visibleText, contains('MouseMove'));
      expect(center.visibleText, contains('MouseEnter'));
      expect(center.visibleText, contains('MouseOver'));
    });
  });
}
