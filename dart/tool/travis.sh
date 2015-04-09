#!/bin/bash

# Copyright 2013 Google Inc. All Rights Reserved.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Fast fail the script on failures.
set -e

cd dart

# Verify that the libraries are error free.
dartanalyzer --fatal-warnings \
  lib/sync/clock.dart \
  lib/sync/html.dart \
  lib/sync/objects.dart \
  lib/sync/webdriver.dart \
  test/sync/html_no_shadow_dom_test.dart \
  test/sync/html_test.dart \
  test/sync/webdriver_no_shadow_dom_test.dart \
  test/sync/webdriver_test.dart \
  lib/async/html.dart \
  lib/async/objects.dart \
  lib/async/webdriver.dart \
  test/async/html_no_shadow_dom_test.dart \
  test/async/html_test.dart \
  test/async/webdriver_no_shadow_dom_test.dart \
  test/async/webdriver_test.dart


if [ "$TRAVIS" ]; then
  # Start chromedriver.
  chromedriver --port=4444 --url-base=wd/hub &

  dart test/sync/webdriver_no_shadow_dom_test.dart

  dart test/async/webdriver_no_shadow_dom_test.dart
fi
