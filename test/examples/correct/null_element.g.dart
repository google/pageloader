// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'null_element.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
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
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInParentRoot());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInParentRoot(
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
    chain = findChainInParentRoot(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "ParentRoot". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'ParentRoot\n\n${$__root__.toStringDeep()}';
}

mixin $$ParentRoot on ParentRoot {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderPointer __pointer__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInParentRoot() {
    return {};
  }

  Map<String, List<Map<String, String>>> testCreatorMethodsInParentRoot() {
    return {};
  }

  dynamic testCreatorInvokeMethodInParentRoot(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    if (methodName == 'gens') {
      return gens;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInParentRoot(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
    try {
      var _nullPOElement = this._nullPO as dynamic;
      var _nullPOIndex = internalIds.indexOf(_nullPOElement.$__root__.id);
      if (_nullPOIndex >= 0 && _nullPOIndex < closestIndex) {
        closestIndex = _nullPOIndex;
        closestValue = (ids) =>
            '_nullPO.${_nullPOElement.findChain(ids, action)}'
                .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var gensElement = this.gens as dynamic;
      var gensIndex = internalIds.indexOf(gensElement.$__root__.id);
      if (gensIndex >= 0 && gensIndex < closestIndex) {
        closestIndex = gensIndex;
        closestValue = (ids) => 'gens.${gensElement.findChain(ids, action)}'
            .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var _nullElementIndex = internalIds.indexOf(this._nullElement.id);
      if (_nullElementIndex >= 0 && _nullElementIndex < closestIndex) {
        closestIndex = _nullElementIndex;
        closestValue = (_) =>
            '_nullElement.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get _nullElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ParentRoot', '_nullElement');
    }
    final element = NullPageLoaderElement();
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ParentRoot', '_nullElement');
    }
    return returnMe;
  }

  NullPO get _nullPO {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ParentRoot', '_nullPO');
    }
    final element = NullPageLoaderElement();
    final returnMe = NullPO.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ParentRoot', '_nullPO');
    }
    return returnMe;
  }

  Generics<String> get gens {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ParentRoot', 'gens');
    }
    final element = NullPageLoaderElement();
    final returnMe = Generics<String>.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ParentRoot', 'gens');
    }
    return returnMe;
  }
}

// ignore_for_file: private_collision_in_mixin_application
// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $NullPO extends NullPO with $$NullPO {
  PageLoaderElement $__root__;
  $NullPO.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $NullPO.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "NullPO is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInNullPO());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInNullPO());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInNullPO(
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
    chain = findChainInNullPO(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "NullPO". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'NullPO\n\n${$__root__.toStringDeep()}';
}

mixin $$NullPO on NullPO {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderPointer __pointer__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInNullPO() {
    return {};
  }

  Map<String, List<Map<String, String>>> testCreatorMethodsInNullPO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInNullPO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInNullPO(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
    return {closestIndex: closestValue};
  }
}

// ignore_for_file: private_collision_in_mixin_application
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
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInGenerics());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInGenerics(
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
    chain = findChainInGenerics(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "Generics". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'Generics\n\n${$__root__.toStringDeep()}';
}

mixin $$Generics<T> on Generics<T> {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderPointer __pointer__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInGenerics() {
    return {};
  }

  Map<String, List<Map<String, String>>> testCreatorMethodsInGenerics() {
    return {};
  }

  dynamic testCreatorInvokeMethodInGenerics(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInGenerics(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
    return {closestIndex: closestValue};
  }
}
