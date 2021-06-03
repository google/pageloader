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

library pageloader.api.page_loader_pointer_interface;

import 'dart:core';

import 'package:webdriver/sync_core.dart' show MouseButton;

import 'page_loader_element_interface.dart';

export 'package:webdriver/sync_core.dart' show MouseButton;

/// Interface for the pointer events.
///
/// Refer to: https://www.w3.org/TR/pointerevents/
abstract class PageLoaderPointer {
  /// Press at current location. If [eventTarget] is specified,
  /// PageLoader will attempt to fire the corresponding pointer events
  /// on that target, otherwise it will fire the events on the target that is
  /// under the current location.
  Future<void> down(MouseButton button, {PageLoaderElement? eventTarget});

  /// Release at current location. If [eventTarget] is specified,
  /// PageLoader will attempt to fire the corresponding pointer events
  /// on that target, otherwise it will fire the events on the target that is
  /// under the current location.
  Future<void> up(MouseButton button, {PageLoaderElement? eventTarget});

  /// Move the pointer from previous location to a location relative
  /// to [element] offset by [xOffset] and [yOffset].
  ///
  /// If [xOffset] and [yOffset] are both null, automatically moves the pointer
  /// to the center of [element].
  ///
  /// The optional named parameters have no impact when used with Webdriver
  /// implementation.
  ///
  /// Otherwise, pointer events are sent along the pointer path
  /// every [stepPixels] over [duration] milliseconds. If any of the
  /// [dispatchTo] land on these intervals, pointer events are also sent
  /// to that element. If [stepPixels] is not provided, the pointer movement
  /// instantaneously moves from its current position to the final position
  /// with no intermediate steps. If provided, [stepPixels] must be a value
  /// greater than zero.
  Future<void> moveTo(
      covariant PageLoaderElement element, int? xOffset, int? yOffset,
      {List<PageLoaderElement>? dispatchTo,
      int? stepPixels,
      Duration? duration});
}
