// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'custom_events.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

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
