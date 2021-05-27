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

import 'dart:core';

import 'package:pageloader/pageloader.dart';
import 'package:webdriver/sync_core.dart' as wd;

// TODO: WebDriver doesn't support pointer at the moment

/// Support for pointer in WebDriver context.
class WebDriverPointer implements PageLoaderPointer {
  final wd.WebDriver _driver; // ignore: unused_field

  WebDriverPointer(this._driver);

  @override
  Future<void> down(MouseButton button, {PageLoaderElement eventTarget}) async {
    throw 'Not yet implemented';
  }

  @override
  Future<void> moveTo(PageLoaderElement element, int xOffset, int yOffset,
      {List<PageLoaderElement> dispatchTo,
      int stepPixels,
      Duration duration}) async {
    throw 'Not yet implemented';
  }

  @override
  Future<void> up(MouseButton button, {PageLoaderElement eventTarget}) async {
    throw 'Not yet implemented';
  }
}
