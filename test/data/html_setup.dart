// Copyright 2017 Google Inc. All rights reserved.
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS'  BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:html' as html;
import 'dart:svg' show SvgElement;

import 'package:pageloader/html.dart';

/// Returns the root level element of the document.
///
/// This document is to be synced with Webdriver_test_page.html.
html.Element setUp() {
  final body = html.document.getElementsByTagName('body').first;
  const bodyHtml = '''
      <style>
        .class1 { background-color: #00FF00; }
        #scroll-box {
          border: 1px solid black;
          width: 200px;
          height: 100px;
          overflow: scroll;
          font: 24px/36px sans-serif;
        }
      </style>
      <div id="invisible-div"  class="invisible">invisible section</div>
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
      <svg id='svg-element' width='400' height='100'>
        <rect width='400' height='100' style='fill:rgb(0,0,255);stroke-width:10;stroke:rgb(0,0,0)' />
      </svg>
      <div id='svg-output'>area for svg element</div>
      <div id='pointer'>area for pointer events</div>
      <input type='text' id='text' />
      <div>
        <input type='text' id="text-with-focus-and-blur"/>
        <div id='text-with-focus-and-blur-focus-count'>0</div>
        <div id='text-with-focus-and-blur-blur-count'>0</div>
      </div>
      <input type='text' readonly id='readonly' disabled />
      <input type='checkbox' class='with-class-test class1 class2' />
      <input type='radio' name='radio' value='radio1' debugid='debugId'/>
      <input type='radio' name='radio' value='radio2' />
      <a href="test.html"  id="anchor">test</a>
      <img src="test.png">
      <select id='select1'>
        <option id='option1' value='value 1' debugid="option1">option 1</option>
        <option id='option2' value='value 2' debug-id="option2">option 2</option>
        <option id='option3' value='value 3' debugId="option3">option 3</option>
      </select>
      <div data-test-id="one">data-test-id</div>
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
      <div id='mouse-bottom'>bottom area for mouse events</div>
      <div id='pointer-top'>top area for pointer events</div>
      <div id='pointer-center'>center area for pointer events</div>
      <div id='pointer-bottom'>bottom area for pointer events</div>
      <div id='scroll-box'>
        loremipsumloremipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum
        lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum
        <br><br>
        loremipsumloremipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum
        lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum
        <p id="scroll-bottom">bottom text</p>
      </div>
      <p>Scroll box scrollLeft: <span id="scroll-left">0</span></p>
      <p>Scroll box scrollTop: <span id="scroll-top">0</span></p>
      <div id="mixin-div">mixin div</div>
      <custom-events-element></custom-event-element>''';

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

  // TODO: Investigate what the root cause of this issue.
  // html.document.getElementsByTagName('a-custom-tag').forEach((element) {
  //   if (element is html.Element) {
  //     final shadow = element.createShadowRoot();
  //     shadow.setInnerHtml(templateHtml, validator: NoOpNodeValidator());
  //   }
  // });

  // Get all mouseevent driven div elements and bind them
  final displayedMouseDiv = html.document.getElementById('mouse');
  final centerMouseDiv = html.document.getElementById('mouse-center');
  final svgElement = html.document.getElementById('svg-element');
  final svgOutputDiv = html.document.getElementById('svg-output');
  bindMouseEvents(displayedMouseDiv!);
  bindMouseEvents(centerMouseDiv!);
  bindMouseEventsWithSvg(svgElement as SvgElement, svgOutputDiv!);

  // Get all pointerevent driven div elements and bind them
  final displayedPointerDiv = html.document.getElementById('pointer');
  final centerPointerDiv = html.document.getElementById('pointer-center');
  bindPointerEvents(displayedPointerDiv!);
  bindPointerEvents(centerPointerDiv!);

  // Bind KeyboardEvent driven div element.
  final keyboardListenerDiv = html.document.getElementById('keyboard-listener');
  bindKeyboardListener(keyboardListenerDiv!);

  // Bind typing tests driven by focus/blur events.
  final typingFocusBlurElement =
      html.document.getElementById('text-with-focus-and-blur');
  bindTextFocus(typingFocusBlurElement!);
  bindTextBlur(typingFocusBlurElement);

  // Bind scroll element and counter.
  final scrollBox = html.document.getElementById('scroll-box');
  final scrollLeft = html.document.getElementById('scroll-left');
  final scrollTop = html.document.getElementById('scroll-top');
  bindScrollEvents(scrollBox!, scrollLeft!, scrollTop!);

  // Bind custom event.
  final customEventsElement = html.document
      .getElementsByTagName('custom-events-element')
      .cast<html.Element>()
      .first;
  bindCustomEvents(customEventsElement);

  return div;
}

void bindKeyboardListener(html.Element element) {
  // 13 == keyCode for enter
  element.onKeyDown.listen((evt) {
    if (evt.keyCode == 13) {
      element.text = element.text! + ' enter keydown;';
    }
    if (evt.key != null && evt.key == 'Enter') {
      element.text = element.text! + ' (Enter key value);';
    }
  });
  element.onKeyPress.listen((evt) {
    if (evt.keyCode == 13) {
      element.text = element.text! + ' enter keypress;';
    }
    if (evt.key != null && evt.key == 'Enter') {
      element.text = element.text! + ' (Enter key value);';
    }
  });
  element.onKeyUp.listen((evt) {
    if (evt.keyCode == 13) {
      element.text = element.text! + ' enter keyup;';
    }
    if (evt.key != null && evt.key == 'Enter') {
      element.text = element.text! + ' (Enter key value);';
    }
  });
}

void bindTextFocus(html.Element element) {
  element.onFocus.listen((evt) {
    final countDiv =
        html.document.getElementById('text-with-focus-and-blur-focus-count');
    final count = int.parse(countDiv!.innerText) + 1;
    countDiv.innerText = count.toString();
  });
}

void bindTextBlur(html.Element element) {
  element.onBlur.listen((evt) {
    final countDiv =
        html.document.getElementById('text-with-focus-and-blur-blur-count');
    final count = int.parse(countDiv!.innerText) + 1;
    countDiv.innerText = count.toString();
  });
}

void bindMouseEvents(html.Element element) {
  element.onMouseDown.listen((evt) {
    element.text = element.text! +
        '  MouseDown: ${evt.client.x}, ${evt.client.y}; '
            '${evt.screen.x}, ${evt.screen.y}';
  });
  element.onMouseUp.listen((evt) {
    element.text = element.text! +
        '  MouseUp: ${evt.client.x}, ${evt.client.y}; '
            '${evt.screen.x}, ${evt.screen.y}';
  });
  element.onMouseMove.listen((evt) {
    element.text = element.text! +
        '  MouseMove: ${evt.client.x}, ${evt.client.y}; '
            '${evt.screen.x}, ${evt.screen.y}';
  });
  element.onMouseLeave.listen((evt) {
    element.text = element.text! +
        '  MouseLeave: ${evt.client.x}, ${evt.client.y}; '
            '${evt.screen.x}, ${evt.screen.y}';
  });
  element.onMouseOut.listen((evt) {
    element.text = element.text! +
        '  MouseOut: ${evt.client.x}, ${evt.client.y}; '
            '${evt.screen.x}, ${evt.screen.y}';
  });
  element.onMouseEnter.listen((evt) {
    element.text = element.text! +
        '  MouseEnter: ${evt.client.x}, ${evt.client.y}; '
            '${evt.screen.x}, ${evt.screen.y}';
  });
  element.onMouseOver.listen((evt) {
    element.text = element.text! +
        '  MouseOver: ${evt.client.x}, ${evt.client.y}; '
            '${evt.screen.x}, ${evt.screen.y}';
  });
}

void bindMouseEventsWithSvg(SvgElement element, html.Element outputElement) {
  element.onClick.listen((evt) {
    outputElement.text = outputElement.text! +
        '  Click: ${evt.client.x}, ${evt.client.y}; '
            '${evt.screen.x}, ${evt.screen.y}';
  });
}

void bindPointerEvents(html.Element element) {
  element.on['pointerdown'].listen((evt) {
    if (evt is html.PointerEvent) {
      element.text = element.text! +
          '  PointerDown: ${evt.client.x}, ${evt.client.y}; '
              '${evt.screen.x}, ${evt.screen.y}';
    }
  });
  element.on['pointerup'].listen((evt) {
    if (evt is html.PointerEvent) {
      element.text = element.text! +
          '  PointerUp: ${evt.client.x}, ${evt.client.y}; '
              '${evt.screen.x}, ${evt.screen.y}';
    }
  });
  element.on['pointermove'].listen((evt) {
    if (evt is html.PointerEvent) {
      element.text = element.text! +
          '  PointerMove: ${evt.client.x}, ${evt.client.y}; '
              '${evt.screen.x}, ${evt.screen.y}';
    }
  });
  element.on['pointerleave'].listen((evt) {
    if (evt is html.PointerEvent) {
      element.text = element.text! +
          ' PointerLeave: ${evt.client.x}, ${evt.client.y}; '
              '${evt.screen.x}, ${evt.screen.y}';
    }
  });
  element.on['pointerout'].listen((evt) {
    if (evt is html.PointerEvent) {
      element.text = element.text! +
          '  PointerOut: ${evt.client.x}, ${evt.client.y}; '
              '${evt.screen.x}, ${evt.screen.y}';
    }
  });
  element.on['pointerenter'].listen((evt) {
    if (evt is html.PointerEvent) {
      element.text = element.text! +
          '  PointerEnter: ${evt.client.x}, ${evt.client.y}; '
              '${evt.screen.x}, ${evt.screen.y}';
    }
  });
  element.on['pointerover'].listen((evt) {
    if (evt is html.PointerEvent) {
      element.text = element.text! +
          '  PointerOver: ${evt.client.x}, ${evt.client.y}; '
              '${evt.screen.x}, ${evt.screen.y}';
    }
  });
}

void bindScrollEvents(
    html.Element scrollBox, html.Element scrollLeft, html.Element scrollTop) {
  scrollBox.onScroll.listen((evt) {
    scrollLeft.innerHtml = scrollBox.scrollLeft.toString();
    scrollTop.innerHtml = scrollBox.scrollTop.toString();
  });
}

void bindCustomEvents(html.Element customEventsElement) {
  customEventsElement.on['customizedevent'].listen((evt) {
    customEventsElement.text = customEventsElement.text! + ' CustomizedEvent';
  });
}

HtmlPageLoaderElement getRoot() =>
    HtmlPageLoaderElement.createFromElement(setUp(),
        externalSyncFn: (Future Function() action) async {
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
