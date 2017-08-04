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

@TestOn('vm')
library pageloader.test.webdriver_no_shadow_dom;

import 'dart:async';

import 'package:pageloader/webdriver.dart';
import 'package:test/test.dart';
import 'package:webdriver/sync_io.dart' show WebDriver;

import 'setup/webdriver_sync_test_setup.dart' show runTests;
import 'src/shared.dart' as shared;

void main() {
  runTests(pageLoaderFactory, 'webdriver_test_page.html');
}

class SyncLoader extends shared.Loader {
  final WebDriverPageLoader loader;
  SyncLoader(WebDriver driver) : loader = new WebDriverPageLoader.sync(driver);

  Future<T> getInstance<T>(Type type, [dynamic context]) async =>
      loader.getInstanceSync(type);
}

SyncLoader pageLoaderFactory(WebDriver driver) => new SyncLoader(driver);
