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

part 'generics.g.dart';

typedef MyGenericTypeDef<T> = String Function(T item);

@PageObject()
abstract class Generics<T> {
  Generics();
  factory Generics.create(PageLoaderElement context) = $Generics<T>.create;

  String typeDefParameter(T thing, MyGenericTypeDef<T> typeDef) {
    return typeDef(thing);
  }

  S exampleMethod<S>(S s) => s;
}

@CheckTag('checked-generics')
@PageObject()
abstract class CheckedGenerics<T> {
  CheckedGenerics();
  factory CheckedGenerics.create(PageLoaderElement context) =
      $CheckedGenerics<T>.create;

  String typeDefParameter(T thing, MyGenericTypeDef<T> typeDef) {
    return typeDef(thing);
  }
}

@PageObject()
abstract class GenericPair<T, V> {
  GenericPair();
  factory GenericPair.create(PageLoaderElement context) =
      $GenericPair<T, V>.create;

  Map<R, S> exampleMethodMap<R, S>(R r, S s) => {r: s};
}

@PageObject()
abstract class RootPo<T> {
  RootPo();
  factory RootPo.create(PageLoaderElement context) = $RootPo<T>.create;

  @ByTagName('x')
  Generics<T> get generics;

  @ByTagName('y')
  List<Generics<T>> get genericsList;

  @ByCheckTag()
  CheckedGenerics<T> get checkedGenerics;

  @ByCheckTag()
  List<CheckedGenerics<T>> get checkedGenericsList;
}

// Mixin implementation
@PageObject()
abstract class GenericsUsingMixin<T> extends Object with GenericsMixin<T> {
  GenericsUsingMixin();
  factory GenericsUsingMixin.create(PageLoaderElement context) =
      $GenericsUsingMixin<T>.create;
}

@PageObject()
abstract class GenericsMixin<T> {
  String typeDefParameter(T thing, MyGenericTypeDef<T> typeDef) {
    return typeDef(thing);
  }

  R exampleMethod<R>(R r) => r;
}

@PageObject()
abstract class GenericPairUsingMixin<T, V> extends Object
    with GenericPairMixin<T, V> {
  GenericPairUsingMixin();
  factory GenericPairUsingMixin.create(PageLoaderElement context) =
      $GenericPairUsingMixin<T, V>.create;
}

@PageObject()
abstract class GenericPairMixin<T, V> {
  Map<R, S> exampleMethodMap<R, S>(R r, S s) => {r: s};
}

@PageObject()
abstract class RootPoUsingMixin<T> extends Object with RootPoMixin<T> {
  RootPoUsingMixin();
  factory RootPoUsingMixin.create(PageLoaderElement context) =
      $RootPoUsingMixin<T>.create;
}

@PageObject()
abstract class RootPoMixin<T> {
  @ByTagName('x')
  Generics<T> get generics;

  @ByTagName('y')
  List<Generics<T>> get genericsList;

  @ByCheckTag()
  CheckedGenerics<T> get checkedGenerics;

  @ByCheckTag()
  List<CheckedGenerics<T>> get checkedGenericsList;
}
