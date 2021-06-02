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

library pageloader.api.page_loader_interface;

import 'page_loader_element_interface.dart';
import 'page_loader_mouse_interface.dart';
import 'page_loader_pointer_interface.dart';
import 'page_loader_source_interface.dart';

/// Convenience methods that vary based on environment.
abstract class PageUtils extends PageLoaderSource {
  /// Gets the current root element for the DOM. Used to create page objects.
  PageLoaderElement? get root;

  /// Gets the element on the DOM that currently has focus.
  PageLoaderElement get focused;

  /// Gets the mouse.
  PageLoaderMouse? get mouse;

  /// Gets the pointer.
  PageLoaderPointer? get pointer;
}
