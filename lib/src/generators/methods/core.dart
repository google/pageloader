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

library pageloader3.core;

import 'package:analyzer/analyzer.dart';
import 'package:quiver/core.dart';

import 'annotation_evaluators.dart';

export 'annotation_evaluators.dart' show AnnotationKind;

/// Core generation functions.

/// Name of root PageLoaderElement for a generated page object.
final String root = '\$__root__';

final String mouse = '__mouse__';

/// Type for iterables.
final String pageObjectIterable = 'PageObjectIterable';

/// Type for lists.
final String pageObjectList = 'PageObjectList';

/// Returns a declaration of a annotation.
String generateAnnotationDeclaration(Annotation annotation) =>
    'const ${annotation.name}(${annotation.arguments.arguments.join(", ")})';

/// Returns the @EnsureTag annotation if it exists.
Optional<Annotation> getEnsureTag(ClassDeclaration declaration) {
  final ensures =
      declaration.metadata.where((a) => a.name.toSource() == 'EnsureTag');
  if (ensures.length > 1) {
    throw 'Found multiple @EnsureTag annotations in class: '
        '${declaration.toSource()}';
  }
  return ensures.length == 1
      ? new Optional.of(ensures.single)
      : const Optional.absent();
}

/// Returns true if annotation is some type of Pageloader annotation.
bool isPageloaderAnnotation(Annotation annotation) =>
    getAnnotationKind(annotation).isNotEmpty;

/// Returns set of all Pageloader3 annotation the current annotation satisfies.
Set<AnnotationKind> getAnnotationKind(Annotation annotation) {
  final returnSet = new Set<AnnotationKind>();
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
