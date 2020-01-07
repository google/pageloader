// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_utils.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $PageForPageUtilsTests extends PageForPageUtilsTests
    with $$PageForPageUtilsTests {
  PageLoaderElement $__root__;
  $PageForPageUtilsTests.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageForPageUtilsTests.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageForPageUtilsTests is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageForPageUtilsTests());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInPageForPageUtilsTests());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageForPageUtilsTests(
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
    chain = findChainInPageForPageUtilsTests(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "PageForPageUtilsTests". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() =>
      'PageForPageUtilsTests\n\n${$__root__.toStringDeep()}';
}

mixin $$PageForPageUtilsTests on PageForPageUtilsTests {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderPointer __pointer__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForPageUtilsTests() {
    return {};
  }

  Map<String, List<Map<String, String>>>
      testCreatorMethodsInPageForPageUtilsTests() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForPageUtilsTests(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    if (methodName == 'rootElement') {
      return rootElement;
    }
    if (methodName == 'textInput') {
      return textInput;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInPageForPageUtilsTests(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
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
