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

/// Generation for page object iterables.
library pageloader.iterable_finder_method;

import 'package:analyzer/analyzer.dart';
import 'package:built_value/built_value.dart';
import 'package:quiver/core.dart';

import 'core.dart';
import 'invalid_method_exception.dart';
import 'listeners.dart';

part 'iterable_finder_method.g.dart';

/// Returns a [IterableFinderMethod] for abstract getters when at least one
/// [Finder] is present and the return type is [PageObjectIterable], and
/// [absent()] otherwise.
Optional<IterableFinderMethod> collectIterableFinderGetter(
    MethodDeclaration node, List<Annotation> methodAnnotations) {
  if (!node.isGetter ||
      !node.isAbstract ||
      !node.returnType.toString().startsWith(pageObjectIterable)) {
    return Optional.absent();
  }

  String finder;
  final filters = <String>[];
  final checkers = <String>[];
  for (final annotation in methodAnnotations) {
    if (isPageloaderFinder(annotation)) {
      if (finder != null) {
        throw InvalidMethodException(node.toSource(),
            'multiple Finders cannot be used for single method');
      }
      finder = generateAnnotationDeclaration(annotation);
    } else if (isPageloaderFilter(annotation)) {
      filters.add(generateAnnotationDeclaration(annotation));
    } else if (isPageloaderChecker(annotation)) {
      checkers.add(generateAnnotationDeclaration(annotation));
    }
  }

  final typeArguments = getReturnTypeArguments(node.returnType.toString());
  if (typeArguments.length != 1) {
    throw InvalidMethodException(node.toSource(),
        'return type should specify exactly one type argument');
  }

  // Convert 'ByCheckTag' to 'ByTagName' if necessary.
  if (finder != null && finder.contains('ByCheckTag')) {
    finder = generateByTagNameFromByCheckTag(
        getInnerType(node.returnType.type, typeArguments[0]));
  }

  if (finder == null) {
    if (filters.isNotEmpty) {
      throw InvalidMethodException(
          node.toSource(), 'found Filters but no Finder');
    }
    if (checkers.isNotEmpty) {
      throw InvalidMethodException(
          node.toSource(), 'found Checkers but no Finder');
    }
    return Optional.absent();
  } else {
    return Optional.of(IterableFinderMethod((b) => b
      ..name = node.name.toString()
      ..iterableTypeArgument = typeArguments[0]
      ..finderDeclaration = finder
      ..filterDeclarations = '[${filters.join(', ')}]'
      ..checkerDeclarations = '[${checkers.join(', ')}]'));
  }
}

/// Generates source for iterable page objects getters.
abstract class IterableFinderMethod
    implements Built<IterableFinderMethod, IterableFinderMethodBuilder> {
  String get name;
  String get iterableTypeArgument;
  String get finderDeclaration;
  String get filterDeclarations;
  String get checkerDeclarations;

  String generate(String pageObjectName) =>
      '$_methodSignature { ' +
      generateStartMethodListeners(pageObjectName, name) +
      'final returnMe = $_createObjectIterable;' +
      generateEndMethodListeners(pageObjectName, name) +
      'return returnMe; }';

  String get _methodSignature =>
      'PageObjectIterable<$iterableTypeArgument> get $name';

  String get _createElementIterator =>
      '$root.createIterable($finderDeclaration, $filterDeclarations, $checkerDeclarations)';

  String get _createObjectIterable =>
      'PageObjectIterable<$iterableTypeArgument>'
      '($_createElementIterator, $_constructor)';

  String get _constructor {
    if (iterableTypeArgument == 'PageLoaderElement') {
      return '(PageLoaderElement e) => e';
    } else {
      return '(PageLoaderElement e) => $iterableTypeArgument.create(e)';
    }
  }

  factory IterableFinderMethod([updates(IterableFinderMethodBuilder b)]) =
      _$IterableFinderMethod;
  IterableFinderMethod._();
}
