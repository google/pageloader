// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_checks.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$ChecksMixin on ChecksMixin {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInChecksMixin() {
    return {};
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInChecksMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInChecksMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'myRoot') {
      return myRoot;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInChecksMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
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
    return {closestIndex: closestValue};
  }

  PageLoaderElement get myRoot {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ChecksMixin', 'myRoot');
    }
    final element = $__root__;
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ChecksMixin', 'myRoot');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $ClassChecks extends ClassChecks with $$ClassChecks {
  PageLoaderElement $__root__;
  $ClassChecks.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([CheckTag('some-tag')]);
  }
  factory $ClassChecks.lookup(PageLoaderSource source) =>
      $ClassChecks.create(source.byTag('some-tag'));
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInClassChecks());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInClassChecks());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInClassChecks(
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
    chain = findChainInClassChecks(internalIds, action).entries.first;
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

  static const String tagName = 'some-tag';
  String toStringDeep() => 'ClassChecks\n\n${$__root__.toStringDeep()}';
}

mixin $$ClassChecks on ClassChecks {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInClassChecks() {
    return {};
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInClassChecks() {
    return {};
  }

  dynamic testCreatorInvokeMethodInClassChecks(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'myRoot') {
      return myRoot;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInClassChecks(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
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
    return {closestIndex: closestValue};
  }

  PageLoaderElement get myRoot {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ClassChecks', 'myRoot');
    }
    final element = $__root__;
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ClassChecks', 'myRoot');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $EnsureTagChecks extends EnsureTagChecks with $$EnsureTagChecks {
  PageLoaderElement $__root__;
  $EnsureTagChecks.create(PageLoaderElement currentContext)
      : $__root__ =
            currentContext.createElement(EnsureTag('some-other-tag'), [], []) {
    $__root__.addCheckers([EnsureTag('some-other-tag')]);
  }
  factory $EnsureTagChecks.lookup(PageLoaderSource source) =>
      $EnsureTagChecks.create(source.byTag('some-other-tag'));
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInEnsureTagChecks());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInEnsureTagChecks());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInEnsureTagChecks(
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
    chain = findChainInEnsureTagChecks(internalIds, action).entries.first;
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

  static const String tagName = 'some-other-tag';
  String toStringDeep() => 'EnsureTagChecks\n\n${$__root__.toStringDeep()}';
}

mixin $$EnsureTagChecks on EnsureTagChecks {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInEnsureTagChecks() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInEnsureTagChecks() {
    return {};
  }

  dynamic testCreatorInvokeMethodInEnsureTagChecks(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'myRoot') {
      return myRoot;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInEnsureTagChecks(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
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
    return {closestIndex: closestValue};
  }

  PageLoaderElement get myRoot {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('EnsureTagChecks', 'myRoot');
    }
    final element = $__root__;
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('EnsureTagChecks', 'myRoot');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $ClassChecksUsingClassMixin extends ClassChecksUsingClassMixin
    with $$ChecksClassMixin, $$ClassChecksUsingClassMixin {
  PageLoaderElement $__root__;
  $ClassChecksUsingClassMixin.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([CheckTag('some-tag')]);
  }
  factory $ClassChecksUsingClassMixin.lookup(PageLoaderSource source) =>
      $ClassChecksUsingClassMixin.create(source.byTag('some-tag'));
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInChecksClassMixin());
    getters.addAll(testCreatorGettersInClassChecksUsingClassMixin());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInChecksClassMixin());
    methods.addAll(testCreatorMethodsInClassChecksUsingClassMixin());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInClassChecksUsingClassMixin(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    try {
      return testCreatorInvokeMethodInChecksClassMixin(
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
    chain = findChainInClassChecksUsingClassMixin(internalIds, action)
        .entries
        .first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    chain = findChainInChecksClassMixin(internalIds, action).entries.first;
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

  static const String tagName = 'some-tag';
  String toStringDeep() =>
      'ClassChecksUsingClassMixin\n\n${$__root__.toStringDeep()}';
}

mixin $$ClassChecksUsingClassMixin on ClassChecksUsingClassMixin {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInClassChecksUsingClassMixin() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInClassChecksUsingClassMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInClassChecksUsingClassMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?>
      findChainInClassChecksUsingClassMixin(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    return {closestIndex: closestValue};
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $ClassChecksUsingMixin extends ClassChecksUsingMixin
    with $$ChecksMixin, $$ClassChecksUsingMixin {
  PageLoaderElement $__root__;
  $ClassChecksUsingMixin.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([CheckTag('some-tag')]);
  }
  factory $ClassChecksUsingMixin.lookup(PageLoaderSource source) =>
      $ClassChecksUsingMixin.create(source.byTag('some-tag'));
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInChecksMixin());
    getters.addAll(testCreatorGettersInClassChecksUsingMixin());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInChecksMixin());
    methods.addAll(testCreatorMethodsInClassChecksUsingMixin());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInClassChecksUsingMixin(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    try {
      return testCreatorInvokeMethodInChecksMixin(
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
    chain = findChainInClassChecksUsingMixin(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    chain = findChainInChecksMixin(internalIds, action).entries.first;
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

  static const String tagName = 'some-tag';
  String toStringDeep() =>
      'ClassChecksUsingMixin\n\n${$__root__.toStringDeep()}';
}

mixin $$ClassChecksUsingMixin on ClassChecksUsingMixin {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInClassChecksUsingMixin() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInClassChecksUsingMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInClassChecksUsingMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInClassChecksUsingMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    return {closestIndex: closestValue};
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $EnsureTagChecksUsingMixin extends EnsureTagChecksUsingMixin
    with $$ChecksMixin, $$EnsureTagChecksUsingMixin {
  PageLoaderElement $__root__;
  $EnsureTagChecksUsingMixin.create(PageLoaderElement currentContext)
      : $__root__ =
            currentContext.createElement(EnsureTag('some-other-tag'), [], []) {
    $__root__.addCheckers([EnsureTag('some-other-tag')]);
  }
  factory $EnsureTagChecksUsingMixin.lookup(PageLoaderSource source) =>
      $EnsureTagChecksUsingMixin.create(source.byTag('some-other-tag'));
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInChecksMixin());
    getters.addAll(testCreatorGettersInEnsureTagChecksUsingMixin());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInChecksMixin());
    methods.addAll(testCreatorMethodsInEnsureTagChecksUsingMixin());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInEnsureTagChecksUsingMixin(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    try {
      return testCreatorInvokeMethodInChecksMixin(
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
        findChainInEnsureTagChecksUsingMixin(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    chain = findChainInChecksMixin(internalIds, action).entries.first;
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

  static const String tagName = 'some-other-tag';
  String toStringDeep() =>
      'EnsureTagChecksUsingMixin\n\n${$__root__.toStringDeep()}';
}

mixin $$EnsureTagChecksUsingMixin on EnsureTagChecksUsingMixin {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInEnsureTagChecksUsingMixin() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInEnsureTagChecksUsingMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInEnsureTagChecksUsingMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInEnsureTagChecksUsingMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    return {closestIndex: closestValue};
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$ChecksClassMixin on ChecksClassMixin {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInChecksClassMixin() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInChecksClassMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInChecksClassMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'myRoot') {
      return myRoot;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInChecksClassMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
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
    return {closestIndex: closestValue};
  }

  PageLoaderElement get myRoot {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ChecksClassMixin', 'myRoot');
    }
    final element = $__root__;
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ChecksClassMixin', 'myRoot');
    }
    return returnMe;
  }
}
