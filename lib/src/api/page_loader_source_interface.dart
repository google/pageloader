// Copyright 2018 Google Inc. All rights reserved.
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

library pageloader.api.page_loader_source_interface;

import 'page_loader_element_interface.dart';

/// Base class for Pageloader entities that behave as the source for other
/// [PageLoaderElement]s.
abstract class PageLoaderSource {
  /// Finds [PageLoaderElement] from this source by [tag].
  ///
  /// If used with [PageUtils], finds the element representing [tag]
  /// found from the document root.
  /// If used with [PageLoaderElement], finds the element representing [tag]
  /// found from the [PageLoaderElement] as root.
  PageLoaderElement byTag(String tag);
}
