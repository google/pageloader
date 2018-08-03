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

/// Core generation functions.
library pageloader.core;

import 'package:analyzer/analyzer.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:quiver/core.dart';

import 'annotation_evaluators.dart';

export 'annotation_evaluators.dart' show AnnotationKind;

/// Name of root PageLoaderElement for a generated page object.
final String root = '\$__root__';

final String mouse = '__mouse__';

/// Type for iterables.
final String pageObjectIterable = 'PageObjectIterable';

/// Type for lists.
final String pageObjectList = 'PageObjectList';

/// Returns a declaration of a annotation.
String generateAnnotationDeclaration(Annotation annotation) =>
    '${annotation.name}(${annotation.arguments.arguments.join(", ")})';

/// Returns a 'ByTagName' declaration from the 'ByCheckTag' annotation.
String generateByTagNameFromByCheckTag(InterfaceType node) {
  final defaultTagName = _extractTagName(node.element);
  if (defaultTagName.isEmpty) {
    throw "'@ByCheckTag' can only be used on getters that return a "
        "PageObject type with the'@CheckTag' annotation.";
  }
  return "ByTagName('$defaultTagName')";
}

/// Extracts the tag name from a PageLoader2 class based on `@CheckTag`.
/// If there is no tag name associated with the Page Object,
/// returns and empty string.
String _extractTagName(ClassElement poTypeElement) {
  var expectedTag = '';
  for (final annotation in poTypeElement.metadata) {
    final annotationElement = annotation.element;
    if (annotationElement is ConstructorElement) {
      final annotationName = annotationElement.enclosingElement.displayName;
      final annotationValue = annotation.computeConstantValue();
      if (annotationName == 'CheckTag') {
        final inner = annotationValue.getField('_expectedTagName');
        expectedTag = inner.toStringValue();
      }
    }
  }
  return expectedTag;
}

/// Returns the @EnsureTag annotation if it exists.
Optional<Annotation> getEnsureTag(ClassDeclaration declaration) {
  final ensures =
      declaration.metadata.where((a) => a.name.toSource() == 'EnsureTag');
  if (ensures.length > 1) {
    throw 'Found multiple @EnsureTag annotations in class: '
        '${declaration.toSource()}';
  }
  return ensures.length == 1 ? Optional.of(ensures.single) : Optional.absent();
}

/// Returns the @CheckTag annotation if it exists.
Optional<Annotation> getCheckTag(ClassDeclaration declaration) {
  final checks =
      declaration.metadata.where((a) => a.name.toSource() == 'CheckTag');
  if (checks.length > 1) {
    throw 'Found multiple @CheckTag annotations in class: '
        '${declaration.toSource()}';
  }
  return checks.length == 1 ? Optional.of(checks.single) : Optional.absent();
}

/// Returns true if annotation is some type of Pageloader annotation.
bool isPageloaderAnnotation(Annotation annotation) =>
    getAnnotationKind(annotation).isNotEmpty;

/// Returns set of all Pageloader annotation the current annotation satisfies.
Set<AnnotationKind> getAnnotationKind(Annotation annotation) {
  final returnSet = Set<AnnotationKind>();
  final element = annotation.element;
  if (element != null) {
    returnSet
      ..addAll(evaluateAsInterfaceAnnotation(element))
      ..addAll(evaluateAsAtomicAnnotation(element));
  }
  return returnSet;
}

/// True if annotation is @optional.
bool isOptionalAnnotation(Annotation annotation) =>
    annotation.toString() == '@optional';

/// True if annotation is a [Finder].
bool isPageloaderFinder(Annotation annotation) =>
    getAnnotationKind(annotation).contains(AnnotationKind.finder);

/// True if annotation is a [Filter].
bool isPageloaderFilter(Annotation annotation) =>
    getAnnotationKind(annotation).contains(AnnotationKind.filter);

/// True if annotation is a [Checker].
bool isPageloaderChecker(Annotation annotation) =>
    getAnnotationKind(annotation).contains(AnnotationKind.checker);

/// True if annotation is a [Mouse].
bool isPageloaderMouse(Annotation annotation) =>
    getAnnotationKind(annotation).contains(AnnotationKind.mouse);

/// True if annotation is a [root].
bool isPageloaderRoot(Annotation annotation) =>
    getAnnotationKind(annotation).contains(AnnotationKind.root);

// returnType no longer lists it's own typeArguments, and DartType isn't
// resolved, so we parse it ourselves.
List<String> getReturnTypeArguments(String returnStr) {
  final left = returnStr.indexOf('<');
  final right = returnStr.lastIndexOf('>');

  if (left < 0 || right < 0) {
    return [];
  }

  return returnStr
      .substring(left + 1, right)
      .split(',')
      .map((e) => e.trim())
      .toList();
}

/// Given a type parameterized type (ex: Future<T>), returns the inner type
/// matching name [matchingType].
///
/// Assumes that the inner-type has a single type (ex: not Foo<A, B>).
DartType getInnerType(DartType topType, String matchingType) {
  // Filter out type name incase prefixes exist on the type.
  matchingType =
      matchingType.contains('.') ? matchingType.split('.')[1] : matchingType;
  final typeArgs = (topType as ParameterizedType).typeArguments;
  final first = typeArgs.first;
  if (first.name == matchingType) {
    return first;
  }
  return getInnerType(first, matchingType);
}
