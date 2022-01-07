// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_utils.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageForPageUtilsTests on PageForPageUtilsTests {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForPageUtilsTests() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInPageForPageUtilsTests() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForPageUtilsTests(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'rootElement') {
      return rootElement;
    }
    if (methodName == 'textInput') {
      return textInput;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInPageForPageUtilsTests(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var rootElementIndex = internalIds.indexOf(this.rootElement.id);
      if (rootElementIndex >= 0 && rootElementIndex < closestIndex) {
        closestIndex = rootElementIndex;
        closestValue = (_) =>
            'rootElement.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var textInputIndex = internalIds.indexOf(this.textInput.id);
      if (textInputIndex >= 0 && textInputIndex < closestIndex) {
        closestIndex = textInputIndex;
        closestValue = (_) =>
            'textInput.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get rootElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForPageUtilsTests', 'rootElement');
    }
    final element = $__root__;
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForPageUtilsTests', 'rootElement');
    }
    return returnMe;
  }

  PageLoaderElement get textInput {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForPageUtilsTests', 'textInput');
    }
    final element = $__root__.createElement(ById('text'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForPageUtilsTests', 'textInput');
    }
    return returnMe;
  }
}
