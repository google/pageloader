// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'long_exception.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$MyPageObject on MyPageObject {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInMyPageObject() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInMyPageObject() {
    return {};
  }

  dynamic testCreatorInvokeMethodInMyPageObject(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'ele') {
      return ele;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInMyPageObject(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
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
