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

/// Functions that evaluate an element's annotations on PageLoader annotations
/// and returns its kind.
library pageloader.annotation_evaluators;

import 'dart:collection' show Queue;

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

/// Library for provided pageloader annotations.
final String pageLoaderAnnotations = 'pageloader.annotations';

/// Library for interfaces of pageloader annotations.
final String pageLoaderAnnotationInterface =
    'pageloader.api.annotation_interfaces';

/// Returns set of AnnotationKinds that match '@root', '@Mouse'.
Set<AnnotationKind> evaluateAsAtomicAnnotation(Element element) {
  final returnSet = Set<AnnotationKind>();
  if (element is PropertyAccessorElement &&
      element.library.name == pageLoaderAnnotations) {
    final result = classNameToAnnotationKind(element.name, isAtomic: true);
    if (result != null) {
      returnSet.add(result);
    }
  }
  return returnSet;
}

/// Returns set of AnnotationKinds if the annotation is a subclass of
/// Finder, Checker, and/or Filter.
Set<AnnotationKind> evaluateAsInterfaceAnnotation(Element element) {
  final returnSet = Set<AnnotationKind>();
  InterfaceType type;
  if (element is PropertyAccessorElement) {
    // Annotation is a top-level variable.
    type = element.variable.type as InterfaceType;
  } else if (element is ConstructorElement) {
    // Annotation is an named constructor.
    type = element.enclosingElement.type;
  } else if (element is ClassElement) {
    // Annotation is no-name constructor.
    type = element.type;
  }

  if (type != null) {
    final types = Queue<InterfaceType>()..add(type);
    final seenValidAnnotations = Set<AnnotationKind>();
    do {
      type = types.removeFirst();
      if (type.element.library.name == pageLoaderAnnotationInterface) {
        seenValidAnnotations
            .add(classNameToAnnotationKind(type.element.name, isAtomic: false));
      }
      types..addAll(type.interfaces)..addAll(type.mixins);
      if (type.superclass != null) {
        types.add(type.superclass);
      }
    } while (types.isNotEmpty);
    returnSet.addAll(seenValidAnnotations.where((ak) => ak != null));
  }
  return returnSet;
}

/// Types of Pageloader annotations.
enum AnnotationKind {
  checker,
  disableDisplayedCheck,
  filter,
  finder,
  legacyPageObject,
  mouse,
  optional,
  root,
}

/// Maps library and className to proper AnnotationKind.
AnnotationKind classNameToAnnotationKind(String className, {bool isAtomic}) {
  if (isAtomic) {
    switch (className) {
      case 'LegacyPageObject':
        return AnnotationKind.legacyPageObject;
      case 'root':
        return AnnotationKind.root;
      case 'optional':
        return AnnotationKind.optional;
      case 'disableDisplayedCheck':
        return AnnotationKind.disableDisplayedCheck;
      case 'Mouse':
        return AnnotationKind.mouse;
      default:
        return null;
    }
  } else {
    switch (className) {
      case 'CssFinder':
      case 'ContextFinder':
      case 'Finder':
        return AnnotationKind.finder;
      case 'Checker':
        return AnnotationKind.checker;
      case 'Filter':
        return AnnotationKind.filter;
      default:
        return null;
    }
  }
}
