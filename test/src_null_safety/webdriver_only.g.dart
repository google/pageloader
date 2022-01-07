// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webdriver_only.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$WebDriverOnly on WebDriverOnly {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInWebDriverOnly() {
    return {};
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInWebDriverOnly() {
    return {};
  }

  dynamic testCreatorInvokeMethodInWebDriverOnly(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'button1') {
      return button1;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInWebDriverOnly(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var button1Index = internalIds.indexOf(this.button1.id);
      if (button1Index >= 0 && button1Index < closestIndex) {
        closestIndex = button1Index;
        closestValue = (_) =>
            'button1.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get button1 {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('WebDriverOnly', 'button1');
    }
    final element = $__root__.createElement(ById('button-1'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('WebDriverOnly', 'button1');
    }
    return returnMe;
  }
}
