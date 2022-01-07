// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'test_creator_getters.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageObjectHasGettersAndActions on PageObjectHasGettersAndActions {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageObjectHasGettersAndActions() {
    return {
      'testContext': 'String',
      'name': 'String',
    };
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageObjectHasGettersAndActions() {
    return {
      'clear': [
        {'name': 'text', 'kind': 'required', 'type': 'String'},
      ],
    };
  }

  dynamic testCreatorInvokeMethodInPageObjectHasGettersAndActions(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
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
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ >
      findChainInPageObjectHasGettersAndActions(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
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
          'PageObjectHasGettersAndActions', 'input');
    }
    final element = $__root__.createElement(ByTagName('input'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageObjectHasGettersAndActions', 'input');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageObjectHasGettersThatUseDifferentReturnTypes
    on PageObjectHasGettersThatUseDifferentReturnTypes {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String>
      testCreatorGettersInPageObjectHasGettersThatUseDifferentReturnTypes() {
    return {
      'testContext': 'String',
      'exists': 'bool',
      'size': 'int',
    };
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageObjectHasGettersThatUseDifferentReturnTypes() {
    return {};
  }

  dynamic
      testCreatorInvokeMethodInPageObjectHasGettersThatUseDifferentReturnTypes(
          String methodName, List<dynamic> positionalArguments,
          [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'testContext') {
      return testContext;
    }
    if (methodName == 'exists') {
      return exists;
    }
    if (methodName == 'size') {
      return size;
    }
    if (methodName == 'input') {
      return input;
    }
    if (methodName == 'inputs') {
      return inputs;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ >
      findChainInPageObjectHasGettersThatUseDifferentReturnTypes(
          List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
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
    final inputsElements = this.inputs;
    for (var elementIter = 0;
        elementIter < inputsElements.length;
        elementIter++) {
      try {
        var inputsIndex = internalIds.indexOf(inputsElements[elementIter].id);
        if (inputsIndex >= 0 && inputsIndex < closestIndex) {
          closestIndex = inputsIndex;
          closestValue = (_) =>
              'inputs[$elementIter].${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
        }
      } catch (_) {
        // Ignored.
      }
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get input {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasGettersThatUseDifferentReturnTypes', 'input');
    }
    final element = $__root__.createElement(ByTagName('input'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasGettersThatUseDifferentReturnTypes', 'input');
    }
    return returnMe;
  }

  PageObjectList<PageLoaderElement> get inputs {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasGettersThatUseDifferentReturnTypes', 'inputs');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByTagName('input2'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasGettersThatUseDifferentReturnTypes', 'inputs');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageObjectHasNoGetters on PageObjectHasNoGetters {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageObjectHasNoGetters() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageObjectHasNoGetters() {
    return {
      'clear': [
        {'name': 'text', 'kind': 'required', 'type': 'String'},
      ],
    };
  }

  dynamic testCreatorInvokeMethodInPageObjectHasNoGetters(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'inputs') {
      return inputs;
    }
    if (methodName == 'clear') {
      return Function.apply(clear, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ >
      findChainInPageObjectHasNoGetters(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
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
      __listener.startPageObjectMethod('PageObjectHasNoGetters', 'inputs');
    }
    final element = $__root__.createElement(ByTagName('input'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageObjectHasNoGetters', 'inputs');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageObjectWithMixin on PageObjectWithMixin {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageObjectWithMixin() {
    return {
      'testContext': 'String',
      'name': 'String',
    };
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageObjectWithMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageObjectWithMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'testContext') {
      return testContext;
    }
    if (methodName == 'name') {
      return name;
    }
    if (methodName == 'input') {
      return input;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInPageObjectWithMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
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
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageObjectMixin() {
    return {
      'tabContext': 'String',
      'tabName': 'String',
    };
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageObjectMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageObjectMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'tabContext') {
      return tabContext;
    }
    if (methodName == 'tabName') {
      return tabName;
    }
    if (methodName == 'tab') {
      return tab;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInPageObjectMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
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
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageObjectWithOverridingMixins() {
    return {
      'tabContext': 'String',
    };
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageObjectWithOverridingMixins() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageObjectWithOverridingMixins(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'tabContext') {
      return tabContext;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ >
      findChainInPageObjectWithOverridingMixins(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    return {closestIndex: closestValue};
  }
}
