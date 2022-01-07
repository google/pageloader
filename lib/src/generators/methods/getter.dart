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

import 'package:analyzer/dart/ast/ast.dart';
import 'package:built_value/built_value.dart';
import 'package:quiver/core.dart';

import 'listeners.dart';

part 'getter.g.dart';

/// Returns a [Getter] for a concrete getters, or [absent()] otherwise.
Optional<Getter> collectUnannotatedGetter(MethodDeclaration node) {
  if (!node.isAbstract && node.isGetter && !node.isStatic) {
    return Optional.of(Getter((b) => b
      ..returnType = node.returnType.toString()
      ..name = node.name.toString()));
  }
  return Optional.absent();
}

/// Generates source for getter.
abstract class Getter implements Built<Getter, GetterBuilder> {
  static const ignoredTypes = [
    'int',
    'double',
    'String',
    'bool',
    'List',
    'Map',
    'Set',
    'Future',
    'Runes',
    'Symbol'
  ];

  static const valueTypes = [
    'int',
    'double',
    'String',
    'bool',
    'List',
    'Map',
    'Set'
  ];

  String get name;

  String get returnType;

  String generate(String pageObjectName) {
    return '$returnType get $name { ' +
        generateStartMethodListeners(pageObjectName, name) +
        'final returnMe = super.$name;' +
        generateEndMethodListeners(pageObjectName, name) +
        'return returnMe; }';
  }

  /// Generates code that given list of [PageLoaderElement] ids called
  /// `internalIds`, determine whether and where this getter appears in the list
  /// and what code should be further generated for this.
  ///
  /// There are two cases. One is [PageLoaderElement], which would be the same
  /// as in [SingleFinderMethodMixin.generateFineChain]. The other one can be
  /// any page object or something completely unrelated, where we would assume
  /// it to be page object and try to get the id via $__root__.id and if
  /// successful, call [findChain].
  String generateFindChain() => returnType == 'PageLoaderElement'
      ? '''
      try {
        var ${name}Index = internalIds.indexOf(this.$name.id);
        if (${name}Index >= 0 && ${name}Index < closestIndex) {
          closestIndex = ${name}Index;
          closestValue = (_) => '$name.\${PageObject.defaultCode[action] ??
                             PageObject.defaultCode['default']}';
        }
      } catch (_) {
        // Ignored.
      }'''
      : '''
      try {
        // Do not know the type. Try it out and ignore if not successful.
        var ${name}Element = this.$name as dynamic;
        var ${name}Index = internalIds
            .indexOf(${name}Element.\$__root__.id as String);
        if (${name}Index >= 0 && ${name}Index < closestIndex) {
          closestIndex = ${name}Index;
          closestValue = (ids) =>
              '$name.\${${name}Element.findChain(ids, action)}'
              .replaceAll(RegExp('\\\\.\\\$'), '');
        }
      } catch (_) {
        // Ignored.
      }''';

  bool get produceFindChain =>
      !returnType.endsWith('>') && !ignoredTypes.contains(returnType);

  bool get produceTestCreatorGetter =>
      valueTypes.contains(returnType.split('<').first);

  factory Getter([Function(GetterBuilder) updates]) = _$Getter;

  Getter._();
}
