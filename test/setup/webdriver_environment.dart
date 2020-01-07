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

import 'dart:async';

import 'package:pageloader/webdriver.dart';
import 'package:webdriver/sync_io.dart';

import 'io_config.dart' as webtest;

/// Simple environment management for WebDriver tests.
class WebDriverEnvironment {
  WebDriver driver;
  WebDriverPageUtils _loader;
  bool useLong;

  WebDriverEnvironment({this.useLong = false});

  Future setUp() async {
    driver = webtest.createTestDriver();
    _loader = WebDriverPageUtils(driver);
    driver.get(webtest.testPagePath(useLong: useLong));
  }

  Future tearDown() async {
    _loader = null;
    driver.quit();
  }

  WebDriverPageLoaderElement getBaseElement() => _loader.root;
  WebDriverMouse get mouse => _loader.mouse;

  void doRefresh() => driver.get(webtest.testPagePath(useLong: useLong));
}
