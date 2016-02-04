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

@TestOn('browser')
library pageloader.sync.test.html_no_shadow_dom;

import 'dart:html' as html;

import 'package:sync_pageloader/html.dart';
import 'package:test/test.dart';

import 'data/html_no_shadow_dom_setup.dart' as html_setup;
import 'page_objects.dart';
import 'pageloader_test.dart' as plt;

void main() {
  setUp(() {
    var div = html_setup.setUp();

    plt.loader = new HtmlPageLoader(div, useShadowDom: false);
  });

  group('html specific tests', () {
    test('value on text', () {
      var page = plt.loader.getInstance(PageForAttributesTests);
      var handlerCalled = false;
      var node = (page.text as HtmlPageLoaderElement).node as html.InputElement;
      node.onInput.listen((event) {
        handlerCalled = true;
      });
      expect(page.text.attributes['value'], '');
      page.text.type('some text');
      expect(page.text.attributes['value'], 'some text');
      expect(handlerCalled, isTrue);
    });

    test('keypress events', () {
      var data = 'my data';
      var list = [];
      html.document.body.onKeyPress.listen((evt) => list.add(evt.charCode));
      plt.loader.globalContext.type(data);
      expect(new String.fromCharCodes(list), equals(data));
    }, onPlatform: {
      'dartium': new Skip('Key events do not work on dartium'),
      'content-shell': new Skip('Key events do not work in content-shell')
    });
  });

  plt.runTests();
}
