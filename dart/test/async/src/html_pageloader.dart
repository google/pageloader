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
library pageloader.async.test.html;

import 'dart:async';
import 'dart:html' as html;

import 'package:pageloader/async/html.dart';
import 'package:pageloader/async/objects.dart';
import 'package:test/test.dart';
import 'shared.dart';

void runTests() {
  group('html PageLoader', () {
    test('value on text', () async {
      PageForTypingTests page = await loader.getInstance(PageForTypingTests);
      var handlerCalled = new Completer<bool>();
      var node = (page.text as HtmlPageLoaderElement).node as html.InputElement;
      node.onInput.listen((event) {
        handlerCalled.complete(true);
      });
      expect(await page.text.attributes['value'], '');
      await page.text.type('some text');
      expect(await page.text.attributes['value'], 'some text');
      expect(await handlerCalled.future, isTrue);
    });

    test('keypress events', () async {
      var data = 'my data';
      var list = [];
      html.document.body.onKeyPress.listen((evt) => list.add(evt.charCode));
      await loader.globalContext.type(data);
      expect(new String.fromCharCodes(list), equals(data));
    }, onPlatform: {'dartium': new Skip('Key events do not work on dartium')});
  });
}

class PageForTypingTests {
  @ById('text')
  PageLoaderElement text;
}
