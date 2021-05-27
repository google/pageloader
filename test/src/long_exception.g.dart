// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'long_exception.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $MyPageObject extends MyPageObject with $$MyPageObject {
  PageLoaderElement $__root__;
  $MyPageObject.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $MyPageObject.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "MyPageObject is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInMyPageObject());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInMyPageObject());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInMyPageObject(
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
    chain = findChainInMyPageObject(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "MyPageObject". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'MyPageObject\n\n${$__root__.toStringDeep()}';
}

mixin $$MyPageObject on MyPageObject {
  PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInMyPageObject() {
    return {};
  }

  Map<String, List<Map<String, String>>> testCreatorMethodsInMyPageObject() {
    return {};
  }

  dynamic testCreatorInvokeMethodInMyPageObject(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    if (methodName == 'ele') {
      return ele;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInMyPageObject(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
    try {
      var eleIndex = internalIds.indexOf(this.ele.id);
      if (eleIndex >= 0 && eleIndex < closestIndex) {
        closestIndex = eleIndex;
        closestValue = (_) =>
            'ele.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get ele {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('MyPageObject', 'ele');
    }
    final element = $__root__.createElement(ByTagName('div'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('MyPageObject', 'ele');
    }
    return returnMe;
  }
}
