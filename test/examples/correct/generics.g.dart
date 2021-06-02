// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'generics.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $Generics<T> extends Generics<T> with $$Generics<T> {
  PageLoaderElement $__root__;
  $Generics.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $Generics.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "Generics is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInGenerics());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInGenerics());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInGenerics(
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
    chain = findChainInGenerics(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "Generics". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String typeDefParameter(T thing, MyGenericTypeDef<T> typeDef) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Generics', 'typeDefParameter');
    }
    final returnMe = super.typeDefParameter(thing, typeDef);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Generics', 'typeDefParameter');
    }
    return returnMe;
  }

  S exampleMethod<S>(S s) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Generics', 'exampleMethod');
    }
    final returnMe = super.exampleMethod<S>(s);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Generics', 'exampleMethod');
    }
    return returnMe;
  }

  String toStringDeep() => 'Generics\n\n${$__root__.toStringDeep()}';
}

mixin $$Generics<T> on Generics<T> {
/*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInGenerics() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>> testCreatorMethodsInGenerics() {
    return {};
  }

  dynamic testCreatorInvokeMethodInGenerics(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'typeDefParameter') {
      return Function.apply(
          typeDefParameter, positionalArguments, namedArguments);
    }
    if (methodName == 'exampleMethod') {
      return Function.apply(exampleMethod, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInGenerics(
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
class $CheckedGenerics<T> extends CheckedGenerics<T> with $$CheckedGenerics<T> {
  PageLoaderElement $__root__;
  $CheckedGenerics.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([CheckTag('checked-generics')]);
  }
  factory $CheckedGenerics.lookup(PageLoaderSource source) =>
      $CheckedGenerics.create(source.byTag('checked-generics'));
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInCheckedGenerics());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInCheckedGenerics());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInCheckedGenerics(
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
    chain = findChainInCheckedGenerics(internalIds, action).entries.first;
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

  static const String tagName = 'checked-generics';
  String typeDefParameter(T thing, MyGenericTypeDef<T> typeDef) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('CheckedGenerics', 'typeDefParameter');
    }
    final returnMe = super.typeDefParameter(thing, typeDef);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('CheckedGenerics', 'typeDefParameter');
    }
    return returnMe;
  }

  String toStringDeep() => 'CheckedGenerics\n\n${$__root__.toStringDeep()}';
}

mixin $$CheckedGenerics<T> on CheckedGenerics<T> {
/*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInCheckedGenerics() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInCheckedGenerics() {
    return {};
  }

  dynamic testCreatorInvokeMethodInCheckedGenerics(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'typeDefParameter') {
      return Function.apply(
          typeDefParameter, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInCheckedGenerics(
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
class $GenericPair<T, V> extends GenericPair<T, V> with $$GenericPair<T, V> {
  PageLoaderElement $__root__;
  $GenericPair.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $GenericPair.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "GenericPair is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInGenericPair());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInGenericPair());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInGenericPair(
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
    chain = findChainInGenericPair(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "GenericPair". Requires @CheckTag annotation in order for "tagName" to be generated.';
  Map<R, S> exampleMethodMap<R, S>(R r, S s) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('GenericPair', 'exampleMethodMap');
    }
    final returnMe = super.exampleMethodMap<R, S>(r, s);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('GenericPair', 'exampleMethodMap');
    }
    return returnMe;
  }

  String toStringDeep() => 'GenericPair\n\n${$__root__.toStringDeep()}';
}

mixin $$GenericPair<T, V> on GenericPair<T, V> {
/*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInGenericPair() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInGenericPair() {
    return {};
  }

  dynamic testCreatorInvokeMethodInGenericPair(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'exampleMethodMap') {
      return Function.apply(
          exampleMethodMap, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInGenericPair(
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
class $RootPo<T> extends RootPo<T> with $$RootPo<T> {
  PageLoaderElement $__root__;
  $RootPo.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $RootPo.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "RootPo is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInRootPo());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInRootPo());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInRootPo(
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
    chain = findChainInRootPo(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "RootPo". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'RootPo\n\n${$__root__.toStringDeep()}';
}

mixin $$RootPo<T> on RootPo<T> {
/*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInRootPo() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>> testCreatorMethodsInRootPo() {
    return {};
  }

  dynamic testCreatorInvokeMethodInRootPo(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'generics') {
      return generics;
    }
    if (methodName == 'checkedGenerics') {
      return checkedGenerics;
    }
    if (methodName == 'genericsList') {
      return genericsList;
    }
    if (methodName == 'checkedGenericsList') {
      return checkedGenericsList;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInRootPo(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      var genericsElement = this.generics as dynamic;
      var genericsIndex =
          internalIds.indexOf(genericsElement.$__root__.id as String);
      if (genericsIndex >= 0 && genericsIndex < closestIndex) {
        closestIndex = genericsIndex;
        closestValue = (ids) =>
            'generics.${genericsElement.findChain(ids, action)}'
                .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var checkedGenericsElement = this.checkedGenerics as dynamic;
      var checkedGenericsIndex =
          internalIds.indexOf(checkedGenericsElement.$__root__.id as String);
      if (checkedGenericsIndex >= 0 && checkedGenericsIndex < closestIndex) {
        closestIndex = checkedGenericsIndex;
        closestValue = (ids) =>
            'checkedGenerics.${checkedGenericsElement.findChain(ids, action)}'
                .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    final genericsListElements = this.genericsList;
    for (var elementIter = 0;
        elementIter < genericsListElements.length;
        elementIter++) {
      try {
        var genericsListElement = genericsListElements[elementIter] as dynamic;
        var genericsListIndex =
            internalIds.indexOf(genericsListElement.$__root__.id as String);
        if (genericsListIndex >= 0 && genericsListIndex < closestIndex) {
          closestIndex = genericsListIndex;
          closestValue = (ids) =>
              'genericsList[$elementIter].${genericsListElement.findChain(ids, action)}'
                  .replaceAll(RegExp('\\.\$'), '');
        }
      } catch (_) {
        // Ignored.
      }
    }
    final checkedGenericsListElements = this.checkedGenericsList;
    for (var elementIter = 0;
        elementIter < checkedGenericsListElements.length;
        elementIter++) {
      try {
        var checkedGenericsListElement =
            checkedGenericsListElements[elementIter] as dynamic;
        var checkedGenericsListIndex = internalIds
            .indexOf(checkedGenericsListElement.$__root__.id as String);
        if (checkedGenericsListIndex >= 0 &&
            checkedGenericsListIndex < closestIndex) {
          closestIndex = checkedGenericsListIndex;
          closestValue = (ids) =>
              'checkedGenericsList[$elementIter].${checkedGenericsListElement.findChain(ids, action)}'
                  .replaceAll(RegExp('\\.\$'), '');
        }
      } catch (_) {
        // Ignored.
      }
    }
    return {closestIndex: closestValue};
  }

  Generics<T> get generics {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootPo', 'generics');
    }
    final element = $__root__.createElement(ByTagName('x'), [], []);
    final returnMe = Generics<T>.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootPo', 'generics');
    }
    return returnMe;
  }

  CheckedGenerics<T> get checkedGenerics {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootPo', 'checkedGenerics');
    }
    final element =
        $__root__.createElement(ByTagName('checked-generics'), [], []);
    final returnMe = CheckedGenerics<T>.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootPo', 'checkedGenerics');
    }
    return returnMe;
  }

  PageObjectList<Generics<T>> get genericsList {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootPo', 'genericsList');
    }
    final returnMe = PageObjectList<Generics<T>>(
        $__root__.createList(ByTagName('y'), [], []),
        (PageLoaderElement e) => Generics<T>.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootPo', 'genericsList');
    }
    return returnMe;
  }

  PageObjectList<CheckedGenerics<T>> get checkedGenericsList {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootPo', 'checkedGenericsList');
    }
    final returnMe = PageObjectList<CheckedGenerics<T>>(
        $__root__.createList(ByTagName('checked-generics'), [], []),
        (PageLoaderElement e) => CheckedGenerics<T>.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootPo', 'checkedGenericsList');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $GenericsUsingMixin<T> extends GenericsUsingMixin<T>
    with $$GenericsMixin<T>, $$GenericsUsingMixin<T> {
  PageLoaderElement $__root__;
  $GenericsUsingMixin.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $GenericsUsingMixin.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "GenericsUsingMixin is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInGenericsMixin());
    getters.addAll(testCreatorGettersInGenericsUsingMixin());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInGenericsMixin());
    methods.addAll(testCreatorMethodsInGenericsUsingMixin());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInGenericsUsingMixin(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    try {
      return testCreatorInvokeMethodInGenericsMixin(
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
    chain = findChainInGenericsUsingMixin(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    chain = findChainInGenericsMixin(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "GenericsUsingMixin". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'GenericsUsingMixin\n\n${$__root__.toStringDeep()}';
}

mixin $$GenericsUsingMixin<T> on GenericsUsingMixin<T> {
/*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInGenericsUsingMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInGenericsUsingMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInGenericsUsingMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInGenericsUsingMixin(
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

mixin $$GenericsMixin<T> on GenericsMixin<T> {
/*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInGenericsMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInGenericsMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInGenericsMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'typeDefParameter') {
      return Function.apply(
          typeDefParameter, positionalArguments, namedArguments);
    }
    if (methodName == 'exampleMethod') {
      return Function.apply(exampleMethod, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInGenericsMixin(
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
class $GenericPairUsingMixin<T, V> extends GenericPairUsingMixin<T, V>
    with $$GenericPairMixin<T, V>, $$GenericPairUsingMixin<T, V> {
  PageLoaderElement $__root__;
  $GenericPairUsingMixin.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $GenericPairUsingMixin.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "GenericPairUsingMixin is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInGenericPairMixin());
    getters.addAll(testCreatorGettersInGenericPairUsingMixin());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInGenericPairMixin());
    methods.addAll(testCreatorMethodsInGenericPairUsingMixin());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInGenericPairUsingMixin(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    try {
      return testCreatorInvokeMethodInGenericPairMixin(
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
    chain = findChainInGenericPairUsingMixin(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    chain = findChainInGenericPairMixin(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "GenericPairUsingMixin". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() =>
      'GenericPairUsingMixin\n\n${$__root__.toStringDeep()}';
}

mixin $$GenericPairUsingMixin<T, V> on GenericPairUsingMixin<T, V> {
/*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInGenericPairUsingMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInGenericPairUsingMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInGenericPairUsingMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ >
      findChainInGenericPairUsingMixin(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    return {closestIndex: closestValue};
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$GenericPairMixin<T, V> on GenericPairMixin<T, V> {
/*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInGenericPairMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInGenericPairMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInGenericPairMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'exampleMethodMap') {
      return Function.apply(
          exampleMethodMap, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInGenericPairMixin(
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
class $RootPoUsingMixin<T> extends RootPoUsingMixin<T>
    with $$RootPoMixin<T>, $$RootPoUsingMixin<T> {
  PageLoaderElement $__root__;
  $RootPoUsingMixin.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $RootPoUsingMixin.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "RootPoUsingMixin is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInRootPoMixin());
    getters.addAll(testCreatorGettersInRootPoUsingMixin());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInRootPoMixin());
    methods.addAll(testCreatorMethodsInRootPoUsingMixin());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInRootPoUsingMixin(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    try {
      return testCreatorInvokeMethodInRootPoMixin(
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
    chain = findChainInRootPoUsingMixin(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    chain = findChainInRootPoMixin(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "RootPoUsingMixin". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'RootPoUsingMixin\n\n${$__root__.toStringDeep()}';
}

mixin $$RootPoUsingMixin<T> on RootPoUsingMixin<T> {
/*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInRootPoUsingMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInRootPoUsingMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInRootPoUsingMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInRootPoUsingMixin(
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

mixin $$RootPoMixin<T> on RootPoMixin<T> {
/*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInRootPoMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInRootPoMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInRootPoMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'generics') {
      return generics;
    }
    if (methodName == 'checkedGenerics') {
      return checkedGenerics;
    }
    if (methodName == 'genericsList') {
      return genericsList;
    }
    if (methodName == 'checkedGenericsList') {
      return checkedGenericsList;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInRootPoMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      var genericsElement = this.generics as dynamic;
      var genericsIndex =
          internalIds.indexOf(genericsElement.$__root__.id as String);
      if (genericsIndex >= 0 && genericsIndex < closestIndex) {
        closestIndex = genericsIndex;
        closestValue = (ids) =>
            'generics.${genericsElement.findChain(ids, action)}'
                .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var checkedGenericsElement = this.checkedGenerics as dynamic;
      var checkedGenericsIndex =
          internalIds.indexOf(checkedGenericsElement.$__root__.id as String);
      if (checkedGenericsIndex >= 0 && checkedGenericsIndex < closestIndex) {
        closestIndex = checkedGenericsIndex;
        closestValue = (ids) =>
            'checkedGenerics.${checkedGenericsElement.findChain(ids, action)}'
                .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    final genericsListElements = this.genericsList;
    for (var elementIter = 0;
        elementIter < genericsListElements.length;
        elementIter++) {
      try {
        var genericsListElement = genericsListElements[elementIter] as dynamic;
        var genericsListIndex =
            internalIds.indexOf(genericsListElement.$__root__.id as String);
        if (genericsListIndex >= 0 && genericsListIndex < closestIndex) {
          closestIndex = genericsListIndex;
          closestValue = (ids) =>
              'genericsList[$elementIter].${genericsListElement.findChain(ids, action)}'
                  .replaceAll(RegExp('\\.\$'), '');
        }
      } catch (_) {
        // Ignored.
      }
    }
    final checkedGenericsListElements = this.checkedGenericsList;
    for (var elementIter = 0;
        elementIter < checkedGenericsListElements.length;
        elementIter++) {
      try {
        var checkedGenericsListElement =
            checkedGenericsListElements[elementIter] as dynamic;
        var checkedGenericsListIndex = internalIds
            .indexOf(checkedGenericsListElement.$__root__.id as String);
        if (checkedGenericsListIndex >= 0 &&
            checkedGenericsListIndex < closestIndex) {
          closestIndex = checkedGenericsListIndex;
          closestValue = (ids) =>
              'checkedGenericsList[$elementIter].${checkedGenericsListElement.findChain(ids, action)}'
                  .replaceAll(RegExp('\\.\$'), '');
        }
      } catch (_) {
        // Ignored.
      }
    }
    return {closestIndex: closestValue};
  }

  Generics<T> get generics {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootPoMixin', 'generics');
    }
    final element = $__root__.createElement(ByTagName('x'), [], []);
    final returnMe = Generics<T>.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootPoMixin', 'generics');
    }
    return returnMe;
  }

  CheckedGenerics<T> get checkedGenerics {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootPoMixin', 'checkedGenerics');
    }
    final element =
        $__root__.createElement(ByTagName('checked-generics'), [], []);
    final returnMe = CheckedGenerics<T>.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootPoMixin', 'checkedGenerics');
    }
    return returnMe;
  }

  PageObjectList<Generics<T>> get genericsList {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootPoMixin', 'genericsList');
    }
    final returnMe = PageObjectList<Generics<T>>(
        $__root__.createList(ByTagName('y'), [], []),
        (PageLoaderElement e) => Generics<T>.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootPoMixin', 'genericsList');
    }
    return returnMe;
  }

  PageObjectList<CheckedGenerics<T>> get checkedGenericsList {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootPoMixin', 'checkedGenericsList');
    }
    final returnMe = PageObjectList<CheckedGenerics<T>>(
        $__root__.createList(ByTagName('checked-generics'), [], []),
        (PageLoaderElement e) => CheckedGenerics<T>.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootPoMixin', 'checkedGenericsList');
    }
    return returnMe;
  }
}
