// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'root.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $ParentRoot extends ParentRoot with $$ParentRoot {
  PageLoaderElement $__root__;
  $ParentRoot.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $ParentRoot.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "ParentRoot is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInParentRoot());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInParentRoot());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInParentRoot(
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
    chain = findChainInParentRoot(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "ParentRoot". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'ParentRoot\n\n${$__root__.toStringDeep()}';
}

mixin $$ParentRoot on ParentRoot {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInParentRoot() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInParentRoot() {
    return {};
  }

  dynamic testCreatorInvokeMethodInParentRoot(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'root') {
      return root;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInParentRoot(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      var rootElement = this.root as dynamic;
      var rootIndex = internalIds.indexOf(rootElement.$__root__.id as String);
      if (rootIndex >= 0 && rootIndex < closestIndex) {
        closestIndex = rootIndex;
        closestValue = (ids) => 'root.${rootElement.findChain(ids, action)}'
            .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  Root get root {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ParentRoot', 'root');
    }
    final element = $__root__.createElement(ById('root-id'), [], []);
    final returnMe = Root.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ParentRoot', 'root');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $Root extends Root with $$Root {
  PageLoaderElement $__root__;
  $Root.create(PageLoaderElement currentContext) : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $Root.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "Root is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInRoot());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInRoot());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInRoot(
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
    chain = findChainInRoot(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "Root". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'Root\n\n${$__root__.toStringDeep()}';
}

mixin $$Root on Root {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInRoot() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>> testCreatorMethodsInRoot() {
    return {};
  }

  dynamic testCreatorInvokeMethodInRoot(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'myRoot') {
      return myRoot;
    }
    if (methodName == 'myId') {
      return myId;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInRoot(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      var myRootIndex = internalIds.indexOf(this.myRoot.id);
      if (myRootIndex >= 0 && myRootIndex < closestIndex) {
        closestIndex = myRootIndex;
        closestValue = (_) =>
            'myRoot.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var myIdIndex = internalIds.indexOf(this.myId.id);
      if (myIdIndex >= 0 && myIdIndex < closestIndex) {
        closestIndex = myIdIndex;
        closestValue = (_) =>
            'myId.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get myRoot {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Root', 'myRoot');
    }
    final element = $__root__;
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Root', 'myRoot');
    }
    return returnMe;
  }

  PageLoaderElement get myId {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Root', 'myId');
    }
    final element = $__root__.createElement(ById('some-id'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Root', 'myId');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $ParentRootUsingMixin extends ParentRootUsingMixin
    with $$ParentRootMixin, $$ParentRootUsingMixin {
  PageLoaderElement $__root__;
  $ParentRootUsingMixin.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $ParentRootUsingMixin.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "ParentRootUsingMixin is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInParentRootMixin());
    getters.addAll(testCreatorGettersInParentRootUsingMixin());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInParentRootMixin());
    methods.addAll(testCreatorMethodsInParentRootUsingMixin());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInParentRootUsingMixin(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    try {
      return testCreatorInvokeMethodInParentRootMixin(
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
    chain = findChainInParentRootUsingMixin(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    chain = findChainInParentRootMixin(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "ParentRootUsingMixin". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() =>
      'ParentRootUsingMixin\n\n${$__root__.toStringDeep()}';
}

mixin $$ParentRootUsingMixin on ParentRootUsingMixin {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInParentRootUsingMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInParentRootUsingMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInParentRootUsingMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ >
      findChainInParentRootUsingMixin(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    return {closestIndex: closestValue};
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$ParentRootMixin on ParentRootMixin {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInParentRootMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInParentRootMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInParentRootMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'root') {
      return root;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInParentRootMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      var rootElement = this.root as dynamic;
      var rootIndex = internalIds.indexOf(rootElement.$__root__.id as String);
      if (rootIndex >= 0 && rootIndex < closestIndex) {
        closestIndex = rootIndex;
        closestValue = (ids) => 'root.${rootElement.findChain(ids, action)}'
            .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  RootUsingMixin get root {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ParentRootMixin', 'root');
    }
    final element = $__root__.createElement(ById('root-id'), [], []);
    final returnMe = RootUsingMixin.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ParentRootMixin', 'root');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $RootUsingMixin extends RootUsingMixin
    with $$RootMixin, $$RootUsingMixin {
  PageLoaderElement $__root__;
  $RootUsingMixin.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $RootUsingMixin.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "RootUsingMixin is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInRootMixin());
    getters.addAll(testCreatorGettersInRootUsingMixin());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInRootMixin());
    methods.addAll(testCreatorMethodsInRootUsingMixin());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInRootUsingMixin(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    try {
      return testCreatorInvokeMethodInRootMixin(
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
    chain = findChainInRootUsingMixin(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    chain = findChainInRootMixin(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "RootUsingMixin". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'RootUsingMixin\n\n${$__root__.toStringDeep()}';
}

mixin $$RootUsingMixin on RootUsingMixin {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInRootUsingMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInRootUsingMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInRootUsingMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInRootUsingMixin(
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

mixin $$RootMixin on RootMixin {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInRootMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInRootMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInRootMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'myRoot') {
      return myRoot;
    }
    if (methodName == 'myId') {
      return myId;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInRootMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      var myRootIndex = internalIds.indexOf(this.myRoot.id);
      if (myRootIndex >= 0 && myRootIndex < closestIndex) {
        closestIndex = myRootIndex;
        closestValue = (_) =>
            'myRoot.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var myIdIndex = internalIds.indexOf(this.myId.id);
      if (myIdIndex >= 0 && myIdIndex < closestIndex) {
        closestIndex = myIdIndex;
        closestValue = (_) =>
            'myId.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get myRoot {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootMixin', 'myRoot');
    }
    final element = $__root__;
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootMixin', 'myRoot');
    }
    return returnMe;
  }

  PageLoaderElement get myId {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootMixin', 'myId');
    }
    final element = $__root__.createElement(ById('some-id'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootMixin', 'myId');
    }
    return returnMe;
  }
}
