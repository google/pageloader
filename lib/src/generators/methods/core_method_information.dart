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

library pageloader.core_method_information;

import 'package:analyzer/analyzer.dart';
import 'package:built_value/built_value.dart';
import 'package:quiver/core.dart';

import 'core.dart';
import 'invalid_method_exception.dart';

part 'core_method_information.g.dart';

abstract class TypeInformation
    implements Built<TypeInformation, TypeInformationBuilder> {
  factory TypeInformation([updates(TypeInformationBuilder b)]) =
      _$TypeInformation;
  TypeInformation._();

  String get type;
  List<TypeInformation> get typeArguments;
}

TypeInformation getTypeInformation(String type) {
  final left = type.indexOf('<');
  final right = type.lastIndexOf('>');
  if (left < 0 || right < 0) {
    return TypeInformation((b) => b
      ..type = type
      ..typeArguments = []);
  }

  final genericType = type.substring(0, left);
  final typeArguments = type
      .substring(left + 1, right)
      .split(',')
      .map((e) => e.trim())
      .map((e) => getTypeInformation(e))
      .toList();
  return TypeInformation((b) => b
    ..type = genericType
    ..typeArguments = typeArguments);
}

TypeInformation extractPageObjectInfo(TypeInformation typeInfo, String source) {
  if (typeInfo.typeArguments.length != 1) {
    throw InvalidMethodException(
        source,
        'Expected exactly one type argument for ${typeInfo.type}'
        ' in return type. Check the return type, and if needed file a bug.'
        ' Original source: \n\n$source');
  }
  final nestedInfo = typeInfo.typeArguments.single;
  if (nestedInfo.type == 'List') {
    return extractPageObjectInfo(nestedInfo, source);
  }
  return nestedInfo;
}

CoreMethodInformation collectCoreMethodInformation(MethodDeclaration node) {
  // Extract type info.
  final typeInfo = getTypeInformation(node.returnType.toSource());

  final isFuture = typeInfo.type == 'Future';
  final isList = typeInfo.type == 'List' ||
      (typeInfo.typeArguments.length == 1 &&
          typeInfo.typeArguments[0].type == 'List');

  TypeInformation pageObjectInfo;
  if (isFuture || isList) {
    pageObjectInfo = extractPageObjectInfo(typeInfo, node.toSource());
  } else {
    pageObjectInfo = typeInfo;
  }

  // Extract annotation information.
  final methodAnnotations = node.metadata;
  final isMouse = methodAnnotations.any(isPageloaderMouse);
  final isRoot = methodAnnotations.any(isPageloaderRoot);

  final finders = methodAnnotations
      .where(isPageloaderFinder)
      .map((a) => generateAnnotationDeclaration(a))
      .toList();
  if (finders.length > 1) {
    throw InvalidMethodException(
        node.toSource(), 'multiple Finders cannot be used for single method');
  }

  final finder = finders.length == 1 ? finders.single : null;
  final filters = methodAnnotations
      .where(isPageloaderFilter)
      .map((a) => generateAnnotationDeclaration(a))
      .toList();
  final checkers = methodAnnotations
      .where(isPageloaderChecker)
      .map((a) => generateAnnotationDeclaration(a))
      .toList();

  if (finder == null) {
    if (filters.isNotEmpty) {
      throw InvalidMethodException(
          node.toSource(), 'found Filters but no Finder');
    }
    if (checkers.isNotEmpty) {
      throw InvalidMethodException(
          node.toSource(), 'found Checkers but no Finder');
    }
  }

  if (isRoot) {
    if (filters.isNotEmpty) {
      throw InvalidMethodException(
          node.toSource(), 'cannot use Filters with @root');
    }
    if (checkers.isNotEmpty) {
      throw InvalidMethodException(
          node.toSource(), 'cannot use Checkers with @root');
    }
  }

  if (finder != null && isRoot) {
    throw InvalidMethodException(
        node.toSource(), 'cannot use finder with @root');
  }

  return CoreMethodInformation((b) => b
    ..name = node.name.toSource()
    ..isGetter = node.isGetter
    ..isAbstract = node.isAbstract
    ..pageObjectType = pageObjectInfo.type
    ..pageObjectTemplate = Optional<String>.fromNullable(
        pageObjectInfo.typeArguments.length == 1
            ? pageObjectInfo.typeArguments.single.type
            : null)
    ..isFuture = isFuture
    ..isList = isList
    ..finder = Optional<String>.fromNullable(finder)
    ..filters = filters
    ..checkers = checkers
    ..isMouse = isMouse
    ..isRoot = isRoot
    ..nodeSource = node.toSource());
}

/// Captures all PL3 relevant information about a method.
abstract class CoreMethodInformation extends Object
    implements
        CoreMethodInformationBase,
        Built<CoreMethodInformation, CoreMethodInformationBuilder> {
  factory CoreMethodInformation([updates(CoreMethodInformationBuilder b)]) =
      _$CoreMethodInformation;
  CoreMethodInformation._();
}

/// All PL3 relevant information as getters.
@BuiltValue(instantiable: false)
abstract class CoreMethodInformationBase {
  String get name;
  bool get isGetter;
  bool get isAbstract;

  // Extracted type information.
  String get pageObjectType;
  Optional<String> get pageObjectTemplate;
  bool get isFuture;
  bool get isList;
  bool get isMouse;

  // Annotations.
  Optional<String> get finder;
  List<String> get filters;
  List<String> get checkers;
  bool get isRoot;

  String get nodeSource;
}
