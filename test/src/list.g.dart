// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'list.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$Lists on Lists {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInLists() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>> testCreatorMethodsInLists() {
    return {};
  }

  dynamic testCreatorInvokeMethodInLists(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'tableRows') {
      return tableRows;
    }
    if (methodName == 'tableRowsSync') {
      return tableRowsSync;
    }
    if (methodName == 'tableRowsSyncAsPO') {
      return tableRowsSyncAsPO;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInLists(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    final tableRowsSyncAsPOElements = this.tableRowsSyncAsPO;
    for (var elementIter = 0;
        elementIter < tableRowsSyncAsPOElements.length;
        elementIter++) {
      try {
        var tableRowsSyncAsPOElement =
            tableRowsSyncAsPOElements[elementIter] as dynamic;
        var tableRowsSyncAsPOIndex = internalIds
            .indexOf(tableRowsSyncAsPOElement.$__root__.id as String);
        if (tableRowsSyncAsPOIndex >= 0 &&
            tableRowsSyncAsPOIndex < closestIndex) {
          closestIndex = tableRowsSyncAsPOIndex;
          closestValue = (ids) =>
              'tableRowsSyncAsPO[$elementIter].${tableRowsSyncAsPOElement.findChain(ids, action)}'
                  .replaceAll(RegExp('\\.\$'), '');
        }
      } catch (_) {
        // Ignored.
      }
    }
    final tableRowsSyncElements = this.tableRowsSync;
    for (var elementIter = 0;
        elementIter < tableRowsSyncElements.length;
        elementIter++) {
      try {
        var tableRowsSyncIndex =
            internalIds.indexOf(tableRowsSyncElements[elementIter].id);
        if (tableRowsSyncIndex >= 0 && tableRowsSyncIndex < closestIndex) {
          closestIndex = tableRowsSyncIndex;
          closestValue = (_) =>
              'tableRowsSync[$elementIter].${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
        }
      } catch (_) {
        // Ignored.
      }
    }
    return {closestIndex: closestValue};
  }

  Future<PageObjectList<PageLoaderElement>> get tableRows async {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Lists', 'tableRows');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByTagName('tr'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Lists', 'tableRows');
    }
    return returnMe;
  }

  PageObjectList<PageLoaderElement> get tableRowsSync {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Lists', 'tableRowsSync');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByTagName('tr'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Lists', 'tableRowsSync');
    }
    return returnMe;
  }

  PageObjectList<RowPO> get tableRowsSyncAsPO {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Lists', 'tableRowsSyncAsPO');
    }
    final returnMe = PageObjectList<RowPO>(
        $__root__.createList(ByTagName('tr'), [], []),
        (PageLoaderElement e) => RowPO.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Lists', 'tableRowsSyncAsPO');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$RowPO on RowPO {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInRowPO() {
    return {
      'exists': 'bool',
    };
  }

  Map<String, List<Map<String, String /*?*/ >>> testCreatorMethodsInRowPO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInRowPO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'exists') {
      return exists;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInRowPO(
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
      __listener.startPageObjectMethod('RowPO', '_root');
    }
    final element = $__root__;
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RowPO', '_root');
    }
    return returnMe;
  }
}
