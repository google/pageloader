// Copyright 2014 Google Inc. All rights reserved.
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
library pageloader.test.webdriver_test_setup;

import 'dart:async';
import 'dart:io';
import 'dart:mirrors' show currentMirrorSystem;

import 'package:path/path.dart' as path;
import 'package:test/test.dart';
import 'package:webdriver/io.dart' show WebDriver;
import "package:webtest/webtest.dart" as webtest;

import '../src/common.dart' as plt;
import '../src/shared.dart' as shared;

void runTests(pageLoaderFactory, String testPage) {
  WebDriver driver;

  setUp(() async {
    driver = await _createTestDriver();
    await driver.get(_testPagePath(testPage));
    shared.loader = pageLoaderFactory(driver);
  });

  tearDown(() async {
    await driver.quit();
    shared.loader = null;
  });

  plt.runTests();
}

String _testPagePath(String testPage) {
  var pathToTest = path.split(currentMirrorSystem()
      .findLibrary(#pageloader.test.webdriver_test_setup)
      .uri
      .path);
  pathToTest = pathToTest.sublist(0, pathToTest.length - 2)
    ..add('data')
    ..add(testPage);
  var testPagePath = path.joinAll(pathToTest);
  if (!FileSystemEntity.isFileSync(testPagePath)) {
    throw new Exception('Could not find the test file at "$testPagePath".'
        ' Make sure you are running tests from the root of the project.');
  }
  return path.toUri(testPagePath).toString();
}

Future<WebDriver> _createTestDriver() => webtest.newWebDriverSession();
