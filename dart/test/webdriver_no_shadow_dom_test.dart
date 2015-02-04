/*
 * Copyright 2014 Google Inc. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
library pageloader.test.webdriver_no_shadow_dom;

import 'pageloader_test.dart' as plt;

import 'package:pageloader/webdriver.dart';
import 'package:path/path.dart' as path;
import 'package:unittest/unittest.dart';
import 'package:unittest/vm_config.dart';
import 'package:sync_webdriver/sync_webdriver.dart' hide Platform;

/// These tests are not expected to be run as part of normal automated testing,
/// as they are slow and they have external dependencies.
void main() {
  useVMConfiguration();

  WebDriver driver;

  setUp(() {
    driver = freshDriver;
    driver.url = testPagePath;
    plt.loader = new WebDriverPageLoader(driver, useShadowDom: false);
  });

  plt.runTests();

  // This test needs to be last to properly close the browser.
  test('one-time teardown', () {
    closeDriver();
  });
}

String get testPagePath => path
    .toUri(path.absolute('webdriver_no_shadow_dom_test_page.html'))
    .toString();

WebDriver _driver;

WebDriver get freshDriver {
  if (_driver != null) {
    try {
      Window firstWindow = null;

      for (Window window in _driver.windows) {
        if (firstWindow == null) {
          firstWindow = window;
        } else {
          _driver.switchTo.window(window);
          _driver.close();
        }
      }
      _driver.switchTo.window(firstWindow);
      _driver.url = 'about:';
    } catch (e) {
      closeDriver();
    }
  }
  if (_driver == null) {
    _driver = new WebDriver(desired: Capabilities.chrome);
  }
  return _driver;
}

void closeDriver() {
  try {
    _driver.quit();
  } catch (e) {}
  _driver = null;
}
