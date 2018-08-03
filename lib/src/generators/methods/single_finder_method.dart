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

/// Generation for page object getters.
library pageloader.single_finder_method;

import 'package:analyzer/analyzer.dart';
import 'package:built_value/built_value.dart';
import 'package:quiver/core.dart';

import 'core.dart';
import 'invalid_method_exception.dart';
import 'listeners.dart';

part 'single_finder_method.g.dart';

/// Returns a [SingleFinderMethod] for abstract getters where the return type
/// is not [PageObjectIterable]. At least one [Finder] must be present.
Optional<SingleFinderMethod> collectSingleFinderGetter(
    MethodDeclaration node, List<Annotation> methodAnnotations) {
  if (!node.isGetter ||
      !node.isAbstract ||
      node.returnType.toString().startsWith(pageObjectIterable) ||
      node.returnType.toString().startsWith('Future<List<') ||
      node.returnType.toString().startsWith('List<') ||
      node.returnType.toString().startsWith('Lazy<List<')) {
    return Optional.absent();
  }

  final finders = methodAnnotations
      .where(isPageloaderFinder)
      .map((a) => generateAnnotationDeclaration(a))
      .toList();
  if (finders.length > 1) {
    throw InvalidMethodException(
        node.toSource(), 'multiple Finders cannot be used for single method');
  }
  var finder = finders.length == 1 ? finders.single : null;
  final filters = methodAnnotations
      .where(isPageloaderFilter)
      .map((a) => generateAnnotationDeclaration(a))
      .toList();
  final checkers = methodAnnotations
      .where(isPageloaderChecker)
      .map((a) => generateAnnotationDeclaration(a))
      .toList();

  final isRoot = methodAnnotations.any(isPageloaderRoot);

  // Get initial type information.
  String typeArgument = node.returnType.toString();

  // Get template, if it exists.
  String templateType;
  if (typeArgument.contains('<')) {
    final typeArguments = getReturnTypeArguments(typeArgument);
    if (typeArguments.length != 1) {
      throw InvalidMethodException(
          node.toSource(), 'only single template arguments are supported');
    }
    templateType = typeArguments[0];
    typeArgument = typeArgument.substring(0, typeArgument.indexOf('<'));
  }

  // Convert 'ByCheckTag' to 'ByTagName' if necessary.
  if (finder != null && finder.contains('ByCheckTag')) {
    finder = generateByTagNameFromByCheckTag(node.returnType.type);
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

  if (finder == null && !isRoot) {
    return Optional.absent();
  }

  return Optional.of(SingleFinderMethod((b) => b
    ..name = node.name.toString()
    ..pageObjectType = typeArgument
    ..finderDeclaration = Optional.fromNullable(finder)
    ..filterDeclarations = '[${filters.join(', ')}]'
    ..checkerDeclarations = '[${checkers.join(', ')}]'
    ..templateType = Optional.fromNullable(templateType)
    ..isRoot = isRoot));
}

/// Generation for finder method for single page objects.
abstract class SingleFinderMethod extends Object
    with SingleFinderMethodMixin
    implements
        SingleFinderMethodBase,
        Built<SingleFinderMethod, SingleFinderMethodBuilder> {
  factory SingleFinderMethod([updates(SingleFinderMethodBuilder b)]) =
      _$SingleFinderMethod;
  SingleFinderMethod._();
}

/// Contains functionality for the finder method of single page objects.
/// Needs to be used on a class implementing [SingleFinderMethodBase].
abstract class SingleFinderMethodMixin {
  // Getters from [SingleFinderMethodBase] that need to be declared in this
  // mixin to be used in the methods below.
  String get name;
  String get pageObjectType;
  Optional<String> get finderDeclaration;
  Optional<String> get templateType;
  String get filterDeclarations;
  String get checkerDeclarations;
  bool get isRoot;

  String generate(String pageObjectName) =>
      '$methodSignature { ' +
      generateStartMethodListeners(pageObjectName, name) +
      'final element = $_context;' +
      'final returnMe = $elementCreation;' +
      generateEndMethodListeners(pageObjectName, name) +
      ' return returnMe;}';

  String get methodSignature => '$pageObjectType$template get $name';

  String get elementCreation => createElement;

  String get _context {
    if (finderDeclaration.isPresent) {
      return _contextWithFinder;
    } else if (isRoot) {
      return _contextWithRoot;
    } else {
      // Should already by caught, but let's be sure.
      throw 'No finder or @root element? (this is a PageLoader bug).';
    }
  }

  String get _contextWithFinder =>
      '$root.createElement(${finderDeclaration.value}, '
      '$filterDeclarations, $checkerDeclarations)';

  String get _contextWithRoot => root;

  String get createElement {
    if (pageObjectType == 'PageLoaderElement') {
      return 'element';
    } else {
      return '$pageObjectType$template.create(element)';
    }
  }

  String get template =>
      templateType.isPresent ? '<${templateType.value}>' : '';
}

/// Base class for finder method.
/// Needs to be mixed in with [SingleFinderMethodMixin].
@BuiltValue(instantiable: false)
abstract class SingleFinderMethodBase {
  String get name;
  String get pageObjectType;
  Optional<String> get finderDeclaration;
  String get filterDeclarations;
  String get checkerDeclarations;
  Optional<String> get templateType;

  bool get isRoot;
}
