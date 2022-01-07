// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'typing.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageForTextAreaTypingText on PageForTextAreaTypingText {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForTextAreaTypingText() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageForTextAreaTypingText() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForTextAreaTypingText(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'textArea') {
      return textArea;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ >
      findChainInPageForTextAreaTypingText(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      var textAreaIndex = internalIds.indexOf(this.textArea.id);
      if (textAreaIndex >= 0 && textAreaIndex < closestIndex) {
        closestIndex = textAreaIndex;
        closestValue = (_) =>
            'textArea.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get textArea {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForTextAreaTypingText', 'textArea');
    }
    final element = $__root__.createElement(ById('textarea'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForTextAreaTypingText', 'textArea');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageForTypingTests on PageForTypingTests {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForTypingTests() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageForTypingTests() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForTypingTests(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'text') {
      return text;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInPageForTypingTests(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
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

  PageLoaderElement get text {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForTypingTests', 'text');
    }
    final element = $__root__.createElement(ById('text'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForTypingTests', 'text');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageForTypingTestsWithFocusAndBlur
    on PageForTypingTestsWithFocusAndBlur {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForTypingTestsWithFocusAndBlur() {
    return {
      'focusCount': 'int',
      'blurCount': 'int',
    };
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageForTypingTestsWithFocusAndBlur() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForTypingTestsWithFocusAndBlur(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'focusCount') {
      return focusCount;
    }
    if (methodName == 'blurCount') {
      return blurCount;
    }
    if (methodName == 'text') {
      return text;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ >
      findChainInPageForTypingTestsWithFocusAndBlur(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
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
    try {
      var _focusCountIndex = internalIds.indexOf(this._focusCount.id);
      if (_focusCountIndex >= 0 && _focusCountIndex < closestIndex) {
        closestIndex = _focusCountIndex;
        closestValue = (_) =>
            '_focusCount.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var _blurCountIndex = internalIds.indexOf(this._blurCount.id);
      if (_blurCountIndex >= 0 && _blurCountIndex < closestIndex) {
        closestIndex = _blurCountIndex;
        closestValue = (_) =>
            '_blurCount.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get text {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageForTypingTestsWithFocusAndBlur', 'text');
    }
    final element =
        $__root__.createElement(ById('text-with-focus-and-blur'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageForTypingTestsWithFocusAndBlur', 'text');
    }
    return returnMe;
  }

  PageLoaderElement get _focusCount {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageForTypingTestsWithFocusAndBlur', '_focusCount');
    }
    final element = $__root__
        .createElement(ById('text-with-focus-and-blur-focus-count'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageForTypingTestsWithFocusAndBlur', '_focusCount');
    }
    return returnMe;
  }

  PageLoaderElement get _blurCount {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageForTypingTestsWithFocusAndBlur', '_blurCount');
    }
    final element = $__root__
        .createElement(ById('text-with-focus-and-blur-blur-count'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageForTypingTestsWithFocusAndBlur', '_blurCount');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$KeyboardListenerPO on KeyboardListenerPO {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInKeyboardListenerPO() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInKeyboardListenerPO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInKeyboardListenerPO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'listener') {
      return listener;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInKeyboardListenerPO(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      var listenerIndex = internalIds.indexOf(this.listener.id);
      if (listenerIndex >= 0 && listenerIndex < closestIndex) {
        closestIndex = listenerIndex;
        closestValue = (_) =>
            'listener.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get listener {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('KeyboardListenerPO', 'listener');
    }
    final element = $__root__.createElement(ById('keyboard-listener'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('KeyboardListenerPO', 'listener');
    }
    return returnMe;
  }
}
