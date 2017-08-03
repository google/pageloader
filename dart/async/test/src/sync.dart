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

library pageloader.test.basic;

import 'package:pageloader/objects.dart';
import 'package:test/test.dart';
import 'shared.dart';

void runTests() {
  group('sync smoke tests', () {
    test('globalContext sync functions work', () async {
      expect(loader.globalContext.nameSync, '__document__');
      expect(loader.globalContext.displayedSync, true);
      expect(loader.globalContext.innerTextSync, startsWith('test_page'));
      expect(loader.globalContext.visibleTextSync, startsWith('r1c1 r1c2'));
    });
  });
}
