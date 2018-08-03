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

import 'dart:html';

import 'package:pageloader/pageloader.dart';

import 'html_mouse.dart';
import 'html_page_loader_element.dart';

/// Support for [PageUtils] in HTML context.
class HtmlPageUtils extends PageUtils {
  final SyncFn syncFn;
  HtmlPageLoaderElement _cachedRoot;

  HtmlPageUtils({SyncFn externalSyncFn: noOpExecuteSyncedFn})
      : syncFn = externalSyncFn;

  /// Gets the body for the current page.
  ///
  /// Caches the [HtmlPageLoaderElement] used between calls to allow listeners
  /// to persist.
  @override
  HtmlPageLoaderElement get root {
    _cachedRoot ??= HtmlPageLoaderElement.createFromElement(document.body,
        externalSyncFn: this.syncFn);
    return _cachedRoot;
  }

  /// Gets the current root element for the DOM.
  ///
  /// This is element you should pass in your tests to create new page objects.
  @override
  PageLoaderElement byTag(String tag) =>
      HtmlPageLoaderElement.createFromElement(document.body,
              externalSyncFn: this.syncFn)
          .getElementsByCss(tag)
          .single;

  /// Gets the mouse.
  @override
  PageLoaderMouse get mouse => globalMouse(this.syncFn);
}
