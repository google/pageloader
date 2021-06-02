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

part 'scroll.g.dart';

typedef GetNewContext = PageLoaderElement Function();

void runTests(GetNewContext contextGenerator) {
  ScrollPO scrollPO;

  setUp(() {
    scrollPO = ScrollPO.create(contextGenerator());
  });

  group('scroll', () {
    test('y down', () async {
      expect(scrollPO.scrollLeft, 0);
      expect(scrollPO.scrollTop, 0);
      await scrollPO.scroll(y: 500);
      expect(scrollPO.scrollLeft, 0);
      expect(scrollPO.scrollTop, 500);
    });

    test('y down then up', () async {
      expect(scrollPO.scrollLeft, 0);
      expect(scrollPO.scrollTop, 0);
      await scrollPO.scroll(y: 500);
      await scrollPO.scroll(y: -300);
      expect(scrollPO.scrollLeft, 0);
      expect(scrollPO.scrollTop, 200);
    });

    test('x right', () async {
      expect(scrollPO.scrollLeft, 0);
      expect(scrollPO.scrollTop, 0);
      await scrollPO.scroll(x: 40);
      expect(scrollPO.scrollLeft, 40);
      expect(scrollPO.scrollTop, 0);
    });

    test('x right then left', () async {
      expect(scrollPO.scrollLeft, 0);
      expect(scrollPO.scrollTop, 0);
      await scrollPO.scroll(x: 40);
      await scrollPO.scroll(x: -30);
      expect(scrollPO.scrollLeft, 10);
      expect(scrollPO.scrollTop, 0);
    });

    test('x and y', () async {
      expect(scrollPO.scrollLeft, 0);
      expect(scrollPO.scrollTop, 0);
      await scrollPO.scroll(x: 40, y: 500);
      expect(scrollPO.scrollLeft, 40);
      expect(scrollPO.scrollTop, 500);
    });

    test('x and y reverse', () async {
      expect(scrollPO.scrollLeft, 0);
      expect(scrollPO.scrollTop, 0);
      await scrollPO.scroll(x: 40, y: 500);
      await scrollPO.scroll(x: -30, y: -300);
      expect(scrollPO.scrollLeft, 10);
      expect(scrollPO.scrollTop, 200);
    });

    test('to element', () async {
      expect(scrollPO.scrollTop, 0);
      await scrollPO.scrollBottom.scrollIntoView();
      await Future.delayed(Duration(seconds: 3));
      expect(scrollPO.scrollTop, greaterThan(0));
    });
  });
}

@PageObject()
abstract class ScrollPO {
  ScrollPO();

  factory ScrollPO.create(PageLoaderElement context) = $ScrollPO.create;

  @ById('scroll-box')
  PageLoaderElement get _scrollBox;

  @ById('scroll-bottom')
  PageLoaderElement get scrollBottom;

  @ById('scroll-left')
  PageLoaderElement get _scrollLeft;

  @ById('scroll-top')
  PageLoaderElement get _scrollTop;

  Future<void> scroll({int x, int y}) => _scrollBox.scroll(x: x, y: y);

  int get scrollLeft => int.parse(_scrollLeft.innerText);

  int get scrollTop => int.parse(_scrollTop.innerText);
}
