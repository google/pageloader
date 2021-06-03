// @dart = 2.9

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

import 'finders.dart';

part 'nested.g.dart';

@PageObject()
abstract class Nested {
  Nested();
  factory Nested.create(PageLoaderElement context) = $Nested.create;

  @ByCss('some-nested-class')
  Finders get findersElement;
}

// Mixin implementation
@PageObject()
abstract class NestedUsingMixin extends Object with NestedMixin {
  NestedUsingMixin();
  factory NestedUsingMixin.create(PageLoaderElement context) =
      $NestedUsingMixin.create;
}

@PageObject()
abstract class NestedMixin {
  @ByCss('some-nested-class')
  FindersUsingMixin get findersElement;
}
