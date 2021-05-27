// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unannotated.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $Unannotated extends Unannotated with $$Unannotated {
  PageLoaderElement $__root__;
  $Unannotated.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $Unannotated.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "Unannotated is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInUnannotated());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInUnannotated());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInUnannotated(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String findChain(List<dynamic> rawInternalIds, [String action = 'default']) {
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
    String Function(List<String>) closestValue;
    MapEntry<int, String Function(List<String>)> chain;
    chain = findChainInUnannotated(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    if (closestIndex < internalIds.length) {
      final value = closestValue(internalIds);
      return code[value] ?? value;
    }

    return rootNotFound
        ? null
        : PageObject.defaultCode[action] ?? PageObject.defaultCode['default'];
  }

  static String get tagName =>
      throw '"tagName" is not defined by Page Object "Unannotated". Requires @CheckTag annotation in order for "tagName" to be generated.';
  bool get isFieldSet {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Unannotated', 'isFieldSet');
    }
    final returnMe = super.isFieldSet;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Unannotated', 'isFieldSet');
    }
    return returnMe;
  }

  set myField(bool setValue) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Unannotated', 'myField');
    }
    super.myField = setValue;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Unannotated', 'myField');
    }
    return;
  }

  String noParameters() {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Unannotated', 'noParameters');
    }
    final returnMe = super.noParameters();
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Unannotated', 'noParameters');
    }
    return returnMe;
  }

  String _privateMethod(String s) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Unannotated', '_privateMethod');
    }
    final returnMe = super._privateMethod(s);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Unannotated', '_privateMethod');
    }
    return returnMe;
  }

  String oneParameter(String privateMe) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Unannotated', 'oneParameter');
    }
    final returnMe = super.oneParameter(privateMe);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Unannotated', 'oneParameter');
    }
    return returnMe;
  }

  int twoParameters(int a, int b) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Unannotated', 'twoParameters');
    }
    final returnMe = super.twoParameters(a, b);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Unannotated', 'twoParameters');
    }
    return returnMe;
  }

  String typeDefParameter(MyTypeDef typeDef) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Unannotated', 'typeDefParameter');
    }
    final returnMe = super.typeDefParameter(typeDef);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Unannotated', 'typeDefParameter');
    }
    return returnMe;
  }

  void noReturnType() {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Unannotated', 'noReturnType');
    }
    super.noReturnType();
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Unannotated', 'noReturnType');
    }
    return;
  }

  List<T> generateTypedList<T>() {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Unannotated', 'generateTypedList');
    }
    final returnMe = super.generateTypedList<T>();
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Unannotated', 'generateTypedList');
    }
    return returnMe;
  }

  String toStringDeep() => 'Unannotated\n\n${$__root__.toStringDeep()}';
}

mixin $$Unannotated on Unannotated {
  PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInUnannotated() {
    return {
      'isFieldSet': 'bool',
    };
  }

  Map<String, List<Map<String, String>>> testCreatorMethodsInUnannotated() {
    return {};
  }

  dynamic testCreatorInvokeMethodInUnannotated(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    if (methodName == 'isFieldSet') {
      return isFieldSet;
    }
    if (methodName == 'noParameters') {
      return Function.apply(noParameters, positionalArguments, namedArguments);
    }
    if (methodName == 'oneParameter') {
      return Function.apply(oneParameter, positionalArguments, namedArguments);
    }
    if (methodName == 'twoParameters') {
      return Function.apply(twoParameters, positionalArguments, namedArguments);
    }
    if (methodName == 'typeDefParameter') {
      return Function.apply(
          typeDefParameter, positionalArguments, namedArguments);
    }
    if (methodName == 'noReturnType') {
      return Function.apply(noReturnType, positionalArguments, namedArguments);
    }
    if (methodName == 'generateTypedList') {
      return Function.apply(
          generateTypedList, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInUnannotated(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
    return {closestIndex: closestValue};
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $UnannotatedUsingMixin extends UnannotatedUsingMixin
    with $$UnannotatedMixin, $$UnannotatedUsingMixin {
  PageLoaderElement $__root__;
  $UnannotatedUsingMixin.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $UnannotatedUsingMixin.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "UnannotatedUsingMixin is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInUnannotatedMixin());
    getters.addAll(testCreatorGettersInUnannotatedUsingMixin());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInUnannotatedMixin());
    methods.addAll(testCreatorMethodsInUnannotatedUsingMixin());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInUnannotatedUsingMixin(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    try {
      return testCreatorInvokeMethodInUnannotatedMixin(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String findChain(List<dynamic> rawInternalIds, [String action = 'default']) {
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
    String Function(List<String>) closestValue;
    MapEntry<int, String Function(List<String>)> chain;
    chain = findChainInUnannotatedUsingMixin(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    chain = findChainInUnannotatedMixin(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    if (closestIndex < internalIds.length) {
      final value = closestValue(internalIds);
      return code[value] ?? value;
    }

    return rootNotFound
        ? null
        : PageObject.defaultCode[action] ?? PageObject.defaultCode['default'];
  }

  static String get tagName =>
      throw '"tagName" is not defined by Page Object "UnannotatedUsingMixin". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() =>
      'UnannotatedUsingMixin\n\n${$__root__.toStringDeep()}';
}

mixin $$UnannotatedUsingMixin on UnannotatedUsingMixin {
  PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInUnannotatedUsingMixin() {
    return {};
  }

  Map<String, List<Map<String, String>>>
      testCreatorMethodsInUnannotatedUsingMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInUnannotatedUsingMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInUnannotatedUsingMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
    return {closestIndex: closestValue};
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$UnannotatedMixin on UnannotatedMixin {
  PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInUnannotatedMixin() {
    return {
      'isFieldSet': 'bool',
    };
  }

  Map<String, List<Map<String, String>>>
      testCreatorMethodsInUnannotatedMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInUnannotatedMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    if (methodName == 'isFieldSet') {
      return isFieldSet;
    }
    if (methodName == 'noParameters') {
      return Function.apply(noParameters, positionalArguments, namedArguments);
    }
    if (methodName == 'oneParameter') {
      return Function.apply(oneParameter, positionalArguments, namedArguments);
    }
    if (methodName == 'twoParameters') {
      return Function.apply(twoParameters, positionalArguments, namedArguments);
    }
    if (methodName == 'typeDefParameter') {
      return Function.apply(
          typeDefParameter, positionalArguments, namedArguments);
    }
    if (methodName == 'noReturnType') {
      return Function.apply(noReturnType, positionalArguments, namedArguments);
    }
    if (methodName == 'generateTypedList') {
      return Function.apply(
          generateTypedList, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInUnannotatedMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
    return {closestIndex: closestValue};
  }
}
