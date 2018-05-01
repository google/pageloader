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

part 'multiple_in_file.g.dart';

@PageObject()
abstract class A {
  A();
  factory A.create(PageLoaderElement context) = $A.create;

  @ByCss('b-in-a-class')
  B get b;
}

@PageObject()
abstract class B {
  B();
  factory B.create(PageLoaderElement context) = $B.create;

  @ByCss('base-class')
  PageLoaderElement get base;
}

@PageObject()
abstract class C {
  C();
  factory C.create(PageLoaderElement context) = $C.create;

  @ByCss('b-in-c-class')
  B get b;
}
