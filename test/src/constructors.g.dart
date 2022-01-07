// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'constructors.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$BasePO on BasePO {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInBasePO() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>> testCreatorMethodsInBasePO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInBasePO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'bTagPO') {
      return bTagPO;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInBasePO(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      var bTagPOElement = this.bTagPO as dynamic;
      var bTagPOIndex =
          internalIds.indexOf(bTagPOElement.$__root__.id as String);
      if (bTagPOIndex >= 0 && bTagPOIndex < closestIndex) {
        closestIndex = bTagPOIndex;
        closestValue = (ids) => 'bTagPO.${bTagPOElement.findChain(ids, action)}'
            .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  BCustomTagPO get bTagPO {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BasePO', 'bTagPO');
    }
    final element =
        $__root__.createElement(ByTagName(BCustomTagPO.tagName), [], []);
    final returnMe = BCustomTagPO.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BasePO', 'bTagPO');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$BCustomTagPO on BCustomTagPO {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInBCustomTagPO() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInBCustomTagPO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInBCustomTagPO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInBCustomTagPO(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      var rootElementIndex = internalIds.indexOf(this.rootElement.id);
      if (rootElementIndex >= 0 && rootElementIndex < closestIndex) {
        closestIndex = rootElementIndex;
        closestValue = (_) =>
            'rootElement.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      // Do not know the type. Try it out and ignore if not successful.
      var _utilsElement = this._utils as dynamic;
      var _utilsIndex =
          internalIds.indexOf(_utilsElement.$__root__.id as String);
      if (_utilsIndex >= 0 && _utilsIndex < closestIndex) {
        closestIndex = _utilsIndex;
        closestValue = (ids) => '_utils.${_utilsElement.findChain(ids, action)}'
            .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    try {
      // Do not know the type. Try it out and ignore if not successful.
      var cTagFromPLEElement = this.cTagFromPLE as dynamic;
      var cTagFromPLEIndex =
          internalIds.indexOf(cTagFromPLEElement.$__root__.id as String);
      if (cTagFromPLEIndex >= 0 && cTagFromPLEIndex < closestIndex) {
        closestIndex = cTagFromPLEIndex;
        closestValue = (ids) =>
            'cTagFromPLE.${cTagFromPLEElement.findChain(ids, action)}'
                .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    try {
      // Do not know the type. Try it out and ignore if not successful.
      var cTagFromUtilsElement = this.cTagFromUtils as dynamic;
      var cTagFromUtilsIndex =
          internalIds.indexOf(cTagFromUtilsElement.$__root__.id as String);
      if (cTagFromUtilsIndex >= 0 && cTagFromUtilsIndex < closestIndex) {
        closestIndex = cTagFromUtilsIndex;
        closestValue = (ids) =>
            'cTagFromUtils.${cTagFromUtilsElement.findChain(ids, action)}'
                .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    try {
      // Do not know the type. Try it out and ignore if not successful.
      var noLookupPOElement = this.noLookupPO as dynamic;
      var noLookupPOIndex =
          internalIds.indexOf(noLookupPOElement.$__root__.id as String);
      if (noLookupPOIndex >= 0 && noLookupPOIndex < closestIndex) {
        closestIndex = noLookupPOIndex;
        closestValue = (ids) =>
            'noLookupPO.${noLookupPOElement.findChain(ids, action)}'
                .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var _rootIndex = internalIds.indexOf(this._root.id);
      if (_rootIndex >= 0 && _rootIndex < closestIndex) {
        closestIndex = _rootIndex;
        closestValue = (_) =>
            '_root.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get _root {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BCustomTagPO', '_root');
    }
    final element = $__root__;
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BCustomTagPO', '_root');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$CCustomTagPO on CCustomTagPO {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInCCustomTagPO() {
    return {
      'innerText': 'String',
    };
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInCCustomTagPO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInCCustomTagPO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'innerText') {
      return innerText;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInCCustomTagPO(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      var _rootIndex = internalIds.indexOf(this._root.id);
      if (_rootIndex >= 0 && _rootIndex < closestIndex) {
        closestIndex = _rootIndex;
        closestValue = (_) =>
            '_root.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get _root {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('CCustomTagPO', '_root');
    }
    final element = $__root__;
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('CCustomTagPO', '_root');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$NoLookupPO on NoLookupPO {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInNoLookupPO() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInNoLookupPO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInNoLookupPO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInNoLookupPO(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    return {closestIndex: closestValue};
  }
}
