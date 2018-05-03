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

library pageloader.api.page_loader_listener;

/// Listener for PageLoader events.
///
/// Users should extend the empty functionality below.
abstract class PageLoaderListener {
  /// Called at start of every page object method.
  void startPageObjectMethod(String pageObjectName, String methodName) {}

  /// Called at end of every page object method.
  void endPageObjectMethod(String pageObjectName, String methodName) {}
}
