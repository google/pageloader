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

import 'dart:async';

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../api/page_object_annotation.dart';
import 'class_checks_collector.dart' show generateClassChecks;
import 'collector_visitor.dart';
import 'methods/core.dart' as core;

/// Page object generator. Generates the source code for a given page object.
class PageObjectGenerator extends GeneratorForAnnotation<PageObject> {
  const PageObjectGenerator();

  /// Generates a page object, as source String, for a class annotated with
  /// '@PageObject()'.
  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    final library = element.library;
    // ignore: deprecated_member_use
    final resolvedLibrary =
        await library.session.getResolvedLibraryByElement(library);
    final annotatedNode = resolvedLibrary.getElementDeclaration(element).node;
    final poAnnotation = getPageObjectAnnotation(annotation);
    if (annotatedNode is ClassOrMixinDeclaration) {
      try {
        final ignore =
            '// ignore_for_file: private_collision_in_mixin_application\n'
            '// ignore_for_file: unused_field, non_constant_identifier_names\n'
            '// ignore_for_file: overridden_fields, annotate_overrides\n'
            '// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package\n';
        return '$ignore${_generateClass(annotatedNode, poAnnotation)}';
      } catch (e, stackTrace) {
        print('Failure generating class for $library! '
            '\n $e \n $stackTrace');
        rethrow;
      }
    } else {
      throw '@PageObject() can only be applied to classes, '
          'not type: ${annotatedNode.runtimeType}';
    }
  }

  String _generateClass(
      ClassOrMixinDeclaration declaration, PageObject poAnnotation) {
    final collectorVisitor = CollectorVisitor(declaration);
    declaration.visitChildren(collectorVisitor);

    _doErrorHandling(collectorVisitor);

    final constructorBuffer = StringBuffer();
    final mixinBuffer = StringBuffer();
    final className = declaration.name.toString();
    final generics = _generateTypeParameters(declaration);
    final genericsArgs = _generateTypeArguments(declaration);
    final signature = '$className$generics';
    final signatureArgs = '$className$genericsArgs';

    // Run check to make sure PO is not extending another PO.
    // Only mixins are allowed.
    if (poExtendsAnotherPo(declaration.declaredElement)) {
      throw Exception('******************\n\n'
          'Errors detected during code generation:\n\n'
          "PageObject class '${declaration.name.name}' is extending another "
          'PageObject class. PageObjects may not extend other PageObjects; '
          'Use mixins instead.'
          '\n\n******************');
    }

    // Run check to make sure if PO has any factory constructor, it must has
    // a default constructor as well.
    if (hasFactoryConstructor(declaration.declaredElement) &&
        !hasDefaultConstructor(declaration.declaredElement)) {
      throw Exception('******************\n\n'
          'Errors detected during code generation:\n\n'
          "PageObject class '${declaration.name.name}' has a factory constructor"
          ', but there is no default constructor.'
          '\n\n******************');
    }

    // If PageObject has constructor, define constructor class with root
    // and start constructor.
    if (hasPoConstructors(declaration.declaredElement)) {
      final withs = getMixins(declaration.declaredElement, signatureArgs);
      constructorBuffer.write('''
      class \$$signature extends $signatureArgs
          with ${withs.map((w) => '\$\$$w').join(', ')} {
        PageLoaderElement ${core.root};
      \$$className.create(PageLoaderElement currentContext) : ''');

      // Default tag associated with this PO if @CheckTag or @EnsureTag is
      // present.
      String defaultTag;

      // Generate the 'create' constructor.

      // If @EnsureTag used, we add finder to constructor. Otherwise
      // set current root as the passed 'currentContext'.
      final ensureTag = core.getEnsureTag(declaration);
      if (ensureTag.isPresent) {
        constructorBuffer.write('${core.root} = currentContext.createElement'
            '(${core.generateAnnotationDeclaration(ensureTag.value)}, '
            '[], []) { \n');
      } else {
        constructorBuffer.write('${core.root} = currentContext { \n');
      }
      // Add class checkers and close 'create' constructor.
      constructorBuffer.write('${core.root}.addCheckers'
          '([${generateClassChecks(declaration)}]);\n}');

      // Generate the 'lookup' factory constructor.

      constructorBuffer
          .write('factory \$$className.lookup(PageLoaderSource source) => ');
      final checkTag = core.getCheckTag(declaration);

      // If '@CheckTag' or '@EnsureTag' exists on this PageObject,
      // generate the 'lookup' constructor. If neither exists, insert
      // throw error clause.
      if (ensureTag.isPresent || checkTag.isPresent) {
        defaultTag = ensureTag.isPresent
            ? getAnnotationSingleArg(ensureTag.value)
            : getAnnotationSingleArg(checkTag.value);
        constructorBuffer
            .write('\$$className.create(source.byTag($defaultTag));');
      } else {
        constructorBuffer.write('''throw  "'lookup' constructor for class "
        "$className is not generated and can only be used on Page Object "
        "classes that have @CheckTag annotation.";
        ''');
      }

      // Constructor class gets the methods/getters/setters.
      collectorVisitor.writeToConstructorBuffer(
          constructorBuffer, className, defaultTag, withs, poAnnotation);

      constructorBuffer.writeln('String toStringDeep() => '
          ''''$className\\n\\n\${${core.root}.toStringDeep()}';''');

      // Close constructor class
      constructorBuffer.writeln('}');
    }

    // Define annotation-generated mixin class.
    mixinBuffer.write('''
      mixin \$\$$signature on $signatureArgs {
        PageLoaderElement ${core.root};
        PageLoaderMouse ${core.mouse};
        PageLoaderPointer ${core.pointer};
    ''');

    // Add generated root accessor to be used in internal code.
    mixinBuffer.write('PageLoaderElement get \$root => ${core.root};\n');

    // Write out the generated code and insert into the mixin class.
    collectorVisitor.writeToMixinBuffer(mixinBuffer, className);

    // Close mixin class
    mixinBuffer.write('}');

    // Return generated code
    return '${constructorBuffer.toString()}\n${mixinBuffer.toString()}';
  }

  // Given <T extends Blah, R extends Foo, Z>, returns this exactly.
  String _generateTypeParameters(ClassOrMixinDeclaration declaration) =>
      declaration.typeParameters != null
          ? declaration.typeParameters.toSource()
          : '';

  // Given <T extends Blah, R extends Foo, Z>, returns <T, R, Z>.
  String _generateTypeArguments(ClassOrMixinDeclaration declaration) {
    if (declaration.typeParameters == null) {
      return '';
    }
    final typeArguments =
        declaration.typeParameters.typeParameters.map((tp) => tp.name.name);
    return '<${typeArguments.join(', ')}>';
  }

  void _doErrorHandling(CollectorVisitor visitor) {
    final errors = <String>[];
    visitor.badMethods.forEach((m) => errors
        .add('Invalid method, reason: ${m.message}\n\n${m.methodSource}'));
    visitor.unsupportedMethods
        .forEach((m) => errors.add('Unsupported method, \n\n$m'));
    visitor.oversupportedMethods.forEach((m) => errors
        .add('Method matched multiple page object method generation schemes '
            '-- this is a Pageloader error, file a bug! \n\nSchemes:\n\n'
            '${m.matchingMethodTypes.join("\n")} \n\n${m.methodSource}'));
    if (visitor.badMethods.isNotEmpty ||
        visitor.oversupportedMethods.isNotEmpty ||
        visitor.unsupportedMethods.isNotEmpty) {
      throw Exception('******************\n\n'
          'Errors detected during code generation:\n\n'
          '${errors.join('\n\n-------------------\n')}'
          '\n\n******************');
    }
  }
}

PageObject getPageObjectAnnotation(ConstantReader annotation) {
  final code = annotation.peek('code');
  return PageObject(
      code: code?.mapValue
          ?.map((k, v) => MapEntry(k.toStringValue(), v.toStringValue())));
}

/// Generates the with clause for the generated constructor code.
List<String> getMixins(ClassElement mainPo, String mainSignature) {
  final withs = <String>[];
  final supertype = mainPo.supertype;
  final mixins = mainPo.mixins;

  // If the direct extension is not 'Object' and is a @PageObject annotated
  // class, we add its mixin-component to the list.
  if (supertype != null && !supertype.isDartCoreObject) {
    if (isPageObject(supertype.element)) {
      withs.add(supertype.displayName);
    }
  }

  // For each PageObject mixin added to a PageObject, add to its generated code.
  // Example:
  //   abstract class MyPo extends Object with A_POMixin, B_POMixin
  // Generated:
  //   class $MyPo extends MyPo with $$A_POMixin, $$B_POMixin, $$MyPo
  for (final mixin in mixins) {
    final name = mixin.displayName;
    if (isPageObject(mixin.element)) {
      withs.add(name);
    }
  }

  // Main mixin ($$MyPO from above example) must be added last to ensure it
  // takes highest priority.
  withs.add(mainSignature);
  return withs;
}

/// Gets the single argument within an [Annotation].
///
/// Assumes that the annotation has exactly one argument.
String getAnnotationSingleArg(Annotation annotation) =>
    annotation.arguments.arguments.single.toSource();

/// Checks if the PageObject has the standard constructors:
///   abstract class MyPO {
///     MyPO();
///     factory MyPo.create(...) = ...;
///   }
bool hasPoConstructors(ClassElement element) {
  return hasFactoryConstructor(element) && hasDefaultConstructor(element);
}

/// Checks if the PageObject has the default constructor:
///   abstract class MyPO {
///     MyPO();
///   }
bool hasDefaultConstructor(ClassElement element) {
  final constructors = element.constructors;
  if (constructors.isNotEmpty) {
    return constructors.any((c) => c.isDefaultConstructor);
  }
  return false;
}

/// Checks if the PageObject has factory constructor:
///   abstract class MyPO {
///     factory MyPo.create(...) = ...;
///   }
bool hasFactoryConstructor(ClassElement element) {
  final constructors = element.constructors;
  if (constructors.isNotEmpty) {
    return constructors.any((c) =>
        c.isFactory &&
        (c.displayName == 'create' || c.displayName == 'lookup'));
  }
  return false;
}

/// Checks if the PO class extends another PO.
bool poExtendsAnotherPo(ClassElement classElement) {
  final supertype = classElement.supertype;
  if (supertype == null) {
    return false;
  }
  return isPageObject(supertype.element);
}

/// Checks if the current class has @PageObject annotation.
bool isPageObject(ClassElement classElement) {
  for (final annotation in classElement.metadata) {
    final element = annotation.element;
    if (element is ConstructorElement &&
        element.enclosingElement.displayName == 'PageObject') {
      return true;
    }
  }
  return false;
}
