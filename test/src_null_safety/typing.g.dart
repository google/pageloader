// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typing.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $PageForTextAreaTypingText extends PageForTextAreaTypingText
    with $$PageForTextAreaTypingText {
  PageLoaderElement $__root__;
  $PageForTextAreaTypingText.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageForTextAreaTypingText.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageForTextAreaTypingText is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageForTextAreaTypingText());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInPageForTextAreaTypingText());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageForTextAreaTypingText(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String? findChain(List<dynamic> rawInternalIds, [String action = 'default']) {
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
    String Function(List<String>)? closestValue;
    MapEntry<int, String Function(List<String>)?> chain;
    chain =
        findChainInPageForTextAreaTypingText(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    if (closestIndex < internalIds.length) {
      final value = closestValue!(internalIds);
      return code[value] ?? value;
    }

    return rootNotFound
        ? null
        : PageObject.defaultCode[action] ?? PageObject.defaultCode['default'];
  }

  static String get tagName =>
      throw '"tagName" is not defined by Page Object "PageForTextAreaTypingText". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() =>
      'PageForTextAreaTypingText\n\n${$__root__.toStringDeep()}';
}

mixin $$PageForTextAreaTypingText on PageForTextAreaTypingText {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForTextAreaTypingText() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInPageForTextAreaTypingText() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForTextAreaTypingText(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'textArea') {
      return textArea;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInPageForTextAreaTypingText(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
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
class $PageForTypingTests extends PageForTypingTests with $$PageForTypingTests {
  PageLoaderElement $__root__;
  $PageForTypingTests.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageForTypingTests.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageForTypingTests is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageForTypingTests());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInPageForTypingTests());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageForTypingTests(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String? findChain(List<dynamic> rawInternalIds, [String action = 'default']) {
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
    String Function(List<String>)? closestValue;
    MapEntry<int, String Function(List<String>)?> chain;
    chain = findChainInPageForTypingTests(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    if (closestIndex < internalIds.length) {
      final value = closestValue!(internalIds);
      return code[value] ?? value;
    }

    return rootNotFound
        ? null
        : PageObject.defaultCode[action] ?? PageObject.defaultCode['default'];
  }

  static String get tagName =>
      throw '"tagName" is not defined by Page Object "PageForTypingTests". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'PageForTypingTests\n\n${$__root__.toStringDeep()}';
}

mixin $$PageForTypingTests on PageForTypingTests {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForTypingTests() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInPageForTypingTests() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForTypingTests(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'text') {
      return text;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInPageForTypingTests(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
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
class $PageForTypingTestsWithFocusAndBlur
    extends PageForTypingTestsWithFocusAndBlur
    with $$PageForTypingTestsWithFocusAndBlur {
  PageLoaderElement $__root__;
  $PageForTypingTestsWithFocusAndBlur.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageForTypingTestsWithFocusAndBlur.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageForTypingTestsWithFocusAndBlur is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageForTypingTestsWithFocusAndBlur());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInPageForTypingTestsWithFocusAndBlur());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageForTypingTestsWithFocusAndBlur(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String? findChain(List<dynamic> rawInternalIds, [String action = 'default']) {
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
    String Function(List<String>)? closestValue;
    MapEntry<int, String Function(List<String>)?> chain;
    chain = findChainInPageForTypingTestsWithFocusAndBlur(internalIds, action)
        .entries
        .first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    if (closestIndex < internalIds.length) {
      final value = closestValue!(internalIds);
      return code[value] ?? value;
    }

    return rootNotFound
        ? null
        : PageObject.defaultCode[action] ?? PageObject.defaultCode['default'];
  }

  static String get tagName =>
      throw '"tagName" is not defined by Page Object "PageForTypingTestsWithFocusAndBlur". Requires @CheckTag annotation in order for "tagName" to be generated.';
  int get focusCount {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageForTypingTestsWithFocusAndBlur', 'focusCount');
    }
    final returnMe = super.focusCount;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageForTypingTestsWithFocusAndBlur', 'focusCount');
    }
    return returnMe;
  }

  int get blurCount {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageForTypingTestsWithFocusAndBlur', 'blurCount');
    }
    final returnMe = super.blurCount;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageForTypingTestsWithFocusAndBlur', 'blurCount');
    }
    return returnMe;
  }

  String toStringDeep() =>
      'PageForTypingTestsWithFocusAndBlur\n\n${$__root__.toStringDeep()}';
}

mixin $$PageForTypingTestsWithFocusAndBlur
    on PageForTypingTestsWithFocusAndBlur {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForTypingTestsWithFocusAndBlur() {
    return {
      'focusCount': 'int',
      'blurCount': 'int',
    };
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInPageForTypingTestsWithFocusAndBlur() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForTypingTestsWithFocusAndBlur(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
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

  Map<int, String Function(List<String>)?>
      findChainInPageForTypingTestsWithFocusAndBlur(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
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
class $KeyboardListenerPO extends KeyboardListenerPO with $$KeyboardListenerPO {
  PageLoaderElement $__root__;
  $KeyboardListenerPO.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $KeyboardListenerPO.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "KeyboardListenerPO is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInKeyboardListenerPO());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInKeyboardListenerPO());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInKeyboardListenerPO(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String? findChain(List<dynamic> rawInternalIds, [String action = 'default']) {
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
    String Function(List<String>)? closestValue;
    MapEntry<int, String Function(List<String>)?> chain;
    chain = findChainInKeyboardListenerPO(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    if (closestIndex < internalIds.length) {
      final value = closestValue!(internalIds);
      return code[value] ?? value;
    }

    return rootNotFound
        ? null
        : PageObject.defaultCode[action] ?? PageObject.defaultCode['default'];
  }

  static String get tagName =>
      throw '"tagName" is not defined by Page Object "KeyboardListenerPO". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'KeyboardListenerPO\n\n${$__root__.toStringDeep()}';
}

mixin $$KeyboardListenerPO on KeyboardListenerPO {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInKeyboardListenerPO() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInKeyboardListenerPO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInKeyboardListenerPO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'listener') {
      return listener;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInKeyboardListenerPO(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
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
