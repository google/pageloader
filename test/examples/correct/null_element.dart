// Copyright 2018 Google Inc. All rights reserved.
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

part 'null_element.g.dart';

// ignore_for_file: unused_element
@PageObject()
abstract class ParentRoot {
  ParentRoot();
  factory ParentRoot.create(PageLoaderElement context) = $ParentRoot.create;

  @nullElement
  PageLoaderElement get _nullElement;

  @nullElement
  NullPO get _nullPO;

  @nullElement
  Generics<String> get gens;
}

@PageObject()
abstract class NullPO {
  NullPO();
  factory NullPO.create(PageLoaderElement context) = $NullPO.create;
}

@PageObject()
abstract class Generics<T> {
  Generics();
  factory Generics.create(PageLoaderElement context) = $Generics<T>.create;
}
