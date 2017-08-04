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

library pageloader.test;

import 'package:test/test.dart';

import 'annotations.dart' as annotations;
import 'attributes.dart' as attributes;
import 'basic.dart' as basic;
import 'display_filtering.dart' as display_filtering;
import 'errors.dart' as errors;
import 'mouse.dart' as mouse;
import 'properties.dart' as properties;
import 'selenium_attributes.dart' as selenium_attributes;
import 'shadow_dom.dart' as shadow_dom;
import 'typing.dart' as typing;

void runTests() {
  group('core PageLoader', () {
    //annotations.runTests();
    //attributes.runTests();
    basic.runTests();
    /*display_filtering.runTests();
    errors.runTests();
    mouse.runTests();
    properties.runTests();
    selenium_attributes.runTests();
    shadow_dom.runTests();
    typing.runTests();*/
  });
}
