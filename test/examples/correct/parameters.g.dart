// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'parameters.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $Parameters extends Parameters with $$Parameters {
  PageLoaderElement $__root__;
  $Parameters.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $Parameters.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "Parameters is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInParameters());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInParameters());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInParameters(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String /*?*/ findChain(List<dynamic> rawInternalIds,
      [String action = 'default']) {
    final internalIds = rawInternalIds.cast<String>();
    final code = <String, String>{};

    final actionCode = code[action];
    if (actionCode != null) {
      return actionCode;
    }

    final thisElementIndex = internalIds.indexOf($__root__.id);
    final rootNotFound = thisElementIndex < 0;

    if (thisElementIndex >= 0) {
      internalIds.removeRange(thisElementIndex, internalIds.length);
    }

    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    MapEntry<int, String Function(List<String>) /*?*/ > chain;
    chain = findChainInParameters(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    if (closestIndex < internalIds.length) {
      final value = closestValue /*!*/ (internalIds);
      return code[value] ?? value;
    }

    return rootNotFound
        ? null
        : PageObject.defaultCode[action] ?? PageObject.defaultCode['default'];
  }

  static String get tagName =>
      throw '"tagName" is not defined by Page Object "Parameters". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String testOptionalPositionalParam(
      [String first = 'a', String second = 'b']) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'Parameters', 'testOptionalPositionalParam');
    }
    final returnMe = super.testOptionalPositionalParam(first, second);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'Parameters', 'testOptionalPositionalParam');
    }
    return returnMe;
  }

  String testMixedOptionalPositionalParam(String x,
      [String first = 'a', String second = 'b']) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'Parameters', 'testMixedOptionalPositionalParam');
    }
    final returnMe = super.testMixedOptionalPositionalParam(x, first, second);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'Parameters', 'testMixedOptionalPositionalParam');
    }
    return returnMe;
  }

  String testOptionalNamedParam({String first = 'a', String second = 'b'}) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Parameters', 'testOptionalNamedParam');
    }
    final returnMe = super.testOptionalNamedParam(first: first, second: second);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Parameters', 'testOptionalNamedParam');
    }
    return returnMe;
  }

  String testMixedOptionalNamedParam(String x,
      {String first = 'a', String second = 'b'}) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'Parameters', 'testMixedOptionalNamedParam');
    }
    final returnMe =
        super.testMixedOptionalNamedParam(x, first: first, second: second);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'Parameters', 'testMixedOptionalNamedParam');
    }
    return returnMe;
  }

  String toStringDeep() => 'Parameters\n\n${$__root__.toStringDeep()}';
}

mixin $$Parameters on Parameters {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInParameters() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInParameters() {
    return {};
  }

  dynamic testCreatorInvokeMethodInParameters(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'testOptionalPositionalParam') {
      return Function.apply(
          testOptionalPositionalParam, positionalArguments, namedArguments);
    }
    if (methodName == 'testMixedOptionalPositionalParam') {
      return Function.apply(testMixedOptionalPositionalParam,
          positionalArguments, namedArguments);
    }
    if (methodName == 'testOptionalNamedParam') {
      return Function.apply(
          testOptionalNamedParam, positionalArguments, namedArguments);
    }
    if (methodName == 'testMixedOptionalNamedParam') {
      return Function.apply(
          testMixedOptionalNamedParam, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInParameters(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    return {closestIndex: closestValue};
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $ParametersUsingMixin extends ParametersUsingMixin
    with $$ParametersMixin, $$ParametersUsingMixin {
  PageLoaderElement $__root__;
  $ParametersUsingMixin.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $ParametersUsingMixin.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "ParametersUsingMixin is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInParametersMixin());
    getters.addAll(testCreatorGettersInParametersUsingMixin());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInParametersMixin());
    methods.addAll(testCreatorMethodsInParametersUsingMixin());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInParametersUsingMixin(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    try {
      return testCreatorInvokeMethodInParametersMixin(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String /*?*/ findChain(List<dynamic> rawInternalIds,
      [String action = 'default']) {
    final internalIds = rawInternalIds.cast<String>();
    final code = <String, String>{};

    final actionCode = code[action];
    if (actionCode != null) {
      return actionCode;
    }

    final thisElementIndex = internalIds.indexOf($__root__.id);
    final rootNotFound = thisElementIndex < 0;

    if (thisElementIndex >= 0) {
      internalIds.removeRange(thisElementIndex, internalIds.length);
    }

    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    MapEntry<int, String Function(List<String>) /*?*/ > chain;
    chain = findChainInParametersUsingMixin(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    chain = findChainInParametersMixin(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    if (closestIndex < internalIds.length) {
      final value = closestValue /*!*/ (internalIds);
      return code[value] ?? value;
    }

    return rootNotFound
        ? null
        : PageObject.defaultCode[action] ?? PageObject.defaultCode['default'];
  }

  static String get tagName =>
      throw '"tagName" is not defined by Page Object "ParametersUsingMixin". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() =>
      'ParametersUsingMixin\n\n${$__root__.toStringDeep()}';
}

mixin $$ParametersUsingMixin on ParametersUsingMixin {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInParametersUsingMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInParametersUsingMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInParametersUsingMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ >
      findChainInParametersUsingMixin(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    return {closestIndex: closestValue};
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$ParametersMixin on ParametersMixin {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInParametersMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInParametersMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInParametersMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'testOptionalPositionalParam') {
      return Function.apply(
          testOptionalPositionalParam, positionalArguments, namedArguments);
    }
    if (methodName == 'testMixedOptionalPositionalParam') {
      return Function.apply(testMixedOptionalPositionalParam,
          positionalArguments, namedArguments);
    }
    if (methodName == 'testOptionalNamedParam') {
      return Function.apply(
          testOptionalNamedParam, positionalArguments, namedArguments);
    }
    if (methodName == 'testMixedOptionalNamedParam') {
      return Function.apply(
          testMixedOptionalNamedParam, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInParametersMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    return {closestIndex: closestValue};
  }
}
