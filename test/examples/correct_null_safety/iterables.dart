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

import 'finders.dart' show CheckTagPO;

part 'iterables.g.dart';

@PageObject()
abstract class Iterables {
  Iterables();
  factory Iterables.create(PageLoaderElement context) = $Iterables.create;

  @ByCss('basic')
  PageObjectIterable<PageLoaderElement> get basics;

  @ByCss('nested')
  PageObjectIterable<InnerObject> get nested;

  @ByCheckTag()
  PageObjectIterable<CheckTagPO> get checkTagPO;
}

@PageObject()
abstract class InnerObject {
  InnerObject();
  factory InnerObject.create(PageLoaderElement context) = $InnerObject.create;

  @ByCss('single')
  PageLoaderElement get single;

  @ByCss('nested-iterable')
  PageObjectIterable<PageLoaderElement> get innerIterable;

  @ByCheckTag()
  PageObjectIterable<CheckTagPO> get innerCheckTagPO;
}

// Mixin implementation
@PageObject()
abstract class IterablesUsingMixin extends Object with IterablesMixin {
  IterablesUsingMixin();
  factory IterablesUsingMixin.create(PageLoaderElement context) =
      $IterablesUsingMixin.create;
}

@PageObject()
abstract class IterablesMixin {
  @ByCss('basic')
  PageObjectIterable<PageLoaderElement> get basics;

  @ByCss('nested')
  PageObjectIterable<InnerObjectUsingMixin> get nested;

  @ByCheckTag()
  PageObjectIterable<CheckTagPO> get checkTagPO;
}

@PageObject()
abstract class InnerObjectUsingMixin extends Object with InnerObjectMixin {
  InnerObjectUsingMixin();
  factory InnerObjectUsingMixin.create(PageLoaderElement context) =
      $InnerObjectUsingMixin.create;
}

@PageObject()
abstract class InnerObjectMixin {
  @ByCss('single')
  PageLoaderElement get single;

  @ByCss('nested-iterable')
  PageObjectIterable<PageLoaderElement> get innerIterable;

  @ByCheckTag()
  PageObjectIterable<CheckTagPO> get innerCheckTagPO;
}
