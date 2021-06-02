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

part 'finders.g.dart';

@PageObject()
abstract class Finders {
  Finders();
  factory Finders.create(PageLoaderElement context) = $Finders.create;

  @ByCss('secret')
  PageLoaderElement get _secret;

  PageLoaderElement get secret => _secret;

  @ByCss('some-class')
  PageLoaderElement get element;

  @ByCss('some-other-class')
  @WithAttribute('also-with', 'this-attribute')
  PageLoaderElement get filtered;

  @ByCheckTag()
  CheckTagPO get checkTagPO;
}

@CheckTag('check-tag-po')
@PageObject()
abstract class CheckTagPO {
  CheckTagPO();
  factory CheckTagPO.create(PageLoaderElement context) = $CheckTagPO.create;

  @root
  PageLoaderElement get _root;

  @override
  String toString() => _root.toString();
}

// Mixin implementation

@PageObject()
abstract class FindersUsingMixin extends Object with FindersMixin {
  FindersUsingMixin();
  factory FindersUsingMixin.create(PageLoaderElement context) =
      $FindersUsingMixin.create;
}

@PageObject()
abstract class FindersMixin {
  @ByCss('secret')
  PageLoaderElement get _secret;

  PageLoaderElement get secret => _secret;

  @ByCss('some-class')
  PageLoaderElement get element;

  @ByCss('some-other-class')
  @WithAttribute('also-with', 'this-attribute')
  PageLoaderElement get filtered;

  @ByCheckTag()
  CheckTagPO get checkTagPO;
}
