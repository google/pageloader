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

import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:webdriver/sync_core.dart' show Capabilities, WebDriver;
import 'package:webdriver/sync_io.dart' show createDriver;

WebDriver createTestDriver({Map<String, dynamic>? additionalCapabilities}) {
  final capabilities = Capabilities.chrome;
  final env = Platform.environment;

  final Map<String, dynamic> chromeOptions = {
    "args": [
      "--headless",
      "--disable-gpu",
    ]
  };
  // final Map<String, dynamic> chromeOptions = {};

  if (env['CHROMEDRIVER_BINARY'] != null) {
    chromeOptions['binary'] = env['CHROMEDRIVER_BINARY'];
  }

  if (env['CHROMEDRIVER_ARGS'] != null) {
    chromeOptions['args'] = env['CHROMEDRIVER_ARGS']!.split(' ');
  }

  if (chromeOptions.isNotEmpty) {
    capabilities[Capabilities.chromeOptions] = chromeOptions;
  }

  if (additionalCapabilities != null) {
    capabilities.addAll(additionalCapabilities);
  }

  return createDriver(desired: capabilities);
}

String testPagePath({bool useLong = false}) {
  final testPagePath = path.absolute('test', 'data',
      useLong ? 'long_webdriver_test_page.html' : 'webdriver_test_page.html');
  if (!FileSystemEntity.isFileSync(testPagePath)) {
    throw Exception('Could not find the test file at "$testPagePath".'
        ' Make sure you are running tests from the root of the project.');
  }
  return path.toUri(testPagePath).toString();
}
