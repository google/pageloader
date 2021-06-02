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

import 'dart:convert';

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:pageloader/src/api/page_object_annotation.dart';

import 'methods/core.dart';
import 'methods/core_method_information.dart';
import 'methods/getter.dart';
import 'methods/invalid_method_exception.dart';
import 'methods/iterable_finder_method.dart';
import 'methods/list_finder_method.dart';
import 'methods/mouse_finder_method.dart';
import 'methods/oversupported_method.dart';
import 'methods/pointer_finder_method.dart';
import 'methods/setter.dart';
import 'methods/single_finder_method.dart';
import 'methods/unannotated_method.dart';

/// Collects relevant information from a page object's source for use
/// in generation.
class CollectorVisitor extends GeneralizingAstVisitor<void> {
  final AstNode _parentClass;

  List<Getter> getters = [];
  List<Setter> setters = [];
  covariant List<SingleFinderMethodBase> singleFinderMethods = [];
  List<IterableFinderMethod> iterableFinderMethods = [];
  covariant List<ListFinderMethodBase> listFinderMethods = [];
  List<MouseFinderMethod> mouseFinderMethods = [];
  List<PointerFinderMethod> pointerFinderMethods = [];
  List<UnannotatedMethod> unannotatedMethods = [];

  List<InvalidMethodException> badMethods = [];
  List<OverSupportedMethod> oversupportedMethods = [];
  List<String> unsupportedMethods = [];

  CollectorVisitor(this._parentClass);

  /// Write constructor-based contents into string buffer.
  void writeToConstructorBuffer(
      StringBuffer constructorBuffer,
      String className,
      String? defaultTag,
      List<String> withs,
      PageObject poAnnotation) {
    writeTestCreatorGettersInConstructor(constructorBuffer, withs);
    writeTestCreatorMethodsInConstructor(constructorBuffer, withs);
    writeTestCreatorInvokeMethodInConstructor(constructorBuffer, withs);
    writeFindChainInConstructor(
        constructorBuffer, className, withs, poAnnotation);
    if (defaultTag != null) {
      constructorBuffer.write('static const String tagName = $defaultTag;');
    } else {
      constructorBuffer.write("static String get tagName => throw '\"tagName\" "
          'is not defined by Page Object \"$className\". Requires @CheckTag '
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
    writeTestCreatorGettersInMixin(mixinBuffer, className);
    writeTestCreatorMethodsInMixin(mixinBuffer, className);
    writeTestCreatorInvokeMethodInMixin(mixinBuffer, className);
    writeFindChainInMixin(mixinBuffer, className);
    final addToMixin =
        (method) => mixinBuffer.writeln(method.generate(className));
    singleFinderMethods.forEach(addToMixin);
    iterableFinderMethods.forEach(addToMixin);
    listFinderMethods.forEach(addToMixin);
    mouseFinderMethods.forEach(addToMixin);
    pointerFinderMethods.forEach(addToMixin);
  }

  void writeFindChainInConstructor(StringBuffer buffer, String className,
      List<String> withs, PageObject poAnnotation) {
    var codeCreation = 'final code = <String, String>{}';
    if (poAnnotation.code != null) {
      codeCreation = 'final code = ${json.encode(poAnnotation.code)}';
    }

    // When calling `findChain` from javascript, `rawInternalIds` will not be
    // interpreted as a list of String, but a list of dynamics.
    buffer.writeln('''
        String findChain(List<dynamic> rawInternalIds,
            [String action = 'default']) {
          final internalIds = rawInternalIds.cast<String>();
          $codeCreation;

          final actionCode = code[action];
          if (actionCode != null) {
            return actionCode;
          }

          final thisElementIndex = internalIds.indexOf(\$__root__.id);
          final rootNotFound = thisElementIndex < 0;

          if (thisElementIndex >= 0) {
            internalIds.removeRange(thisElementIndex, internalIds.length);
          }

          var closestIndex = internalIds.length;
          String Function(List<String>) closestValue;''');

    buffer.writeln('MapEntry<int, String Function(List<String>)> chain;');

    for (var w in withs.reversed) {
      final genericIndex = w.indexOf('<');
      final withName = genericIndex >= 0 ? w.substring(0, genericIndex) : w;
      buffer.writeln('''
          chain = findChainIn$withName(internalIds, action).entries.first;
          if (chain.key < closestIndex) {
            closestIndex = chain.key;
            closestValue = chain.value;
          }''');
    }

    buffer.writeln('''
          if (closestIndex < internalIds.length) {
            final value = closestValue(internalIds);
            return code[value] ?? value;
          }

          return rootNotFound ? null : PageObject.defaultCode[action] ??
              PageObject.defaultCode['default'];
        }''');
  }

  void writeFindChainInMixin(StringBuffer buffer, String className) {
    buffer.writeln('''
        Map<int, String Function(List<String>)> findChainIn$className(
            List<String> internalIds, [String action = 'default']) {

          var closestIndex = internalIds.length;
          String Function(List<String>) closestValue;''');

    // The order is based on preferred types of objects:
    //    single > list
    //    PageObject > PageLoaderElement

    for (var method in getters) {
      if (method.produceFindChain) {
        buffer.writeln(method.generateFindChain());
      }
    }

    for (var method in singleFinderMethods) {
      if (method.pageObjectType != 'PageLoaderElement') {
        final methodMixin = method as SingleFinderMethodMixin;
        if (methodMixin.produceFindChain) {
          buffer.writeln(methodMixin.generateFindChain());
        }
      }
    }

    for (var method in listFinderMethods) {
      if (method.listTypeArgument != 'PageLoaderElement') {
        final methodMixin = method as ListFinderMethodMixin;
        if (methodMixin.produceFindChain) {
          buffer.writeln(methodMixin.generateFindChain());
        }
      }
    }

    for (var method in singleFinderMethods) {
      if (method.pageObjectType == 'PageLoaderElement') {
        final methodMixin = method as SingleFinderMethodMixin;
        if (methodMixin.produceFindChain) {
          buffer.writeln(methodMixin.generateFindChain());
        }
      }
    }

    for (var method in listFinderMethods) {
      if (method.listTypeArgument == 'PageLoaderElement') {
        final methodMixin = method as ListFinderMethodMixin;
        if (methodMixin.produceFindChain) {
          buffer.writeln(methodMixin.generateFindChain());
        }
      }
    }

    buffer.writeln('''
          return {closestIndex: closestValue};
        }''');
  }

  /// Writes testCreatorGetters for test creator in constructor.
  ///
  /// The method collects entries from those from mixins and encodes it as JSON.
  void writeTestCreatorGettersInConstructor(
      StringBuffer buffer, List<String> withs) {
    buffer.writeln('''
        String testCreatorGetters() {
          final getters = <String, String>{};''');

    for (var w in withs) {
      final genericIndex = w.indexOf('<');
      final withName = genericIndex >= 0 ? w.substring(0, genericIndex) : w;
      buffer.writeln('''
          getters.addAll(testCreatorGettersIn$withName());''');
    }

    buffer.writeln('''
          return json.encode(getters);
        }''');
  }

  /// Writes testCreatorGetters for test creator in mixins.
  ///
  /// The method returns a map of user defined unannotated getters
  /// in the page object, methodName as key and returnType as value.
  /// Note that only getters returning values (like string, int, list) will be
  /// included.
  void writeTestCreatorGettersInMixin(StringBuffer buffer, String className) {
    buffer.writeln('''
      Map<String, String> testCreatorGettersIn$className() {
        return {''');

    for (final getter in getters) {
      if (getter.produceTestCreatorGetter) {
        buffer.writeln("'${getter.name}' : '${getter.returnType}',");
      }
    }

    buffer.writeln('''
        };
      }
    ''');
  }

  /// Writes testCreatorMethods for test creator in constructor.
  ///
  /// The method collects entries from those from mixins and encodes it as JSON.
  void writeTestCreatorMethodsInConstructor(
      StringBuffer buffer, List<String> withs) {
    buffer.writeln('''
        String testCreatorMethods() {
          final methods = <String, List<Map<String, String>>>{};''');

    for (var w in withs) {
      final genericIndex = w.indexOf('<');
      final withName = genericIndex >= 0 ? w.substring(0, genericIndex) : w;
      buffer.writeln('''
          methods.addAll(testCreatorMethodsIn$withName());''');
    }

    buffer.writeln('''
        return json.encode(methods);
      }''');
  }

  /// Writes testCreatorMethods for test creator in mixins.
  ///
  /// The method returns a map of user defined methods in the page object,
  /// with methodName as key and list of parameters as value.
  /// For each parameter, it's again a map, with three keys: name, kind and
  /// type. Value of kind can be 'type', 'required', 'named' and positional'.
  /// And value of type is like `int`, 'String' etc, except for type parameter,
  /// where no type is given.
  void writeTestCreatorMethodsInMixin(StringBuffer buffer, String className) {
    buffer.writeln('''
      Map<String, List<Map<String, String>>> testCreatorMethodsIn$className() {
        return {''');

    for (final method in unannotatedMethods) {
      if (method.produceTestCreatorMethod) {
        buffer.writeln("'${method.name}' : [");
        if (method.typeParameters!.isPresent) {
          for (final typeParameter
              in method.typeParameters!.value.typeParameters) {
            buffer.writeln('''{
               'name': '${typeParameter.name}',
               'kind': 'type'
             },''');
          }
        }
        for (final parameter in method.parameters!) {
          final declaration = (parameter is DefaultFormalParameter)
              ? parameter.parameter
              : parameter;
          final type =
              (declaration is SimpleFormalParameter && declaration.type != null)
                  ? declaration.type!.toSource()
                  : 'var';

          var defaultValue = (parameter is DefaultFormalParameter &&
                  parameter.defaultValue != null)
              ? parameter.defaultValue!.toSource()
              : null;

          if (defaultValue == 'null') {
            defaultValue = null;
          }

          if (defaultValue != null) {
            defaultValue = json.encode(defaultValue);
          }

          if (parameter.isRequired) {
            buffer.writeln('''{
                'name': '${parameter.declaredElement!.name}',
                'kind': 'required',
                'type': '$type'
               },''');
          } else if (parameter.isNamed) {
            buffer.writeln('''{
                'name': '${parameter.declaredElement!.name}',
                'kind': 'named',
                'type': '$type',
                'default': $defaultValue
               },''');
          } else if (parameter.isOptionalPositional) {
            buffer.writeln('''{
                'name': '${parameter.declaredElement!.name}',
                'kind': 'positional',
                'type': '$type',
                'default': $defaultValue
               },''');
          }

          // Do nothing about unexpected cases.
        }
        buffer.writeln('],');
      }
    }

    buffer.writeln('''
        };
      }
    ''');
  }

  /// Writes testCreatorInvokeMethod for test creator in constructor.
  ///
  /// The method exposes getter and methods and returns a [dynamic] type.
  /// Setter and method with generic type are not supported.
  void writeTestCreatorInvokeMethodInConstructor(
      StringBuffer buffer, List<String> withs) {
    buffer.writeln('''
        dynamic testCreatorInvokeMethod(
            String methodName,
            List<dynamic> positionalArguments,
            [Map<Symbol, dynamic> namedArguments]) {''');
    for (var w in withs.reversed) {
      final genericIndex = w.indexOf('<');
      final withName = genericIndex >= 0 ? w.substring(0, genericIndex) : w;
      buffer.writeln('''
          try {
            return testCreatorInvokeMethodIn$withName(
                methodName, positionalArguments, namedArguments);
          } catch (_) {}
      ''');
    }

    buffer.writeln('''
          throw 'METHOD NOT FOUND. This method'
                ' failed to be generated during test creator codegen.';
        }''');
  }

  void writeTestCreatorInvokeMethodInMixin(
      StringBuffer buffer, String className) {
    buffer.writeln('''
        dynamic testCreatorInvokeMethodIn$className(
            String methodName,
            List<dynamic> positionalArguments,
            [Map<Symbol, dynamic> namedArguments]) {''');
    _writeTestCreatorInvokeMethodContent(buffer);
    buffer.writeln('''
          throw 'METHOD NOT FOUND. This method'
                ' failed to be generated during test creator codegen.';
        }''');
  }

  void _writeTestCreatorInvokeMethodContent(StringBuffer buffer) {
    for (final getter in getters) {
      if (getter.produceTestCreatorGetter) {
        buffer.writeln('''
          if (methodName == '${getter.name}') {
            return ${getter.name};
          }''');
      }
    }

    for (final singleFinderMethod in singleFinderMethods) {
      if (!singleFinderMethod.name.startsWith('_')) {
        buffer.writeln('''
          if (methodName == '${singleFinderMethod.name}') {
            return ${singleFinderMethod.name};
          }''');
      }
    }

    for (final iterableFinderMethod in iterableFinderMethods) {
      if (!iterableFinderMethod.name!.startsWith('_')) {
        buffer.writeln('''
          if (methodName == '${iterableFinderMethod.name}') {
            return ${iterableFinderMethod.name};
          }''');
      }
    }

    for (final listFinderMethod in listFinderMethods) {
      if (!listFinderMethod.name.startsWith('_')) {
        buffer.writeln('''
          if (methodName == '${listFinderMethod.name}') {
            return ${listFinderMethod.name};
          }''');
      }
    }

    // TODO(liuming): Support generic type.
    for (final unannotatedMethod in unannotatedMethods) {
      if (!unannotatedMethod.name!.startsWith('_')) {
        buffer.writeln('''
            if (methodName == '${unannotatedMethod.name}') {
              return Function.apply(
                  ${unannotatedMethod.name}, positionalArguments, namedArguments);
            }''');
      }
    }
  }

  /// Users occasionally accidentally use fields instead of getters. We throw
  /// errors during code generation to avoid confusion.
  @override
  void visitFieldDeclaration(FieldDeclaration node) {
    final matching = node.metadata.where(isPageloaderAnnotation);
    if (matching.isNotEmpty) {
      badMethods.add(InvalidMethodException(
          node,
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
    handlePointerFinderGetters(node, collected);
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

  void handlePointerFinderGetters(
      MethodDeclaration node, List<String> collected) {
    final methodInfo = collectCoreMethodInformation(node);
    final pointerFinderGetter = collectPointerFinderGetter(methodInfo);
    if (pointerFinderGetter.isPresent) {
      collected.add('pointer finder');
      pointerFinderMethods.add(pointerFinderGetter.value);
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
