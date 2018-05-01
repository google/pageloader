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

import 'package:pageloader3/pageloader.dart';

part 'mouse.g.dart';

@PageObject()
abstract class MouseObject {
  MouseObject();
  factory MouseObject.create(PageLoaderElement context) = $MouseObject.create;

  @Mouse
  PageLoaderMouse get mouse;
}

// Mixin implementation
@PageObject()
abstract class MouseObjectUsingMixin extends Object with MouseObjectMixin {
  MouseObjectUsingMixin();
  factory MouseObjectUsingMixin.create(PageLoaderElement context) =
      $MouseObjectUsingMixin.create;
}

@PageObject()
abstract class MouseObjectMixin {
  @Mouse
  PageLoaderMouse get mouse;
}
