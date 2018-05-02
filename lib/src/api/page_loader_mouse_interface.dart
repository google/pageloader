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

library pageloader3.api.page_loader_mouse_interface;

import 'dart:async';

import 'package:webdriver/sync_core.dart' show MouseButton;

import 'page_loader_element_interface.dart';

export 'package:webdriver/sync_core.dart' show MouseButton;

/// Interface for the mouse.
abstract class PageLoaderMouse {
  /// Press [button] on the mouse at its current location. If [eventTarget] is
  /// specified, PageLoader will attempt to fire the corresponding mouse events
  /// on that target, otherwise it will fire the events on the target that is
  /// under the current mouse location.
  Future down(MouseButton button, {PageLoaderElement eventTarget});

  /// Release [button] on the mouse at its current location. If [eventTarget] is
  /// specified, PageLoader will attempt to fire the corresponding mouse events
  /// on that target, otherwise it will fire the events on the target that is
  /// under the current mouse location.
  Future up(MouseButton button, {PageLoaderElement eventTarget});

  /// Move the mouse to a location relative to [element]. If [eventTarget] is
  /// specified, PageLoader will attempt to fire the corresponding mouse events
  /// on that target, otherwise it will fire the events on the target that is
  /// under the current mouse location.
  Future moveTo(PageLoaderElement element, int xOffset, int yOffset,
      {PageLoaderElement eventTarget});
}