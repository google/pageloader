// @dart = 2.9

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

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

/// Library for provided pageloader annotations.
final String pageLoaderAnnotations = 'pageloader.annotations';

/// Library for interfaces of pageloader annotations.
final String pageLoaderAnnotationInterface =
    'pageloader.api.annotation_interfaces';

/// Returns set of AnnotationKinds that match '@root', '@Mouse', '@nullElement'
/// and '@Pointer'.
Set<AnnotationKind> evaluateAsAtomicAnnotation(Element element) {
  final returnSet = <AnnotationKind>{};
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
  final returnSet = <AnnotationKind>{};

  DartType type;
  if (element is PropertyAccessorElement && element.isGetter) {
    type = element.returnType;
  } else if (element is ConstructorElement) {
    type = element.returnType;
  }

  if (type is InterfaceType) {
    final seenValidAnnotations = <AnnotationKind>{};
    final interfaces = [type, ...type.allSupertypes];
    for (var interface in interfaces) {
      final interfaceElement = interface.element;
      if (interfaceElement.library.name == pageLoaderAnnotationInterface) {
        seenValidAnnotations.add(
          classNameToAnnotationKind(interfaceElement.name, isAtomic: false),
        );
      }
    }
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
  pointer,
  root,
  nullElement,
}

/// Maps library and className to proper AnnotationKind.
AnnotationKind classNameToAnnotationKind(String className, {bool isAtomic}) {
  if (isAtomic) {
    switch (className) {
      case 'LegacyPageObject':
        return AnnotationKind.legacyPageObject;
      case 'root':
        return AnnotationKind.root;
      case 'nullElement':
        return AnnotationKind.nullElement;
      case 'optional':
        return AnnotationKind.optional;
      case 'disableDisplayedCheck':
        return AnnotationKind.disableDisplayedCheck;
      case 'Mouse':
        return AnnotationKind.mouse;
      case 'Pointer':
        return AnnotationKind.pointer;
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
