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

import 'package:pageloader/utils.dart';
import 'package:test/test.dart';

// Test failures only; successes are tested in matchers_test.dart
void main() {
  final foo = DefinitelyNotAPO();

  // Utility methods that will be tested. Does not include 'hasClass'
  final utilMethodsMap = {
    'exists/notExists': [exists, notExists],
    'getInnerText': [getInnerText],
    'isDisplayed/isNotDisplayed': [isDisplayed, isNotDisplayed],
    'isHidden/isNotHidden': [isHidden, isNotHidden],
    'isVisible/isNotVisible': [isVisible, isNotVisible],
    'isFocused/isNotFocused': [isFocused, isNotFocused],
    'rootElementOf': [rootElementOf],
  };

  // Test everything in `utilMethodsMap`
  utilMethodsMap.forEach((functionName, methods) {
    methods.forEach((method) {
      test('$method fails', () {
        try {
          method(foo);
          fail("Expected to throw on '$method'");
        } catch (e) {
          checkError(e, functionName, foo.runtimeType);
        }
      });
    });
  });

  // `hasClass` has to be done separately since it's not a unary func
  test("'hasClass' fails", () {
    try {
      hasClass(foo, 'bar');
      fail("Expected to throw on 'hasClass'");
    } catch (e) {
      checkError(e, 'hasClass', foo.runtimeType);
    }
  });
}

void checkError(dynamic error, String functionName, Type type) {
  final errorMessage = error.toString();
  expect(error, TypeMatcher<PageLoaderArgumentError>());
  expect(errorMessage, contains("'$functionName'"));
  expect(errorMessage, contains("'$type'"));
}

class DefinitelyNotAPO {}
