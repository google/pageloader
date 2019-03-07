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

import 'package:pageloader/pageloader.dart';

part 'parameters.g.dart';

@PageObject()
abstract class Parameters {
  Parameters();
  factory Parameters.create(PageLoaderElement context) = $Parameters.create;

  String testOptionalPositionalParam(
      [String first = 'a', String second = 'b']) {
    return first + second;
  }

  String testMixedOptionalPositionalParam(String x,
      [String first = 'a', String second = 'b']) {
    return x + first + second;
  }

  String testOptionalNamedParam({String first = 'a', String second = 'b'}) {
    return first + second;
  }

  String testMixedOptionalNamedParam(String x,
      {String first = 'a', String second = 'b'}) {
    return x + first + second;
  }
}

// Mixin implementation
@PageObject()
abstract class ParametersUsingMixin extends Object with ParametersMixin {
  ParametersUsingMixin();
  factory ParametersUsingMixin.create(PageLoaderElement context) =
      $ParametersUsingMixin.create;
}

@PageObject()
abstract class ParametersMixin {
  String testOptionalPositionalParam(
      [String first = 'a', String second = 'b']) {
    return first + second;
  }

  String testMixedOptionalPositionalParam(String x,
      [String first = 'a', String second = 'b']) {
    return x + first + second;
  }

  String testOptionalNamedParam({String first = 'a', String second = 'b'}) {
    return first + second;
  }

  String testMixedOptionalNamedParam(String x,
      {String first = 'a', String second = 'b'}) {
    return x + first + second;
  }
}
