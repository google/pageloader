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

import 'package:analyzer/analyzer.dart';

import 'methods/core.dart';
import 'methods/core_method_information.dart';
import 'methods/getter.dart';
import 'methods/invalid_method_exception.dart';
import 'methods/iterable_finder_method.dart';
import 'methods/list_finder_method.dart';
import 'methods/mouse_finder_method.dart';
import 'methods/oversupported_method.dart';
import 'methods/setter.dart';
import 'methods/single_finder_method.dart';
import 'methods/unannotated_method.dart';

/// Collects relevant information from a page object's source for use
/// in generation.
class CollectorVisitor extends GeneralizingAstVisitor<void> {
  AstNode _parentClass;

  List<Getter> getters = [];
  List<Setter> setters = [];
  covariant List<SingleFinderMethodBase> singleFinderMethods = [];
  List<IterableFinderMethod> iterableFinderMethods = [];
  covariant List<ListFinderMethodBase> listFinderMethods = [];
  List<MouseFinderMethod> mouseFinderMethods = [];
  List<UnannotatedMethod> unannotatedMethods = [];

  List<InvalidMethodException> badMethods = [];
  List<OverSupportedMethod> oversupportedMethods = [];
  List<String> unsupportedMethods = [];

  CollectorVisitor(this._parentClass);

  /// Write constructor-based contents into string buffer.
  void writeToConstructorBuffer(
      StringBuffer constructorBuffer, String className, String defaultTag) {
    if (defaultTag != null) {
      constructorBuffer.write('static String get tagName => $defaultTag;');
    } else {
      constructorBuffer.write("static String get tagName => throw '\"tagName\" "
          "is not defined by Page Object \"$className\". Requires @CheckTag "
          "annotation in order for \"tagName\" to be generated.';");
    }
    final addToConstructor =
        (method) => constructorBuffer.writeln(method.generate(className));
    getters.forEach(addToConstructor);
    setters.forEach(addToConstructor);
    unannotatedMethods.forEach(addToConstructor);
  }

  /// Write mixin-based contents into string buffer.
  void writeToMixinBuffer(StringBuffer mixinBuffer, String className) {
    final addToMixin =
        (method) => mixinBuffer.writeln(method.generate(className));
    singleFinderMethods.forEach(addToMixin);
    iterableFinderMethods.forEach(addToMixin);
    listFinderMethods.forEach(addToMixin);
    mouseFinderMethods.forEach(addToMixin);
  }

  /// Users occasionally accidentally use fields instead of getters. We throw
  /// errors during code generation to avoid confusion.
  @override
  void visitFieldDeclaration(FieldDeclaration node) {
    final matching = node.metadata.where(isPageloaderAnnotation);
    if (matching.isNotEmpty) {
      badMethods.add(InvalidMethodException(
          node.toSource(),
          'Field declarations should never have PageLoader annotations. '
          '(Did you forget "get" on a PageLoader getter?)'));
    }
  }

  /// For each method, we map the method to some type of method we support.
  ///
  /// If we cannot identify a supported type, or if method is supported but
  /// invalid (e.g. multiple [Finder]s) we collect it as an error.
  @override
  void visitMethodDeclaration(MethodDeclaration node) {
    if (node.parent == _parentClass) {
      final collected = <String>[];
      final pageloaderAnnotations =
          node.metadata.where(isPageloaderAnnotation).toList();
      try {
        if (pageloaderAnnotations.isNotEmpty) {
          collectAnnotatedMethods(node, collected, pageloaderAnnotations);
        } else {
          collectUnannotatedMethods(node, collected, pageloaderAnnotations);
        }
      } on InvalidMethodException catch (ime) {
        badMethods.add(ime);
      }

      // If we find PL annotations we should always generate exactly one method.
      if (collected.isEmpty && pageloaderAnnotations.isNotEmpty) {
        unsupportedMethods.add(node.toSource());
      } else if (collected.length > 1) {
        oversupportedMethods
            .add(OverSupportedMethod(node.toSource(), collected));
      }
    }
  }

  /// Collects information on annotated methods.
  void collectAnnotatedMethods(MethodDeclaration node, List<String> collected,
      List<Annotation> pageloaderAnnotations) {
    handleMouseFinderGetters(node, collected);
    handleSingleFinderGetters(node, collected, pageloaderAnnotations);
    handleIterableFinderGetters(node, collected, pageloaderAnnotations);
    handleListGetters(node, collected);
  }

  void handleMouseFinderGetters(
      MethodDeclaration node, List<String> collected) {
    final methodInfo = collectCoreMethodInformation(node);
    final mouseFinderGetter = collectMouseFinderGetter(methodInfo);
    if (mouseFinderGetter.isPresent) {
      collected.add('mouse finder');
      mouseFinderMethods.add(mouseFinderGetter.value);
    }
  }

  void handleSingleFinderGetters(MethodDeclaration node, List<String> collected,
      List<Annotation> pageloaderAnnotations) {
    final singleFinderGetter =
        collectSingleFinderGetter(node, pageloaderAnnotations);
    if (singleFinderGetter.isPresent) {
      collected.add('single finder');
      singleFinderMethods.add(singleFinderGetter.value);
    }
  }

  void handleIterableFinderGetters(MethodDeclaration node,
      List<String> collected, List<Annotation> pageloaderAnnotations) {
    final iterableFinderGetter =
        collectIterableFinderGetter(node, pageloaderAnnotations);
    if (iterableFinderGetter.isPresent) {
      collected.add('iterable finder');
      iterableFinderMethods.add(iterableFinderGetter.value);
    }
  }

  void handleListGetters(MethodDeclaration node, List<String> collected) {
    final methodInfo = collectCoreMethodInformation(node);
    final listGetter = collectListFinderGetter(methodInfo, node);
    if (listGetter.isPresent) {
      collected.add('list iterable finder');
      listFinderMethods.add(listGetter.value);
    }
  }

  /// Collects information on unannotated methods.
  void collectUnannotatedMethods(MethodDeclaration node, List<String> collected,
      List<Annotation> pageloaderAnnotations) {
    final unannotatedMethod = collectUnannotatedMethod(node);
    if (unannotatedMethod.isPresent) {
      collected.add('unannotated');
      unannotatedMethods.add(unannotatedMethod.value);
    }

    final unannotatedGetter = collectUnannotatedGetter(node);
    if (unannotatedGetter.isPresent) {
      collected.add('unannotated getter');
      getters.add(unannotatedGetter.value);
    }

    final setter = collectUnannotatedSetter(node);
    if (setter.isPresent) {
      collected.add('unannotated setter');
      setters.add(setter.value);
    }
  }
}
