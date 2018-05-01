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
import 'dart:html';

import 'package:pageloader3/pageloader.dart';

import 'html_page_loader_element.dart';

/// Support for mouse in in-browser context by dispatching [MouseEvent] from
/// the current element or a given event target.
class HtmlMouse implements PageLoaderMouse {
  final SyncFn syncFn;

  int _clientX = 0;
  int _clientY = 0;

  HtmlMouse(this.syncFn);

  @override
  Future down(MouseButton button, {PageLoaderElement eventTarget}) =>
      syncFn(() => _dispatchEvent('mousedown', eventTarget, button));

  @override
  Future moveTo(PageLoaderElement element, int xOffset, int yOffset,
          {PageLoaderElement eventTarget}) =>
      syncFn(() async {
        if (element is HtmlPageLoaderElement) {
          _clientX = (element.getBoundingClientRect().left + xOffset).ceil();
          _clientY = (element.getBoundingClientRect().top + yOffset).ceil();
        }
        return _dispatchEvent('mousemove', eventTarget);
      });

  @override
  Future up(MouseButton button, {PageLoaderElement eventTarget}) =>
      syncFn(() => _dispatchEvent('mouseup', eventTarget, button));

  int get _pageX => window.pageXOffset + _clientX;
  int get _pageY => window.pageYOffset + _clientY;
  int get _borderWidth => (window.outerWidth - window.innerWidth) ~/ 2;
  int get _screenX => window.screenLeft + _borderWidth + _clientX;
  int get _screenY =>
      window.screenTop +
      window.outerHeight -
      window.innerHeight -
      _borderWidth +
      _clientY;
  Element get _currentElement =>
      document.elementFromPoint(_pageX, _pageY) ?? document.body;

  Future _dispatchEvent(String type, HtmlPageLoaderElement eventTarget,
      [MouseButton button = MouseButton.primary]) async {
    var event = new MouseEvent(type,
        button: button.value,
        clientX: _clientX,
        clientY: _clientY,
        screenX: _screenX,
        screenY: _screenY);

    if (eventTarget != null) {
      await _microtask(() => eventTarget.dispatchEvent(event));
    } else {
      await _microtask(() => _currentElement.dispatchEvent(event));
    }
  }
}

/// execute [fn] as a separate microtask and return a [Future] that completes
/// normally when that [Future] completes (normally or with an error).
Future _microtask(fn()) => new Future.microtask(fn).whenComplete(() {});
