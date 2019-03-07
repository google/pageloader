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

import 'dart:async';
import 'dart:html' as html;

import 'package:pageloader/html.dart';

/// Returns the root level element of the document.
///
/// This document is to be synced with Webdriver_test_page.html.
html.Element setUp() {
  final body = html.document.getElementsByTagName('body').first;
  const bodyHtml = '''
      <style>
        .class1 { background-color: #00FF00; }
      </style>
      <div id="invisible-div" class="invisible">invisible section</div>
      <table id='table1' non-standard='a non standard attr'
          class='class1 class2 class3' style='color: #800080;'>
        <tr>
          <td>r1c1</td>
          <td>r1c2</td>
        </tr>
        <tr>
          <td>r2c1</td>
          <td>r2c2</td>
        </tr>
      </table>
      <div id='div' style='display: none; background-color: red;'>
        some not displayed text</div>
      <div id='mouse'>area for mouse events</div>
      <input type='text' id='text' />
      <input type='text' readonly id='readonly' disabled />
      <input type='checkbox' class='with-class-test class1 class2' />
      <input type='radio' name='radio' value='radio1' debugid='debugId'/>
      <input type='radio' name='radio' value='radio2' />
      <a href="test.html" id="anchor">test</a>
      <img src="test.png">
      <select id='select1'>
        <option id='option1' value='value 1' debugid="option1">option 1</option>
        <option id='option2' value='value 2' debug-id="option2">option 2</option>
        <option id='option3' value='value 3' debugId="option3">option 3</option>
      </select>
      <textarea id='textarea'></textarea>
      <div id='keyboard-listener'>Listening:</div>
      <div class="outer-div">
        outer div 1
        <a-custom-tag></a-custom-tag>
      </div>
      <div class="outer-div">
        outer div 2
        <div class="inner-div">
          inner div 1
        </div>
        <div class="inner-div special">
          inner div 2
        </div>
      </div>
      <div class="outer-nested">
        outer nested
        <div class="inner-nested">
          inner nested
        </div>
      </div>
      <a-custom-tag id="button-1">
        button 1
      </a-custom-tag>
      <a-custom-tag id="button-2">
        button 2
      </a-custom-tag>
      <b-custom-tag>
        <c-custom-tag>C tag inner text</c-custom-tag>
      </b-custom-tag>
      <p id="nbsp"> &nbsp; &nbsp; </p>
      <div id='mouse-top'>top area for mouse events</div>
      <div id='mouse-center'>center area for mouse events</div>
      <div id='mouse-bottom'>bottom area for mouse events</div>''';

  final templateHtml = '<button id="inner">some <content></content></button>';

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

  html.document.getElementsByTagName('a-custom-tag').forEach((element) {
    if (element is html.Element) {
      final shadow = element.createShadowRoot();
      shadow.setInnerHtml(templateHtml, validator: NoOpNodeValidator());
    }
  });

  // Get all mouseevent driven div elements and bind them
  final displayedDiv = html.document.getElementById('mouse');
  final centerDiv = html.document.getElementById('mouse-center');
  bindMouseEvents(displayedDiv);
  bindMouseEvents(centerDiv);

  // Bind KeyboardEvent driven div element.
  final keyboardListenerDiv = html.document.getElementById('keyboard-listener');
  bindKeyboardListener(keyboardListenerDiv);

  return div;
}

void bindKeyboardListener(html.Element element) {
  // 13 == keyCode for enter
  element.onKeyDown.listen((evt) {
    if (evt.keyCode == 13) {
      element.text += ' enter keydown;';
    }
  });
  element.onKeyPress.listen((evt) {
    if (evt.keyCode == 13) {
      element.text += ' enter keypress;';
    }
  });
  element.onKeyUp.listen((evt) {
    if (evt.keyCode == 13) {
      element.text += ' enter keyup;';
    }
  });
}

void bindMouseEvents(html.Element element) {
  element.onMouseDown.listen((evt) {
    element.text = element.text +
        " MouseDown: ${evt.client.x}, ${evt.client.y}; "
        "${evt.screen.x}, ${evt.screen.y}";
  });
  element.onMouseUp.listen((evt) {
    element.text = element.text +
        " MouseUp: ${evt.client.x}, ${evt.client.y}; "
        "${evt.screen.x}, ${evt.screen.y}";
  });
  element.onMouseMove.listen((evt) {
    element.text = element.text +
        " MouseMove: ${evt.client.x}, ${evt.client.y}; "
        "${evt.screen.x}, ${evt.screen.y}";
  });
  element.onMouseLeave.listen((evt) {
    element.text = element.text +
        " MouseLeave: ${evt.client.x}, ${evt.client.y}; "
        "${evt.screen.x}, ${evt.screen.y}";
  });
  element.onMouseOut.listen((evt) {
    element.text = element.text +
        " MouseOut: ${evt.client.x}, ${evt.client.y}; "
        "${evt.screen.x}, ${evt.screen.y}";
  });
  element.onMouseEnter.listen((evt) {
    element.text = element.text +
        " MouseEnter: ${evt.client.x}, ${evt.client.y}; "
        "${evt.screen.x}, ${evt.screen.y}";
  });
  element.onMouseOver.listen((evt) {
    element.text = element.text +
        " MouseOver: ${evt.client.x}, ${evt.client.y}; "
        "${evt.screen.x}, ${evt.screen.y}";
  });
}

HtmlPageLoaderElement getRoot() =>
    HtmlPageLoaderElement.createFromElement(setUp(),
        externalSyncFn: (Future action()) async {
      await action();
      // Ensure that page has chance to execute before HTML test continues.
      await Future.value();
    });

void reset() {
  final body = html.document.getElementsByTagName('body').first;
  (body as html.Element).setInnerHtml('');
  setUp();
}

class NoOpNodeValidator implements html.NodeValidator {
  @override
  bool allowsAttribute(
          html.Element element, String attributeName, String value) =>
      true;
  @override
  bool allowsElement(html.Element element) => true;
}
