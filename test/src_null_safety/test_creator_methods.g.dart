// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_creator_methods.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageObjectHasPropertiesAndMethods on PageObjectHasPropertiesAndMethods {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageObjectHasPropertiesAndMethods() {
    return {
      'testContext': 'String',
      'name': 'String',
    };
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInPageObjectHasPropertiesAndMethods() {
    return {
      'clear': [
        {'name': 'text', 'kind': 'required', 'type': 'String'},
      ],
      'getLength': [],
    };
  }

  dynamic testCreatorInvokeMethodInPageObjectHasPropertiesAndMethods(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'testContext') {
      return testContext;
    }
    if (methodName == 'name') {
      return name;
    }
    if (methodName == 'input') {
      return input;
    }
    if (methodName == 'clear') {
      return Function.apply(clear, positionalArguments, namedArguments);
    }
    if (methodName == 'getLength') {
      return Function.apply(getLength, positionalArguments, namedArguments);
    }
    if (methodName == 'badClear') {
      return Function.apply(badClear, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?>
      findChainInPageObjectHasPropertiesAndMethods(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var inputIndex = internalIds.indexOf(this.input.id);
      if (inputIndex >= 0 && inputIndex < closestIndex) {
        closestIndex = inputIndex;
        closestValue = (_) =>
            'input.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get input {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasPropertiesAndMethods', 'input');
    }
    final element = $__root__.createElement(ByTagName('input'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasPropertiesAndMethods', 'input');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageObjectHasMethodsWithDifferentParameters
    on PageObjectHasMethodsWithDifferentParameters {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String>
      testCreatorGettersInPageObjectHasMethodsWithDifferentParameters() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInPageObjectHasMethodsWithDifferentParameters() {
    return {
      'click': [],
      'type': [
        {'name': 'index', 'kind': 'required', 'type': 'int'},
        {'name': 'text', 'kind': 'named', 'type': 'String?', 'default': null},
      ],
      'cut': [
        {'name': 'start', 'kind': 'required', 'type': 'int'},
        {'name': 'end', 'kind': 'positional', 'type': 'int', 'default': "12"},
      ],
      'defaultString': [
        {
          'name': 'end',
          'kind': 'positional',
          'type': 'String',
          'default': "'23'"
        },
      ],
      'defaultBool': [
        {'name': 'end', 'kind': 'named', 'type': 'bool', 'default': "true"},
      ],
      'varm': [
        {'name': 'x', 'kind': 'required', 'type': 'var'},
      ],
    };
  }

  dynamic testCreatorInvokeMethodInPageObjectHasMethodsWithDifferentParameters(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'click') {
      return Function.apply(click, positionalArguments, namedArguments);
    }
    if (methodName == 'type') {
      return Function.apply(type, positionalArguments, namedArguments);
    }
    if (methodName == 'cut') {
      return Function.apply(cut, positionalArguments, namedArguments);
    }
    if (methodName == 'defaultString') {
      return Function.apply(defaultString, positionalArguments, namedArguments);
    }
    if (methodName == 'defaultBool') {
      return Function.apply(defaultBool, positionalArguments, namedArguments);
    }
    if (methodName == 'varm') {
      return Function.apply(varm, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?>
      findChainInPageObjectHasMethodsWithDifferentParameters(
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

mixin $$PageObjectHasNoMethods on PageObjectHasNoMethods {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageObjectHasNoMethods() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInPageObjectHasNoMethods() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageObjectHasNoMethods(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'inputs') {
      return inputs;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInPageObjectHasNoMethods(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var inputsIndex = internalIds.indexOf(this.inputs.id);
      if (inputsIndex >= 0 && inputsIndex < closestIndex) {
        closestIndex = inputsIndex;
        closestValue = (_) =>
            'inputs.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get inputs {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageObjectHasNoMethods', 'inputs');
    }
    final element = $__root__.createElement(ByTagName('input'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageObjectHasNoMethods', 'inputs');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageObjectWithMixin on PageObjectWithMixin {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageObjectWithMixin() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInPageObjectWithMixin() {
    return {
      'cut': [
        {'name': 'start', 'kind': 'required', 'type': 'int'},
        {'name': 'end', 'kind': 'positional', 'type': 'int', 'default': "12"},
      ],
    };
  }

  dynamic testCreatorInvokeMethodInPageObjectWithMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'input') {
      return input;
    }
    if (methodName == 'cut') {
      return Function.apply(cut, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInPageObjectWithMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var inputIndex = internalIds.indexOf(this.input.id);
      if (inputIndex >= 0 && inputIndex < closestIndex) {
        closestIndex = inputIndex;
        closestValue = (_) =>
            'input.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get input {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageObjectWithMixin', 'input');
    }
    final element = $__root__.createElement(ByTagName('input'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageObjectWithMixin', 'input');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageObjectMixin on PageObjectMixin {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageObjectMixin() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInPageObjectMixin() {
    return {
      'click': [],
    };
  }

  dynamic testCreatorInvokeMethodInPageObjectMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'tab') {
      return tab;
    }
    if (methodName == 'click') {
      return Function.apply(click, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInPageObjectMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var tabIndex = internalIds.indexOf(this.tab.id);
      if (tabIndex >= 0 && tabIndex < closestIndex) {
        closestIndex = tabIndex;
        closestValue = (_) =>
            'tab.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get tab {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageObjectMixin', 'tab');
    }
    final element = $__root__.createElement(ByTagName('tab'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageObjectMixin', 'tab');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageObjectWithOverridingMixins on PageObjectWithOverridingMixins {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageObjectWithOverridingMixins() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInPageObjectWithOverridingMixins() {
    return {
      'cut': [
        {'name': 'start', 'kind': 'required', 'type': 'int'},
        {'name': 'end', 'kind': 'positional', 'type': 'int', 'default': "12"},
      ],
      'click': [],
      'varm': [
        {'name': 'x', 'kind': 'required', 'type': 'var'},
      ],
    };
  }

  dynamic testCreatorInvokeMethodInPageObjectWithOverridingMixins(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'cut') {
      return Function.apply(cut, positionalArguments, namedArguments);
    }
    if (methodName == 'click') {
      return Function.apply(click, positionalArguments, namedArguments);
    }
    if (methodName == 'varm') {
      return Function.apply(varm, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?>
      findChainInPageObjectWithOverridingMixins(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    return {closestIndex: closestValue};
  }
}
