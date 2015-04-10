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
library pageloader.async.test.html_no_shadow_dom;

import 'dart:async';

import 'package:pageloader/async/html.dart';
import 'package:unittest/html_enhanced_config.dart'
    show useHtmlEnhancedConfiguration;
import 'package:unittest/unittest.dart';

import '../data/html_setup.dart' as html_setup;
import 'pageloader_test.dart' as plt;
import 'src/html_test.dart' as html_test;
import 'src/shared.dart' as shared;

void main() {
  useHtmlEnhancedConfiguration();

  setUp(() {
    var div = html_setup.setUp();
    shared.loader = new HtmlPageLoader(div, syncFn);
  });

  plt.runTests();
  html_test.runTests();
}

Future syncFn() async {
  await new Future.delayed(new Duration(milliseconds: 200));
}
