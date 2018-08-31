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

library pageloader.api.page_object_list_interface;

import 'dart:collection';

import 'exceptions.dart';
import 'iterable_interfaces.dart';
import 'page_loader_element_interface.dart';

/// List implementation specific for Pageloader.

/// Iterable for collections of page objects and [PageLoaderElement]s.
///
/// This is a wrapper to construct page objects based on an underlying
/// list of [PageLoaderElement]s.
class PageObjectList<E> extends ListBase<E> {
  List<PageLoaderElement> _elementList;
  PageObjectConstructor<E> _pageObjectConstructor;

  PageObjectList(this._elementList, this._pageObjectConstructor);

  @override
  E operator [](int index) => _pageObjectConstructor(_elementList[index]);

  @override
  int get length => _elementList.length;

  @override
  set length(int newLength) => throw PageLoaderException(
      'Cannot modify PageObjectList (call to length setter)');

  @override
  void operator []=(int index, E value) => throw PageLoaderException(
      'Cannot modify PageObjectList (call to operator[]=)');

  @override
  String toString() => _elementList.toString();
}
