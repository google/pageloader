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

/// Interfaces for annotations.
library pageloader.api.annotation_interfaces;

import 'page_loader_element_interface.dart';

/// Finds all matching elements STRICTLY underneath the parent context.
///
/// Can only be used on an abstract getter method.
abstract class Finder {}

/// Finder based on cssSelector.
abstract class CssFinder extends Finder {
  String get cssSelector;
}

/// Finder based on page loader context.
abstract class ContextFinder extends Finder {
  List<PageLoaderElement> findElements(PageLoaderElement context);
}

/// Checks some property of annotated element. Fails if this property does not
/// hold at runtime.
///
/// Can be applied to classes, to check every instance of a page object, or in
/// conjunction with a [CssFinder].
///
/// Note these are only applied when resolving an element, which only occurs if
/// the element is interacted with.
abstract class Checker {
  const Checker();

  bool check(PageLoaderElement element);
}

/// Filters all elements found by a [CssFinder].
abstract class Filter {
  const Filter();

  bool keep(PageLoaderElement element);
}
