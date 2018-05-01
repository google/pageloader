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

import 'dart:async';
import 'package:pageloader/pageloader.dart';

part 'list.g.dart';

@PageObject()
abstract class Lists {
  Lists();
  factory Lists.create(PageLoaderElement context) = $Lists.create;

  @ByCss('basic')
  Future<List<PageLoaderElement>> get basics;

  @ByCss('nested')
  Future<List<InnerListObject>> get nested;

  @ByCss('basic')
  List<PageLoaderElement> get basicsSync;

  @ByCss('nested')
  List<InnerListObject> get nestedSync;
}

@PageObject()
abstract class InnerListObject {
  InnerListObject();
  factory InnerListObject.create(PageLoaderElement context) =
      $InnerListObject.create;

  @ByCss('single')
  PageLoaderElement get single;

  @ByCss('nested-iterable')
  Future<List<PageLoaderElement>> get innerIterable;
}

// Mixin implementation
@PageObject()
abstract class ListsUsingMixin extends Object with ListsMixin {
  ListsUsingMixin();
  factory ListsUsingMixin.create(PageLoaderElement context) =
      $ListsUsingMixin.create;
}

@PageObject()
abstract class ListsMixin {
  @ByCss('basic')
  Future<List<PageLoaderElement>> get basics;

  @ByCss('nested')
  Future<List<InnerListObjectUsingMixin>> get nested;

  @ByCss('basic')
  List<PageLoaderElement> get basicsSync;

  @ByCss('nested')
  List<InnerListObjectUsingMixin> get nestedSync;
}

@PageObject()
abstract class InnerListObjectUsingMixin extends Object
    with InnerListObjectMixin {
  InnerListObjectUsingMixin();
  factory InnerListObjectUsingMixin.create(PageLoaderElement context) =
      $InnerListObjectUsingMixin.create;
}

@PageObject()
abstract class InnerListObjectMixin {
  @ByCss('single')
  PageLoaderElement get single;

  @ByCss('nested-iterable')
  Future<List<PageLoaderElement>> get innerIterable;
}
