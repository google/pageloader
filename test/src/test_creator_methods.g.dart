// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'test_creator_methods.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $PageObjectHasPropertiesAndMethods
    extends PageObjectHasPropertiesAndMethods
    with $$PageObjectHasPropertiesAndMethods {
  PageLoaderElement $__root__;
  $PageObjectHasPropertiesAndMethods.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageObjectHasPropertiesAndMethods.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageObjectHasPropertiesAndMethods is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageObjectHasPropertiesAndMethods());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInPageObjectHasPropertiesAndMethods());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageObjectHasPropertiesAndMethods(
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
    chain = findChainInPageObjectHasPropertiesAndMethods(internalIds, action)
        .entries
        .first;
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
      throw '"tagName" is not defined by Page Object "PageObjectHasPropertiesAndMethods". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String get testContext {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasPropertiesAndMethods', 'testContext');
    }
    final returnMe = super.testContext;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasPropertiesAndMethods', 'testContext');
    }
    return returnMe;
  }

  String get name {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasPropertiesAndMethods', 'name');
    }
    final returnMe = super.name;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasPropertiesAndMethods', 'name');
    }
    return returnMe;
  }

  Future<void> clear(String text) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasPropertiesAndMethods', 'clear');
    }
    final returnMe = super.clear(text);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasPropertiesAndMethods', 'clear');
    }
    return returnMe;
  }

  Future<int> getLength() {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasPropertiesAndMethods', 'getLength');
    }
    final returnMe = super.getLength();
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasPropertiesAndMethods', 'getLength');
    }
    return returnMe;
  }

  void badClear(String text) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasPropertiesAndMethods', 'badClear');
    }
    super.badClear(text);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasPropertiesAndMethods', 'badClear');
    }
    return;
  }

  String toStringDeep() =>
      'PageObjectHasPropertiesAndMethods\n\n${$__root__.toStringDeep()}';
}

mixin $$PageObjectHasPropertiesAndMethods on PageObjectHasPropertiesAndMethods {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageObjectHasPropertiesAndMethods() {
    return {
      'testContext': 'String',
      'name': 'String',
    };
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageObjectHasPropertiesAndMethods() {
    return {
      'clear': [
        {'name': 'text', 'kind': 'required', 'type': 'String'},
      ],
      'getLength': [],
    };
  }

  dynamic testCreatorInvokeMethodInPageObjectHasPropertiesAndMethods(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'testContext') {
      return testContext;
    }
    if (methodName == 'name') {
      return name;
    }
    if (methodName == 'input') {
      return input;
    }
    if (methodName == 'clear') {
      return Function.apply(clear, positionalArguments, namedArguments);
    }
    if (methodName == 'getLength') {
      return Function.apply(getLength, positionalArguments, namedArguments);
    }
    if (methodName == 'badClear') {
      return Function.apply(badClear, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ >
      findChainInPageObjectHasPropertiesAndMethods(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      var inputIndex = internalIds.indexOf(this.input.id);
      if (inputIndex >= 0 && inputIndex < closestIndex) {
        closestIndex = inputIndex;
        closestValue = (_) =>
            'input.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get input {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasPropertiesAndMethods', 'input');
    }
    final element = $__root__.createElement(ByTagName('input'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasPropertiesAndMethods', 'input');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $PageObjectHasMethodsWithDifferentParameters
    extends PageObjectHasMethodsWithDifferentParameters
    with $$PageObjectHasMethodsWithDifferentParameters {
  PageLoaderElement $__root__;
  $PageObjectHasMethodsWithDifferentParameters.create(
      PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageObjectHasMethodsWithDifferentParameters.lookup(
          PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageObjectHasMethodsWithDifferentParameters is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(
        testCreatorGettersInPageObjectHasMethodsWithDifferentParameters());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(
        testCreatorMethodsInPageObjectHasMethodsWithDifferentParameters());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageObjectHasMethodsWithDifferentParameters(
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
    chain = findChainInPageObjectHasMethodsWithDifferentParameters(
            internalIds, action)
        .entries
        .first;
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
      throw '"tagName" is not defined by Page Object "PageObjectHasMethodsWithDifferentParameters". Requires @CheckTag annotation in order for "tagName" to be generated.';
  Future<void> click() {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasMethodsWithDifferentParameters', 'click');
    }
    final returnMe = super.click();
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasMethodsWithDifferentParameters', 'click');
    }
    return returnMe;
  }

  Future<void> type(int index, {String text}) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasMethodsWithDifferentParameters', 'type');
    }
    final returnMe = super.type(index, text: text);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasMethodsWithDifferentParameters', 'type');
    }
    return returnMe;
  }

  Future<void> cut(int start, [int end = 12]) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasMethodsWithDifferentParameters', 'cut');
    }
    final returnMe = super.cut(start, end);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasMethodsWithDifferentParameters', 'cut');
    }
    return returnMe;
  }

  Future<void> defaultString([String end = '23']) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasMethodsWithDifferentParameters', 'defaultString');
    }
    final returnMe = super.defaultString(end);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasMethodsWithDifferentParameters', 'defaultString');
    }
    return returnMe;
  }

  Future<void> defaultBool({bool end = true}) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasMethodsWithDifferentParameters', 'defaultBool');
    }
    final returnMe = super.defaultBool(end: end);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasMethodsWithDifferentParameters', 'defaultBool');
    }
    return returnMe;
  }

  Future<void> varm(var x) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasMethodsWithDifferentParameters', 'varm');
    }
    final returnMe = super.varm(x);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasMethodsWithDifferentParameters', 'varm');
    }
    return returnMe;
  }

  String toStringDeep() =>
      'PageObjectHasMethodsWithDifferentParameters\n\n${$__root__.toStringDeep()}';
}

mixin $$PageObjectHasMethodsWithDifferentParameters
    on PageObjectHasMethodsWithDifferentParameters {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String>
      testCreatorGettersInPageObjectHasMethodsWithDifferentParameters() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageObjectHasMethodsWithDifferentParameters() {
    return {
      'click': [],
      'type': [
        {'name': 'index', 'kind': 'required', 'type': 'int'},
        {'name': 'text', 'kind': 'named', 'type': 'String', 'default': null},
      ],
      'cut': [
        {'name': 'start', 'kind': 'required', 'type': 'int'},
        {'name': 'end', 'kind': 'positional', 'type': 'int', 'default': "12"},
      ],
      'defaultString': [
        {
          'name': 'end',
          'kind': 'positional',
          'type': 'String',
          'default': "'23'"
        },
      ],
      'defaultBool': [
        {'name': 'end', 'kind': 'named', 'type': 'bool', 'default': "true"},
      ],
      'varm': [
        {'name': 'x', 'kind': 'required', 'type': 'var'},
      ],
    };
  }

  dynamic testCreatorInvokeMethodInPageObjectHasMethodsWithDifferentParameters(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'click') {
      return Function.apply(click, positionalArguments, namedArguments);
    }
    if (methodName == 'type') {
      return Function.apply(type, positionalArguments, namedArguments);
    }
    if (methodName == 'cut') {
      return Function.apply(cut, positionalArguments, namedArguments);
    }
    if (methodName == 'defaultString') {
      return Function.apply(defaultString, positionalArguments, namedArguments);
    }
    if (methodName == 'defaultBool') {
      return Function.apply(defaultBool, positionalArguments, namedArguments);
    }
    if (methodName == 'varm') {
      return Function.apply(varm, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ >
      findChainInPageObjectHasMethodsWithDifferentParameters(
          List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    return {closestIndex: closestValue};
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $PageObjectHasNoMethods extends PageObjectHasNoMethods
    with $$PageObjectHasNoMethods {
  PageLoaderElement $__root__;
  $PageObjectHasNoMethods.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageObjectHasNoMethods.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageObjectHasNoMethods is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageObjectHasNoMethods());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInPageObjectHasNoMethods());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageObjectHasNoMethods(
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
        findChainInPageObjectHasNoMethods(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "PageObjectHasNoMethods". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() =>
      'PageObjectHasNoMethods\n\n${$__root__.toStringDeep()}';
}

mixin $$PageObjectHasNoMethods on PageObjectHasNoMethods {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageObjectHasNoMethods() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageObjectHasNoMethods() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageObjectHasNoMethods(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'inputs') {
      return inputs;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ >
      findChainInPageObjectHasNoMethods(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      var inputsIndex = internalIds.indexOf(this.inputs.id);
      if (inputsIndex >= 0 && inputsIndex < closestIndex) {
        closestIndex = inputsIndex;
        closestValue = (_) =>
            'inputs.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get inputs {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageObjectHasNoMethods', 'inputs');
    }
    final element = $__root__.createElement(ByTagName('input'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageObjectHasNoMethods', 'inputs');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $PageObjectWithMixin extends PageObjectWithMixin
    with $$PageObjectMixin, $$PageObjectWithMixin {
  PageLoaderElement $__root__;
  $PageObjectWithMixin.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageObjectWithMixin.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageObjectWithMixin is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageObjectMixin());
    getters.addAll(testCreatorGettersInPageObjectWithMixin());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInPageObjectMixin());
    methods.addAll(testCreatorMethodsInPageObjectWithMixin());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageObjectWithMixin(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    try {
      return testCreatorInvokeMethodInPageObjectMixin(
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
    chain = findChainInPageObjectWithMixin(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    chain = findChainInPageObjectMixin(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "PageObjectWithMixin". Requires @CheckTag annotation in order for "tagName" to be generated.';
  Future<void> cut(int start, [int end = 12]) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageObjectWithMixin', 'cut');
    }
    final returnMe = super.cut(start, end);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageObjectWithMixin', 'cut');
    }
    return returnMe;
  }

  String toStringDeep() => 'PageObjectWithMixin\n\n${$__root__.toStringDeep()}';
}

mixin $$PageObjectWithMixin on PageObjectWithMixin {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageObjectWithMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageObjectWithMixin() {
    return {
      'cut': [
        {'name': 'start', 'kind': 'required', 'type': 'int'},
        {'name': 'end', 'kind': 'positional', 'type': 'int', 'default': "12"},
      ],
    };
  }

  dynamic testCreatorInvokeMethodInPageObjectWithMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'input') {
      return input;
    }
    if (methodName == 'cut') {
      return Function.apply(cut, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInPageObjectWithMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      var inputIndex = internalIds.indexOf(this.input.id);
      if (inputIndex >= 0 && inputIndex < closestIndex) {
        closestIndex = inputIndex;
        closestValue = (_) =>
            'input.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get input {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageObjectWithMixin', 'input');
    }
    final element = $__root__.createElement(ByTagName('input'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageObjectWithMixin', 'input');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageObjectMixin on PageObjectMixin {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageObjectMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageObjectMixin() {
    return {
      'click': [],
    };
  }

  dynamic testCreatorInvokeMethodInPageObjectMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'tab') {
      return tab;
    }
    if (methodName == 'click') {
      return Function.apply(click, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInPageObjectMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      var tabIndex = internalIds.indexOf(this.tab.id);
      if (tabIndex >= 0 && tabIndex < closestIndex) {
        closestIndex = tabIndex;
        closestValue = (_) =>
            'tab.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get tab {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageObjectMixin', 'tab');
    }
    final element = $__root__.createElement(ByTagName('tab'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageObjectMixin', 'tab');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $PageObjectWithOverridingMixins extends PageObjectWithOverridingMixins
    with $$PageObjectMixin, $$PageObjectWithOverridingMixins {
  PageLoaderElement $__root__;
  $PageObjectWithOverridingMixins.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageObjectWithOverridingMixins.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageObjectWithOverridingMixins is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageObjectMixin());
    getters.addAll(testCreatorGettersInPageObjectWithOverridingMixins());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInPageObjectMixin());
    methods.addAll(testCreatorMethodsInPageObjectWithOverridingMixins());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageObjectWithOverridingMixins(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    try {
      return testCreatorInvokeMethodInPageObjectMixin(
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
    chain = findChainInPageObjectWithOverridingMixins(internalIds, action)
        .entries
        .first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    chain = findChainInPageObjectMixin(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "PageObjectWithOverridingMixins". Requires @CheckTag annotation in order for "tagName" to be generated.';
  Future<void> cut(int start, [int end = 12]) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageObjectWithOverridingMixins', 'cut');
    }
    final returnMe = super.cut(start, end);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageObjectWithOverridingMixins', 'cut');
    }
    return returnMe;
  }

  Future<void> click() {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectWithOverridingMixins', 'click');
    }
    final returnMe = super.click();
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageObjectWithOverridingMixins', 'click');
    }
    return returnMe;
  }

  Future<void> varm(var x) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectWithOverridingMixins', 'varm');
    }
    final returnMe = super.varm(x);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageObjectWithOverridingMixins', 'varm');
    }
    return returnMe;
  }

  String toStringDeep() =>
      'PageObjectWithOverridingMixins\n\n${$__root__.toStringDeep()}';
}

mixin $$PageObjectWithOverridingMixins on PageObjectWithOverridingMixins {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageObjectWithOverridingMixins() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageObjectWithOverridingMixins() {
    return {
      'cut': [
        {'name': 'start', 'kind': 'required', 'type': 'int'},
        {'name': 'end', 'kind': 'positional', 'type': 'int', 'default': "12"},
      ],
      'click': [],
      'varm': [
        {'name': 'x', 'kind': 'required', 'type': 'var'},
      ],
    };
  }

  dynamic testCreatorInvokeMethodInPageObjectWithOverridingMixins(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'cut') {
      return Function.apply(cut, positionalArguments, namedArguments);
    }
    if (methodName == 'click') {
      return Function.apply(click, positionalArguments, namedArguments);
    }
    if (methodName == 'varm') {
      return Function.apply(varm, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ >
      findChainInPageObjectWithOverridingMixins(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    return {closestIndex: closestValue};
  }
}
