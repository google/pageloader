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

library pageloader.unannotated_method;

import 'package:analyzer/analyzer.dart';
import 'package:built_value/built_value.dart';
import 'package:quiver/core.dart';

import 'listeners.dart';

part 'unannotated_method.g.dart';

/// Generation for unannotated methods that are not getters or setters.
/// Currently just a pass through.
Optional<UnannotatedMethod> collectUnannotatedMethod(MethodDeclaration node) {
  if (node.isAbstract || node.isGetter || node.isSetter || node.isOperator) {
    return Optional.absent();
  }

  return Optional.of(UnannotatedMethod((b) => b
    ..name = node.name.toString()
    ..returnType = node.returnType.toString()
    ..parameters = node.parameters.parameters
    ..typeParameters = Optional.fromNullable(node.typeParameters)));
}

/// Generation for unannotated method.
abstract class UnannotatedMethod
    implements Built<UnannotatedMethod, UnannotatedMethodBuilder> {
  String get name;
  String get returnType;
  List<FormalParameter> get parameters;
  Optional<TypeParameterList> get typeParameters;

  String generate(String pageObjectName) {
    if (returnType == 'void') {
      return 'void $_methodDeclaration($_parameterDeclarations) {' +
          generateStartMethodListeners(pageObjectName, name) +
          'super.$name($_parameterNames);' +
          generateEndMethodListeners(pageObjectName, name) +
          'return;'
          '}';
    } else {
      return '$returnType $_methodDeclaration($_parameterDeclarations) {' +
          generateStartMethodListeners(pageObjectName, name) +
          'final returnMe = super.$name($_parameterNames);' +
          generateEndMethodListeners(pageObjectName, name) +
          'return returnMe;'
          '}';
    }
  }

  String get _methodDeclaration => '$name$_typeParameters';

  String get _typeParameters =>
      typeParameters.isPresent ? typeParameters.value.toSource() : '';

  String get _parameterDeclarations {
    final required = parameters
        .where((p) => p.isRequired)
        .map((p) => p.toSource())
        .join(', ');

    final namedParams =
        parameters.where((p) => p.isNamed).map((p) => p.toSource()).join(', ');
    final named = namedParams.isNotEmpty ? '{$namedParams}' : '';

    final positionalParams = parameters
        .where((p) => p.isOptionalPositional)
        .map((p) => p.toSource())
        .join(', ');
    final positional = positionalParams.isNotEmpty ? '[$positionalParams]' : '';

    return _combineParameters(required, named, positional);
  }

  String get _parameterNames {
    final required = parameters
        .where((p) => p.isRequired)
        .map((p) => p.element.name)
        .join(', ');

    final named = parameters
        .where((p) => p.isNamed)
        .map((p) => '${p.element.name}:${p.element.name}')
        .join(', ');

    final positional = parameters
        .where((p) => p.isOptionalPositional)
        .map((p) => p.element.name)
        .join(', ');

    return _combineParameters(required, named, positional);
  }

  String _combineParameters(String required, String named, String positional) {
    final mixedList = <String>[];
    if (required.isNotEmpty) {
      mixedList.add(required);
    }
    if (named.isNotEmpty) {
      mixedList.add(named);
    }
    if (positional.isNotEmpty) {
      mixedList.add(positional);
    }
    return mixedList.join(',');
  }

  factory UnannotatedMethod([updates(UnannotatedMethodBuilder b)]) =
      _$UnannotatedMethod;
  UnannotatedMethod._();
}
