// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multiple_in_file.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$A on A {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInA() {
    return {};
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInA() {
    return {};
  }

  dynamic testCreatorInvokeMethodInA(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'b') {
      return b;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInA(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var bElement = this.b as dynamic;
      var bIndex = internalIds.indexOf(bElement.$__root__.id as String);
      if (bIndex >= 0 && bIndex < closestIndex) {
        closestIndex = bIndex;
        closestValue = (ids) => 'b.${bElement.findChain(ids, action)}'
            .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  B get b {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('A', 'b');
    }
    final element = $__root__.createElement(ByCss('b-in-a-class'), [], []);
    final returnMe = B.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('A', 'b');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$B on B {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInB() {
    return {};
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInB() {
    return {};
  }

  dynamic testCreatorInvokeMethodInB(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'base') {
      return base;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInB(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var baseIndex = internalIds.indexOf(this.base.id);
      if (baseIndex >= 0 && baseIndex < closestIndex) {
        closestIndex = baseIndex;
        closestValue = (_) =>
            'base.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get base {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('B', 'base');
    }
    final element = $__root__.createElement(ByCss('base-class'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('B', 'base');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$C on C {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInC() {
    return {};
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInC() {
    return {};
  }

  dynamic testCreatorInvokeMethodInC(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'b') {
      return b;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInC(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var bElement = this.b as dynamic;
      var bIndex = internalIds.indexOf(bElement.$__root__.id as String);
      if (bIndex >= 0 && bIndex < closestIndex) {
        closestIndex = bIndex;
        closestValue = (ids) => 'b.${bElement.findChain(ids, action)}'
            .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  B get b {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('C', 'b');
    }
    final element = $__root__.createElement(ByCss('b-in-c-class'), [], []);
    final returnMe = B.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('C', 'b');
    }
    return returnMe;
  }
}
