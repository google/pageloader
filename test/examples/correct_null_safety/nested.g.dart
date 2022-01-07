// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$Nested on Nested {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInNested() {
    return {};
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInNested() {
    return {};
  }

  dynamic testCreatorInvokeMethodInNested(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'findersElement') {
      return findersElement;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInNested(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var findersElementElement = this.findersElement as dynamic;
      var findersElementIndex =
          internalIds.indexOf(findersElementElement.$__root__.id as String);
      if (findersElementIndex >= 0 && findersElementIndex < closestIndex) {
        closestIndex = findersElementIndex;
        closestValue = (ids) =>
            'findersElement.${findersElementElement.findChain(ids, action)}'
                .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  Finders get findersElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Nested', 'findersElement');
    }
    final element = $__root__.createElement(ByCss('some-nested-class'), [], []);
    final returnMe = Finders.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Nested', 'findersElement');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$NestedUsingMixin on NestedUsingMixin {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInNestedUsingMixin() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInNestedUsingMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInNestedUsingMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInNestedUsingMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    return {closestIndex: closestValue};
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$NestedMixin on NestedMixin {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInNestedMixin() {
    return {};
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInNestedMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInNestedMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'findersElement') {
      return findersElement;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInNestedMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var findersElementElement = this.findersElement as dynamic;
      var findersElementIndex =
          internalIds.indexOf(findersElementElement.$__root__.id as String);
      if (findersElementIndex >= 0 && findersElementIndex < closestIndex) {
        closestIndex = findersElementIndex;
        closestValue = (ids) =>
            'findersElement.${findersElementElement.findChain(ids, action)}'
                .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  FindersUsingMixin get findersElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('NestedMixin', 'findersElement');
    }
    final element = $__root__.createElement(ByCss('some-nested-class'), [], []);
    final returnMe = FindersUsingMixin.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('NestedMixin', 'findersElement');
    }
    return returnMe;
  }
}
