// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'custom_events.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $PageForCustomEventsTest extends PageForCustomEventsTest
    with $$PageForCustomEventsTest {
  PageLoaderElement $__root__;
  $PageForCustomEventsTest.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageForCustomEventsTest.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageForCustomEventsTest is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageForCustomEventsTest());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInPageForCustomEventsTest());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageForCustomEventsTest(
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
    chain =
        findChainInPageForCustomEventsTest(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "PageForCustomEventsTest". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() =>
      'PageForCustomEventsTest\n\n${$__root__.toStringDeep()}';
}

mixin $$PageForCustomEventsTest on PageForCustomEventsTest {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForCustomEventsTest() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageForCustomEventsTest() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForCustomEventsTest(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'customEventsElement') {
      return customEventsElement;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ >
      findChainInPageForCustomEventsTest(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      var customEventsElementIndex =
          internalIds.indexOf(this.customEventsElement.id);
      if (customEventsElementIndex >= 0 &&
          customEventsElementIndex < closestIndex) {
        closestIndex = customEventsElementIndex;
        closestValue = (_) =>
            'customEventsElement.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get customEventsElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageForCustomEventsTest', 'customEventsElement');
    }
    final element =
        $__root__.createElement(ByTagName('custom-events-element'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageForCustomEventsTest', 'customEventsElement');
    }
    return returnMe;
  }
}
