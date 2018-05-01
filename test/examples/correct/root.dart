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

part 'root.g.dart';

@PageObject()
abstract class ParentRoot {
  ParentRoot();
  factory ParentRoot.create(PageLoaderElement context) = $ParentRoot.create;

  @ById('root-id')
  Root get root;
}

@PageObject()
abstract class Root {
  Root();
  factory Root.create(PageLoaderElement context) = $Root.create;

  @root
  PageLoaderElement get myRoot;

  @ById('some-id')
  PageLoaderElement get myId;
}

// Mixin implementation
@PageObject()
abstract class ParentRootUsingMixin extends Object with ParentRootMixin {
  ParentRootUsingMixin();
  factory ParentRootUsingMixin.create(PageLoaderElement context) =
      $ParentRootUsingMixin.create;
}

@PageObject()
abstract class ParentRootMixin {
  @ById('root-id')
  RootUsingMixin get root;
}

@PageObject()
abstract class RootUsingMixin extends Object with RootMixin {
  RootUsingMixin();
  factory RootUsingMixin.create(PageLoaderElement context) =
      $RootUsingMixin.create;
}

@PageObject()
abstract class RootMixin {
  @root
  PageLoaderElement get myRoot;

  @ById('some-id')
  PageLoaderElement get myId;
}
