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

import 'dart:html' as html;

import 'package:pageloader/html.dart';

/// Returns a very long root level element of the document.
///
/// This document should only be used for testing of [PageLoaderException]
/// truncating element's outerHTML attribute.
html.Element setUp() {
  final body = html.document.getElementsByTagName('body').first;
  final bodyHtml = '<div>Very long html</div>' * 5000;
  final results =
      (body as html.Element).querySelectorAll('div[id=testdocument]');
  html.Element div;
  if (results.length == 1) {
    div = results[0];
  } else {
    div = html.DivElement();
    div.id = 'testdocument';
    body.append(div);
  }
  div.setInnerHtml(bodyHtml, validator: NoOpNodeValidator());
  return div;
}

HtmlPageLoaderElement getRoot() =>
    HtmlPageLoaderElement.createFromElement(setUp(),
        externalSyncFn: (Future Function() action) async {
      await action();
      // Ensure that page has chance to execute before HTML test continues.
      await Future.value();
    });

class NoOpNodeValidator implements html.NodeValidator {
  @override
  bool allowsAttribute(
          html.Element element, String attributeName, String value) =>
      true;
  @override
  bool allowsElement(html.Element element) => true;
}
