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
import 'dart:core';

import 'package:pageloader/pageloader.dart';
import 'package:webdriver/sync_core.dart' as wd;

import 'webdriver_page_loader_element.dart';

// TODO: mouse isn't supported for non-WebDriver elements, so these
// casts are fine. Still, this could be made more obvious via implements.

/// Support for mouse in WebDriver context.
class WebDriverMouse implements PageLoaderMouse {
  final wd.WebDriver _driver;

  WebDriverMouse(this._driver);

  @override
  Future down(MouseButton button, {PageLoaderElement eventTarget}) async {
    if (eventTarget is WebDriverPageLoaderElement) {
      return _fireEvent(eventTarget, 'mousedown', button);
    } else {
      return _driver.mouse.down(button);
    }
  }

  @override
  Future moveTo(PageLoaderElement element, int xOffset, int yOffset,
          {List<PageLoaderElement> dispatchTo,
          int stepPixels,
          Duration duration}) async =>
      _driver.mouse.moveTo(
          element: (element as WebDriverPageLoaderElement).contextSync,
          xOffset: xOffset,
          yOffset: yOffset);

  @override
  Future up(MouseButton button, {PageLoaderElement eventTarget}) async {
    if (eventTarget is WebDriverPageLoaderElement) {
      return _fireEvent(eventTarget, 'mouseup', button);
    } else {
      return _driver.mouse.up(button);
    }
  }

  Future _fireEvent(WebDriverPageLoaderElement eventTarget, String type,
          [MouseButton button]) async =>
      _driver.execute(
          "arguments[0].dispatchEvent(new MouseEvent(arguments[1], "
          "{'button' : arguments[2]}));",
          [eventTarget.contextSync, type, button?.value]);
}
