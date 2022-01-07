// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'test_creator_getters.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $PageObjectHasGettersAndActions extends PageObjectHasGettersAndActions
    with $$PageObjectHasGettersAndActions {
  PageLoaderElement $__root__;
  $PageObjectHasGettersAndActions.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageObjectHasGettersAndActions.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageObjectHasGettersAndActions is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageObjectHasGettersAndActions());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInPageObjectHasGettersAndActions());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageObjectHasGettersAndActions(
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
    chain = findChainInPageObjectHasGettersAndActions(internalIds, action)
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
      throw '"tagName" is not defined by Page Object "PageObjectHasGettersAndActions". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String get testContext {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasGettersAndActions', 'testContext');
    }
    final returnMe = super.testContext;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasGettersAndActions', 'testContext');
    }
    return returnMe;
  }

  String get name {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasGettersAndActions', 'name');
    }
    final returnMe = super.name;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageObjectHasGettersAndActions', 'name');
    }
    return returnMe;
  }

  Future<void> clear(String text) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasGettersAndActions', 'clear');
    }
    final returnMe = super.clear(text);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageObjectHasGettersAndActions', 'clear');
    }
    return returnMe;
  }

  String toStringDeep() =>
      'PageObjectHasGettersAndActions\n\n${$__root__.toStringDeep()}';
}

mixin $$PageObjectHasGettersAndActions on PageObjectHasGettersAndActions {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageObjectHasGettersAndActions() {
    return {
      'testContext': 'String',
      'name': 'String',
    };
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageObjectHasGettersAndActions() {
    return {
      'clear': [
        {'name': 'text', 'kind': 'required', 'type': 'String'},
      ],
    };
  }

  dynamic testCreatorInvokeMethodInPageObjectHasGettersAndActions(
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
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ >
      findChainInPageObjectHasGettersAndActions(List<String> internalIds,
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
          'PageObjectHasGettersAndActions', 'input');
    }
    final element = $__root__.createElement(ByTagName('input'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageObjectHasGettersAndActions', 'input');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $PageObjectHasGettersThatUseDifferentReturnTypes
    extends PageObjectHasGettersThatUseDifferentReturnTypes
    with $$PageObjectHasGettersThatUseDifferentReturnTypes {
  PageLoaderElement $__root__;
  $PageObjectHasGettersThatUseDifferentReturnTypes.create(
      PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageObjectHasGettersThatUseDifferentReturnTypes.lookup(
          PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageObjectHasGettersThatUseDifferentReturnTypes is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(
        testCreatorGettersInPageObjectHasGettersThatUseDifferentReturnTypes());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(
        testCreatorMethodsInPageObjectHasGettersThatUseDifferentReturnTypes());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageObjectHasGettersThatUseDifferentReturnTypes(
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
    chain = findChainInPageObjectHasGettersThatUseDifferentReturnTypes(
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
      throw '"tagName" is not defined by Page Object "PageObjectHasGettersThatUseDifferentReturnTypes". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String get testContext {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasGettersThatUseDifferentReturnTypes', 'testContext');
    }
    final returnMe = super.testContext;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasGettersThatUseDifferentReturnTypes', 'testContext');
    }
    return returnMe;
  }

  bool get exists {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasGettersThatUseDifferentReturnTypes', 'exists');
    }
    final returnMe = super.exists;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasGettersThatUseDifferentReturnTypes', 'exists');
    }
    return returnMe;
  }

  int get size {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasGettersThatUseDifferentReturnTypes', 'size');
    }
    final returnMe = super.size;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasGettersThatUseDifferentReturnTypes', 'size');
    }
    return returnMe;
  }

  String toStringDeep() =>
      'PageObjectHasGettersThatUseDifferentReturnTypes\n\n${$__root__.toStringDeep()}';
}

mixin $$PageObjectHasGettersThatUseDifferentReturnTypes
    on PageObjectHasGettersThatUseDifferentReturnTypes {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String>
      testCreatorGettersInPageObjectHasGettersThatUseDifferentReturnTypes() {
    return {
      'testContext': 'String',
      'exists': 'bool',
      'size': 'int',
    };
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageObjectHasGettersThatUseDifferentReturnTypes() {
    return {};
  }

  dynamic
      testCreatorInvokeMethodInPageObjectHasGettersThatUseDifferentReturnTypes(
          String methodName, List<dynamic> positionalArguments,
          [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'testContext') {
      return testContext;
    }
    if (methodName == 'exists') {
      return exists;
    }
    if (methodName == 'size') {
      return size;
    }
    if (methodName == 'input') {
      return input;
    }
    if (methodName == 'inputs') {
      return inputs;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ >
      findChainInPageObjectHasGettersThatUseDifferentReturnTypes(
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
    final inputsElements = this.inputs;
    for (var elementIter = 0;
        elementIter < inputsElements.length;
        elementIter++) {
      try {
        var inputsIndex = internalIds.indexOf(inputsElements[elementIter].id);
        if (inputsIndex >= 0 && inputsIndex < closestIndex) {
          closestIndex = inputsIndex;
          closestValue = (_) =>
              'inputs[$elementIter].${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
        }
      } catch (_) {
        // Ignored.
      }
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get input {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasGettersThatUseDifferentReturnTypes', 'input');
    }
    final element = $__root__.createElement(ByTagName('input'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasGettersThatUseDifferentReturnTypes', 'input');
    }
    return returnMe;
  }

  PageObjectList<PageLoaderElement> get inputs {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasGettersThatUseDifferentReturnTypes', 'inputs');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByTagName('input2'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasGettersThatUseDifferentReturnTypes', 'inputs');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $PageObjectHasNoGetters extends PageObjectHasNoGetters
    with $$PageObjectHasNoGetters {
  PageLoaderElement $__root__;
  $PageObjectHasNoGetters.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageObjectHasNoGetters.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageObjectHasNoGetters is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageObjectHasNoGetters());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInPageObjectHasNoGetters());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageObjectHasNoGetters(
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
        findChainInPageObjectHasNoGetters(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "PageObjectHasNoGetters". Requires @CheckTag annotation in order for "tagName" to be generated.';
  Future<void> clear(String text) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageObjectHasNoGetters', 'clear');
    }
    final returnMe = super.clear(text);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageObjectHasNoGetters', 'clear');
    }
    return returnMe;
  }

  String toStringDeep() =>
      'PageObjectHasNoGetters\n\n${$__root__.toStringDeep()}';
}

mixin $$PageObjectHasNoGetters on PageObjectHasNoGetters {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageObjectHasNoGetters() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageObjectHasNoGetters() {
    return {
      'clear': [
        {'name': 'text', 'kind': 'required', 'type': 'String'},
      ],
    };
  }

  dynamic testCreatorInvokeMethodInPageObjectHasNoGetters(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'inputs') {
      return inputs;
    }
    if (methodName == 'clear') {
      return Function.apply(clear, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ >
      findChainInPageObjectHasNoGetters(List<String> internalIds,
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
      __listener.startPageObjectMethod('PageObjectHasNoGetters', 'inputs');
    }
    final element = $__root__.createElement(ByTagName('input'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageObjectHasNoGetters', 'inputs');
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
  String get testContext {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageObjectWithMixin', 'testContext');
    }
    final returnMe = super.testContext;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageObjectWithMixin', 'testContext');
    }
    return returnMe;
  }

  String get name {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageObjectWithMixin', 'name');
    }
    final returnMe = super.name;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageObjectWithMixin', 'name');
    }
    return returnMe;
  }

  String toStringDeep() => 'PageObjectWithMixin\n\n${$__root__.toStringDeep()}';
}

mixin $$PageObjectWithMixin on PageObjectWithMixin {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageObjectWithMixin() {
    return {
      'testContext': 'String',
      'name': 'String',
    };
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageObjectWithMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageObjectWithMixin(
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
    return {
      'tabContext': 'String',
      'tabName': 'String',
    };
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageObjectMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageObjectMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'tabContext') {
      return tabContext;
    }
    if (methodName == 'tabName') {
      return tabName;
    }
    if (methodName == 'tab') {
      return tab;
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
  String get tabContext {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectWithOverridingMixins', 'tabContext');
    }
    final returnMe = super.tabContext;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectWithOverridingMixins', 'tabContext');
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
    return {
      'tabContext': 'String',
    };
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageObjectWithOverridingMixins() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageObjectWithOverridingMixins(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'tabContext') {
      return tabContext;
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
