// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'attributes.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageForAttributesTests on PageForAttributesTests {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForAttributesTests() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageForAttributesTests() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForAttributesTests(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'divWithStyle') {
      return divWithStyle;
    }
    if (methodName == 'checkbox') {
      return checkbox;
    }
    if (methodName == 'table') {
      return table;
    }
    if (methodName == 'select1') {
      return select1;
    }
    if (methodName == 'option1') {
      return option1;
    }
    if (methodName == 'option2') {
      return option2;
    }
    if (methodName == 'radio') {
      return radio;
    }
    if (methodName == 'anchor') {
      return anchor;
    }
    if (methodName == 'img') {
      return img;
    }
    if (methodName == 'readOnly') {
      return readOnly;
    }
    if (methodName == 'text') {
      return text;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ >
      findChainInPageForAttributesTests(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      var divWithStyleIndex = internalIds.indexOf(this.divWithStyle.id);
      if (divWithStyleIndex >= 0 && divWithStyleIndex < closestIndex) {
        closestIndex = divWithStyleIndex;
        closestValue = (_) =>
            'divWithStyle.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var checkboxIndex = internalIds.indexOf(this.checkbox.id);
      if (checkboxIndex >= 0 && checkboxIndex < closestIndex) {
        closestIndex = checkboxIndex;
        closestValue = (_) =>
            'checkbox.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var tableIndex = internalIds.indexOf(this.table.id);
      if (tableIndex >= 0 && tableIndex < closestIndex) {
        closestIndex = tableIndex;
        closestValue = (_) =>
            'table.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var select1Index = internalIds.indexOf(this.select1.id);
      if (select1Index >= 0 && select1Index < closestIndex) {
        closestIndex = select1Index;
        closestValue = (_) =>
            'select1.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var option1Index = internalIds.indexOf(this.option1.id);
      if (option1Index >= 0 && option1Index < closestIndex) {
        closestIndex = option1Index;
        closestValue = (_) =>
            'option1.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var option2Index = internalIds.indexOf(this.option2.id);
      if (option2Index >= 0 && option2Index < closestIndex) {
        closestIndex = option2Index;
        closestValue = (_) =>
            'option2.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var radioIndex = internalIds.indexOf(this.radio.id);
      if (radioIndex >= 0 && radioIndex < closestIndex) {
        closestIndex = radioIndex;
        closestValue = (_) =>
            'radio.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var anchorIndex = internalIds.indexOf(this.anchor.id);
      if (anchorIndex >= 0 && anchorIndex < closestIndex) {
        closestIndex = anchorIndex;
        closestValue = (_) =>
            'anchor.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var imgIndex = internalIds.indexOf(this.img.id);
      if (imgIndex >= 0 && imgIndex < closestIndex) {
        closestIndex = imgIndex;
        closestValue = (_) =>
            'img.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var readOnlyIndex = internalIds.indexOf(this.readOnly.id);
      if (readOnlyIndex >= 0 && readOnlyIndex < closestIndex) {
        closestIndex = readOnlyIndex;
        closestValue = (_) =>
            'readOnly.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var textIndex = internalIds.indexOf(this.text.id);
      if (textIndex >= 0 && textIndex < closestIndex) {
        closestIndex = textIndex;
        closestValue = (_) =>
            'text.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get divWithStyle {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageForAttributesTests', 'divWithStyle');
    }
    final element = $__root__.createElement(ById('div'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForAttributesTests', 'divWithStyle');
    }
    return returnMe;
  }

  PageLoaderElement get checkbox {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForAttributesTests', 'checkbox');
    }
    final element =
        $__root__.createElement(ByCss('input[type=checkbox]'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForAttributesTests', 'checkbox');
    }
    return returnMe;
  }

  PageLoaderElement get table {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForAttributesTests', 'table');
    }
    final element = $__root__.createElement(ById('table1'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForAttributesTests', 'table');
    }
    return returnMe;
  }

  PageLoaderElement get select1 {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForAttributesTests', 'select1');
    }
    final element = $__root__.createElement(ById('select1'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForAttributesTests', 'select1');
    }
    return returnMe;
  }

  PageLoaderElement get option1 {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForAttributesTests', 'option1');
    }
    final element = $__root__.createElement(ById('option1'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForAttributesTests', 'option1');
    }
    return returnMe;
  }

  PageLoaderElement get option2 {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForAttributesTests', 'option2');
    }
    final element = $__root__.createElement(ById('option2'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForAttributesTests', 'option2');
    }
    return returnMe;
  }

  PageLoaderElement get radio {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForAttributesTests', 'radio');
    }
    final element =
        $__root__.createElement(ByCss('input[value=radio1]'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForAttributesTests', 'radio');
    }
    return returnMe;
  }

  PageLoaderElement get anchor {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForAttributesTests', 'anchor');
    }
    final element = $__root__.createElement(ById('anchor'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForAttributesTests', 'anchor');
    }
    return returnMe;
  }

  PageLoaderElement get img {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForAttributesTests', 'img');
    }
    final element = $__root__.createElement(ByTagName('img'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForAttributesTests', 'img');
    }
    return returnMe;
  }

  PageLoaderElement get readOnly {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForAttributesTests', 'readOnly');
    }
    final element = $__root__.createElement(ById('readonly'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForAttributesTests', 'readOnly');
    }
    return returnMe;
  }

  PageLoaderElement get text {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForAttributesTests', 'text');
    }
    final element = $__root__.createElement(ById('text'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForAttributesTests', 'text');
    }
    return returnMe;
  }
}
