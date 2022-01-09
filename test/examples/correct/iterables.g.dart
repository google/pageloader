// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'iterables.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $Iterables extends Iterables with $$Iterables {
  PageLoaderElement $__root__;
  $Iterables.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $Iterables.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "Iterables is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInIterables());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInIterables());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInIterables(
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
    chain = findChainInIterables(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "Iterables". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'Iterables\n\n${$__root__.toStringDeep()}';
}

mixin $$Iterables on Iterables {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInIterables() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInIterables() {
    return {};
  }

  dynamic testCreatorInvokeMethodInIterables(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'basics') {
      return basics;
    }
    if (methodName == 'nested') {
      return nested;
    }
    if (methodName == 'checkTagPO') {
      return checkTagPO;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInIterables(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    return {closestIndex: closestValue};
  }

  PageObjectIterable<PageLoaderElement> get basics {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Iterables', 'basics');
    }
    final returnMe = PageObjectIterable<PageLoaderElement>(
        $__root__.createIterable(ByCss('basic'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Iterables', 'basics');
    }
    return returnMe;
  }

  PageObjectIterable<InnerObject> get nested {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Iterables', 'nested');
    }
    final returnMe = PageObjectIterable<InnerObject>(
        $__root__.createIterable(ByCss('nested'), [], []),
        (PageLoaderElement e) => InnerObject.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Iterables', 'nested');
    }
    return returnMe;
  }

  PageObjectIterable<CheckTagPO> get checkTagPO {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Iterables', 'checkTagPO');
    }
    final returnMe = PageObjectIterable<CheckTagPO>(
        $__root__.createIterable(ByTagName('check-tag-po'), [], []),
        (PageLoaderElement e) => CheckTagPO.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Iterables', 'checkTagPO');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $InnerObject extends InnerObject with $$InnerObject {
  PageLoaderElement $__root__;
  $InnerObject.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $InnerObject.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "InnerObject is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInInnerObject());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInInnerObject());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInInnerObject(
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
    chain = findChainInInnerObject(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "InnerObject". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'InnerObject\n\n${$__root__.toStringDeep()}';
}

mixin $$InnerObject on InnerObject {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInInnerObject() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInInnerObject() {
    return {};
  }

  dynamic testCreatorInvokeMethodInInnerObject(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'single') {
      return single;
    }
    if (methodName == 'innerIterable') {
      return innerIterable;
    }
    if (methodName == 'innerCheckTagPO') {
      return innerCheckTagPO;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInInnerObject(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      var singleIndex = internalIds.indexOf(this.single.id);
      if (singleIndex >= 0 && singleIndex < closestIndex) {
        closestIndex = singleIndex;
        closestValue = (_) =>
            'single.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get single {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('InnerObject', 'single');
    }
    final element = $__root__.createElement(ByCss('single'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('InnerObject', 'single');
    }
    return returnMe;
  }

  PageObjectIterable<PageLoaderElement> get innerIterable {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('InnerObject', 'innerIterable');
    }
    final returnMe = PageObjectIterable<PageLoaderElement>(
        $__root__.createIterable(ByCss('nested-iterable'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('InnerObject', 'innerIterable');
    }
    return returnMe;
  }

  PageObjectIterable<CheckTagPO> get innerCheckTagPO {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('InnerObject', 'innerCheckTagPO');
    }
    final returnMe = PageObjectIterable<CheckTagPO>(
        $__root__.createIterable(ByTagName('check-tag-po'), [], []),
        (PageLoaderElement e) => CheckTagPO.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('InnerObject', 'innerCheckTagPO');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $IterablesUsingMixin extends IterablesUsingMixin
    with $$IterablesMixin, $$IterablesUsingMixin {
  PageLoaderElement $__root__;
  $IterablesUsingMixin.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $IterablesUsingMixin.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "IterablesUsingMixin is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInIterablesMixin());
    getters.addAll(testCreatorGettersInIterablesUsingMixin());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInIterablesMixin());
    methods.addAll(testCreatorMethodsInIterablesUsingMixin());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInIterablesUsingMixin(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    try {
      return testCreatorInvokeMethodInIterablesMixin(
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
    chain = findChainInIterablesUsingMixin(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    chain = findChainInIterablesMixin(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "IterablesUsingMixin". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'IterablesUsingMixin\n\n${$__root__.toStringDeep()}';
}

mixin $$IterablesUsingMixin on IterablesUsingMixin {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInIterablesUsingMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInIterablesUsingMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInIterablesUsingMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInIterablesUsingMixin(
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

mixin $$IterablesMixin on IterablesMixin {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInIterablesMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInIterablesMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInIterablesMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'basics') {
      return basics;
    }
    if (methodName == 'nested') {
      return nested;
    }
    if (methodName == 'checkTagPO') {
      return checkTagPO;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInIterablesMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    return {closestIndex: closestValue};
  }

  PageObjectIterable<PageLoaderElement> get basics {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('IterablesMixin', 'basics');
    }
    final returnMe = PageObjectIterable<PageLoaderElement>(
        $__root__.createIterable(ByCss('basic'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('IterablesMixin', 'basics');
    }
    return returnMe;
  }

  PageObjectIterable<InnerObjectUsingMixin> get nested {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('IterablesMixin', 'nested');
    }
    final returnMe = PageObjectIterable<InnerObjectUsingMixin>(
        $__root__.createIterable(ByCss('nested'), [], []),
        (PageLoaderElement e) => InnerObjectUsingMixin.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('IterablesMixin', 'nested');
    }
    return returnMe;
  }

  PageObjectIterable<CheckTagPO> get checkTagPO {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('IterablesMixin', 'checkTagPO');
    }
    final returnMe = PageObjectIterable<CheckTagPO>(
        $__root__.createIterable(ByTagName('check-tag-po'), [], []),
        (PageLoaderElement e) => CheckTagPO.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('IterablesMixin', 'checkTagPO');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $InnerObjectUsingMixin extends InnerObjectUsingMixin
    with $$InnerObjectMixin, $$InnerObjectUsingMixin {
  PageLoaderElement $__root__;
  $InnerObjectUsingMixin.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $InnerObjectUsingMixin.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "InnerObjectUsingMixin is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInInnerObjectMixin());
    getters.addAll(testCreatorGettersInInnerObjectUsingMixin());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInInnerObjectMixin());
    methods.addAll(testCreatorMethodsInInnerObjectUsingMixin());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInInnerObjectUsingMixin(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    try {
      return testCreatorInvokeMethodInInnerObjectMixin(
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
    chain = findChainInInnerObjectUsingMixin(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    chain = findChainInInnerObjectMixin(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "InnerObjectUsingMixin". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() =>
      'InnerObjectUsingMixin\n\n${$__root__.toStringDeep()}';
}

mixin $$InnerObjectUsingMixin on InnerObjectUsingMixin {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInInnerObjectUsingMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInInnerObjectUsingMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInInnerObjectUsingMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ >
      findChainInInnerObjectUsingMixin(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    return {closestIndex: closestValue};
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$InnerObjectMixin on InnerObjectMixin {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInInnerObjectMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInInnerObjectMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInInnerObjectMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'single') {
      return single;
    }
    if (methodName == 'innerIterable') {
      return innerIterable;
    }
    if (methodName == 'innerCheckTagPO') {
      return innerCheckTagPO;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInInnerObjectMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      var singleIndex = internalIds.indexOf(this.single.id);
      if (singleIndex >= 0 && singleIndex < closestIndex) {
        closestIndex = singleIndex;
        closestValue = (_) =>
            'single.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get single {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('InnerObjectMixin', 'single');
    }
    final element = $__root__.createElement(ByCss('single'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('InnerObjectMixin', 'single');
    }
    return returnMe;
  }

  PageObjectIterable<PageLoaderElement> get innerIterable {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('InnerObjectMixin', 'innerIterable');
    }
    final returnMe = PageObjectIterable<PageLoaderElement>(
        $__root__.createIterable(ByCss('nested-iterable'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('InnerObjectMixin', 'innerIterable');
    }
    return returnMe;
  }

  PageObjectIterable<CheckTagPO> get innerCheckTagPO {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('InnerObjectMixin', 'innerCheckTagPO');
    }
    final returnMe = PageObjectIterable<CheckTagPO>(
        $__root__.createIterable(ByTagName('check-tag-po'), [], []),
        (PageLoaderElement e) => CheckTagPO.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('InnerObjectMixin', 'innerCheckTagPO');
    }
    return returnMe;
  }
}
