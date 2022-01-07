// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'null_element.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

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
    if (methodName == 'gens') {
      return gens;
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
      var _nullPOElement = this._nullPO as dynamic;
      var _nullPOIndex =
          internalIds.indexOf(_nullPOElement.$__root__.id as String);
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
      var gensIndex = internalIds.indexOf(gensElement.$__root__.id as String);
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

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$NullPO on NullPO {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInNullPO() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>> testCreatorMethodsInNullPO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInNullPO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInNullPO(
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
