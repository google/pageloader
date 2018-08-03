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

/// Generates code for normal getters. Currently just a pass through.
library pageloader.getter;

import 'package:analyzer/analyzer.dart';
import 'package:built_value/built_value.dart';
import 'package:quiver/core.dart';
import 'listeners.dart';

part 'getter.g.dart';

/// Returns a [Getter] for a concrete getters, or [absent()] otherwise.
Optional<Getter> collectUnannotatedGetter(MethodDeclaration node) {
  if (!node.isAbstract && node.isGetter) {
    return Optional.of(Getter((b) => b
      ..returnType = node.returnType.toString()
      ..name = node.name.toString()));
  }
  return Optional.absent();
}

/// Generates source for getter.
abstract class Getter implements Built<Getter, GetterBuilder> {
  String get name;
  String get returnType;

  String generate(String pageObjectName) {
    return '$returnType get $name { ' +
        generateStartMethodListeners(pageObjectName, name) +
        'final returnMe = super.$name;' +
        generateEndMethodListeners(pageObjectName, name) +
        'return returnMe; }';
  }

  factory Getter([updates(GetterBuilder b)]) = _$Getter;
  Getter._();
}
