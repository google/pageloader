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

part 'unannotated.g.dart';

typedef MyTypeDef = String Function(String item);

@PageObject()
abstract class Unannotated {
  Unannotated();
  factory Unannotated.create(PageLoaderElement context) = $Unannotated.create;

  bool _myField = false;

  String noParameters() {
    return 'noParameters';
  }

  String _privateMethod(String s) {
    return 'private_' + s;
  }

  String oneParameter(String privateMe) {
    return _privateMethod(privateMe);
  }

  int twoParameters(int a, int b) {
    return a + b;
  }

  String typeDefParameter(MyTypeDef typeDef) {
    return typeDef("I'm pickle riiiiiick!");
  }

  void noReturnType() {
    // Does nothing!
  }

  bool get isFieldSet => _myField;

  set myField(bool setValue) {
    _myField = setValue;
  }

  int operator [](int x) => x;

  List<T> generateTypedList<T>() => <T>[];
}

// Mixin implementation
@PageObject()
abstract class UnannotatedUsingMixin extends Object with UnannotatedMixin {
  UnannotatedUsingMixin();
  factory UnannotatedUsingMixin.create(PageLoaderElement context) =
      $UnannotatedUsingMixin.create;
}

@PageObject()
abstract class UnannotatedMixin {
  bool _myField = false;

  String noParameters() {
    return 'noParameters';
  }

  String _privateMethod(String s) {
    return 'private_' + s;
  }

  String oneParameter(String privateMe) {
    return _privateMethod(privateMe);
  }

  int twoParameters(int a, int b) {
    return a + b;
  }

  String typeDefParameter(MyTypeDef typeDef) {
    return typeDef("I'm pickle riiiiiick!");
  }

  void noReturnType() {
    // Does nothing!
  }

  bool get isFieldSet => _myField;

  set myField(bool setValue) {
    _myField = setValue;
  }

  int operator [](int x) => x;

  List<T> generateTypedList<T>() => <T>[];
}
