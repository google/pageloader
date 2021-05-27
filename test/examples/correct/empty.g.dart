// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empty.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $Empty extends Empty with $$Empty {
  PageLoaderElement $__root__;
  $Empty.create(PageLoaderElement currentContext) : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $Empty.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "Empty is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInEmpty());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInEmpty());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInEmpty(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String findChain(List<dynamic> rawInternalIds, [String action = 'default']) {
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
    String Function(List<String>) closestValue;
    MapEntry<int, String Function(List<String>)> chain;
    chain = findChainInEmpty(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    if (closestIndex < internalIds.length) {
      final value = closestValue(internalIds);
      return code[value] ?? value;
    }

    return rootNotFound
        ? null
        : PageObject.defaultCode[action] ?? PageObject.defaultCode['default'];
  }

  static String get tagName =>
      throw '"tagName" is not defined by Page Object "Empty". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'Empty\n\n${$__root__.toStringDeep()}';
}

mixin $$Empty on Empty {
  PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInEmpty() {
    return {};
  }

  Map<String, List<Map<String, String>>> testCreatorMethodsInEmpty() {
    return {};
  }

  dynamic testCreatorInvokeMethodInEmpty(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInEmpty(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
    return {closestIndex: closestValue};
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$EmptyMixin on EmptyMixin {
  PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInEmptyMixin() {
    return {};
  }

  Map<String, List<Map<String, String>>> testCreatorMethodsInEmptyMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInEmptyMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInEmptyMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
    return {closestIndex: closestValue};
  }
}
