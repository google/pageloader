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

import 'package:pageloader/pageloader.dart';
import 'package:webdriver/sync_core.dart' as wd;

import 'webdriver_mouse.dart';
import 'webdriver_page_loader_element.dart';

/// Support for [PageUtils] in WebDriver context.
class WebDriverPageUtils extends PageUtils {
  /// The underlying instance of [WebDriver].
  final wd.WebDriver driver;

  final WebDriverMouse _mouse;

  WebDriverPageLoaderElement _cachedRoot;

  WebDriverPageUtils(this.driver) : _mouse = WebDriverMouse(driver);

  /// Gets the root element for the given page.
  ///
  /// Caches the [WebDriverPageLoaderElement] used between calls to allow
  /// listeners to persist.
  @override
  WebDriverPageLoaderElement get root {
    _cachedRoot ??= WebDriverPageLoaderElement(driver);
    return _cachedRoot;
  }

  @override
  WebDriverPageLoaderElement byTag(String tag) =>
      root.getElementsByCss(tag).single;

  /// Gets the mouse.
  @override
  WebDriverMouse get mouse => _mouse;
}
