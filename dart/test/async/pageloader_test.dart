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

library pageloader.async.test;

import 'package:unittest/unittest.dart';

import 'src/annotation_test.dart' as annotation;
import 'src/attribute_test.dart' as attribute;
import 'src/basic_test.dart' as basic;
import 'src/display_filtering_test.dart' as display_filtering;
import 'src/error_test.dart' as error;
import 'src/mouse_test.dart' as mouse;
import 'src/shadow_dom_test.dart' as shadow_dom;
import 'src/typing_test.dart' as typing;

void runTests() {
  group('core PageLoader', () {
    annotation.runTests();
    attribute.runTests();
    basic.runTests();
    display_filtering.runTests();
    error.runTests();
    mouse.runTests();
    shadow_dom.runTests();
    typing.runTests();
  });
}
