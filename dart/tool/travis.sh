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
  lib/clock.dart \
  lib/html.dart \
  lib/objects.dart \
  lib/webdriver.dart \
  test/html_no_shadow_dom_test.dart \
  test/html_test.dart \
  test/webdriver_no_shadow_dom_test.dart \
  test/webdriver_test.dart


if [ "$TRAVIS" ]; then
  # Start chromedriver.
  chromedriver --port=4444 --url-base=wd/hub &

  # Run test/webdriver_no_shadow_dom_test.dart.
  dart test/webdriver_no_shadow_dom_test.dart
fi
