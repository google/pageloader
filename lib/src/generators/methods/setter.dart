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

/// Generates code for normal setters. Currently just a pass through.
library pageloader.setter;

import 'package:analyzer/analyzer.dart';
import 'package:built_value/built_value.dart';
import 'package:quiver/core.dart';
import 'listeners.dart';

part 'setter.g.dart';

/// Returns a [Setter] for concrete setters, and [absent()] otherwise.
Optional<Setter> collectUnannotatedSetter(MethodDeclaration node) {
  if (!node.isAbstract && node.isSetter) {
    final param = node.parameters.parameters.first;
    return Optional.of(Setter((b) => b
      ..name = node.name.toString()
      ..setterType = param.element.type.toString()
      ..setterValueName = param.element.name));
  }
  return Optional.absent();
}

/// Generates code for normal setters.
abstract class Setter implements Built<Setter, SetterBuilder> {
  String get name;
  String get setterType;
  String get setterValueName;

  String generate(String pageObjectName) {
    return 'set $name($setterType $setterValueName) { ' +
        generateStartMethodListeners(pageObjectName, name) +
        'super.$name = $setterValueName; ' +
        generateEndMethodListeners(pageObjectName, name) +
        'return;'
        '}';
  }

  factory Setter([updates(SetterBuilder b)]) = _$Setter;
  Setter._();
}
