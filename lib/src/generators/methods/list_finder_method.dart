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

/// Generation for page object lists.
library pageloader.list_finder_method;

import 'package:analyzer/dart/ast/ast.dart';
import 'package:built_value/built_value.dart';
import 'package:quiver/core.dart';

import 'core.dart';
import 'core_method_information.dart';
import 'listeners.dart';

part 'list_finder_method.g.dart';

/// Returns a [ListFinderMethod] for abstract getters when at least one
/// [Finder] is present and the return type is [Future<List<X>>] or [List<X>],
/// and [absent()] otherwise.
Optional<ListFinderMethod> collectListFinderGetter(
    CoreMethodInformationBase methodInfo, MethodDeclaration node) {
  if (!methodInfo.isAbstract ||
      !methodInfo.isGetter ||
      node.isStatic ||
      !methodInfo.finder.isPresent ||
      !methodInfo.isList) {
    return Optional.absent();
  }

  // Convert 'ByCheckTag' to 'ByTagName' if necessary.
  var finder = methodInfo.finder.orNull;
  if (finder != null && finder.contains('ByCheckTag')) {
    finder = generateByTagNameFromByCheckTag(
        getInnerType(node.returnType?.type, methodInfo.pageObjectType),
        node.toSource());
  }

  return Optional.of(ListFinderMethod((b) => b
    ..name = methodInfo.name
    ..listTypeArgument = methodInfo.pageObjectType
    ..finderDeclaration = finder
    ..filterDeclarations = '[${methodInfo.filters.join(', ')}]'
    ..checkerDeclarations = '[${methodInfo.checkers.join(', ')}]'
    ..isFuture = methodInfo.isFuture
    ..genericType = methodInfo.pageObjectTemplate));
}

/// Generates source for iterable page objects getters.
abstract class ListFinderMethod extends Object
    with ListFinderMethodMixin
    implements
        ListFinderMethodBase,
        Built<ListFinderMethod, ListFinderMethodBuilder> {
  factory ListFinderMethod([Function(ListFinderMethodBuilder) updates]) =
      _$ListFinderMethod;

  ListFinderMethod._();
}

/// Mixin that provides functional methods to [ListFinderMethod].
abstract class ListFinderMethodMixin {
  // Fields from [ListFinderMethodBase] that need to be declared in order to
  // be used in the below methods.
  String get checkerDeclarations;

  String get listTypeArgument;

  String get filterDeclarations;

  String get finderDeclaration;

  String get name;

  bool get isFuture;

  Optional<String> get genericType;

  String generate(String pageObjectName) =>
      '$methodSignature { ' +
      generateStartMethodListeners(pageObjectName, name) +
      'final returnMe = $getReturnValue;' +
      generateEndMethodListeners(pageObjectName, name) +
      'return returnMe; }';

  String get methodSignature {
    if (isFuture) {
      return 'Future<$pageObjectList> get $name async ';
    } else {
      return '$pageObjectList get $name ';
    }
  }

  /// Generates code that given list of [PageLoaderElement] ids called
  /// `internalIds`, iterate over elements this [ListFinderMethodMixin]
  /// represents, determine whether and where each element appears in the list
  /// and what code should be further generated for this.
  ///
  /// There are two cases depending on [listTypeArgument]. One is
  /// [PageLoaderElement], where generation would stopped, and return the
  /// member name. The other one can be any page object, where we would try to
  /// get the id via $__root__.id and if successful, call [findChain].
  String generateFindChain() => '''
      final ${name}Elements = this.$name;
      for (var elementIter = 0; elementIter < ${name}Elements.length; elementIter++) {
        try {
          $chainIndexCreation
          if (${name}Index >= 0 && ${name}Index < closestIndex) {
            closestIndex = ${name}Index;
            closestValue = $chainValueCreation;
          }
        } catch (_) {
          // Ignored.
        }
      }''';

  bool get produceFindChain => !isFuture;

  String get chainIndexCreation => createChainIndex;

  String get createChainIndex => listTypeArgument == 'PageLoaderElement'
      ? 'var ${name}Index = internalIds.indexOf(${name}Elements[elementIter].id);'
      : '''var ${name}Element = ${name}Elements[elementIter] as dynamic;
           var ${name}Index = internalIds
               .indexOf(${name}Element.\$__root__.id as String);''';

  String get chainValueCreation => createChainValue;

  String get createChainValue => listTypeArgument == 'PageLoaderElement'
      ? "(_) => '$name[\$elementIter].\${PageObject.defaultCode[action] ?? "
          "PageObject.defaultCode['default']}'"
      : '(ids) => '
          "'$name[\$elementIter].\${${name}Element.findChain(ids, action)}'"
          ".replaceAll(RegExp('\\\\.\\\$'), '')";

  String get constructor {
    if (listTypeArgument == 'PageLoaderElement') {
      return '(PageLoaderElement e) => e';
    } else {
      return '(PageLoaderElement e) => '
          '$listTypeArgument$generic.create(e)';
    }
  }

  String get generic => genericType.isPresent ? '<${genericType.value}>' : '';

  // Note: although redundant, keep this as is.
  String get getReturnValue => createObjectIterable;

  String get pageObjectList => 'PageObjectList<$listTypeArgument$generic>';

  String get createObjectIterable => 'PageObjectList<$listTypeArgument$generic>'
      '($_createElementIterator, $constructor)';

  String get _createElementIterator => '$root.createList('
      '$finderDeclaration, $filterDeclarations, $checkerDeclarations)';
}

@BuiltValue(instantiable: false)
abstract class ListFinderMethodBase {
  String get name;

  String get listTypeArgument;

  String get finderDeclaration;

  String get filterDeclarations;

  String get checkerDeclarations;

  bool get isFuture;

  Optional<String> get genericType;
}
