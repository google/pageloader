// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_list_page_objects.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $PageForSimpleTest extends PageForSimpleTest with $$PageForSimpleTest {
  PageLoaderElement $__root__;
  $PageForSimpleTest.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageForSimpleTest.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageForSimpleTest is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageForSimpleTest());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInPageForSimpleTest());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageForSimpleTest(
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
    chain = findChainInPageForSimpleTest(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "PageForSimpleTest". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'PageForSimpleTest\n\n${$__root__.toStringDeep()}';
}

mixin $$PageForSimpleTest on PageForSimpleTest {
  PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForSimpleTest() {
    return {};
  }

  Map<String, List<Map<String, String>>>
      testCreatorMethodsInPageForSimpleTest() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForSimpleTest(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    if (methodName == 'rootElement') {
      return rootElement;
    }
    if (methodName == 'table') {
      return table;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInPageForSimpleTest(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
    try {
      var tableElement = this.table as dynamic;
      var tableIndex = internalIds.indexOf(tableElement.$__root__.id as String);
      if (tableIndex >= 0 && tableIndex < closestIndex) {
        closestIndex = tableIndex;
        closestValue = (ids) => 'table.${tableElement.findChain(ids, action)}'
            .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
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
    return {closestIndex: closestValue};
  }

  PageLoaderElement get rootElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForSimpleTest', 'rootElement');
    }
    final element = $__root__;
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForSimpleTest', 'rootElement');
    }
    return returnMe;
  }

  Table get table {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForSimpleTest', 'table');
    }
    final element = $__root__.createElement(ByTagName('table'), [], []);
    final returnMe = Table.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForSimpleTest', 'table');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $Table extends Table with $$Table {
  PageLoaderElement $__root__;
  $Table.create(PageLoaderElement currentContext) : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $Table.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "Table is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInTable());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInTable());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInTable(
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
    chain = findChainInTable(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "Table". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'Table\n\n${$__root__.toStringDeep()}';
}

mixin $$Table on Table {
  PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInTable() {
    return {};
  }

  Map<String, List<Map<String, String>>> testCreatorMethodsInTable() {
    return {};
  }

  dynamic testCreatorInvokeMethodInTable(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    if (methodName == 'table') {
      return table;
    }
    if (methodName == 'rows') {
      return rows;
    }
    if (methodName == 'rowsSync') {
      return rowsSync;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInTable(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
    final rowsSyncElements = this.rowsSync;
    for (var elementIter = 0;
        elementIter < rowsSyncElements.length;
        elementIter++) {
      try {
        var rowsSyncElement = rowsSyncElements[elementIter] as dynamic;
        var rowsSyncIndex =
            internalIds.indexOf(rowsSyncElement.$__root__.id as String);
        if (rowsSyncIndex >= 0 && rowsSyncIndex < closestIndex) {
          closestIndex = rowsSyncIndex;
          closestValue = (ids) =>
              'rowsSync[$elementIter].${rowsSyncElement.findChain(ids, action)}'
                  .replaceAll(RegExp('\\.\$'), '');
        }
      } catch (_) {
        // Ignored.
      }
    }
    try {
      var tableIndex = internalIds.indexOf(this.table.id);
      if (tableIndex >= 0 && tableIndex < closestIndex) {
        closestIndex = tableIndex;
        closestValue = (_) =>
            'table.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get table {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Table', 'table');
    }
    final element = $__root__;
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Table', 'table');
    }
    return returnMe;
  }

  Future<PageObjectList<Row>> get rows async {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Table', 'rows');
    }
    final returnMe = PageObjectList<Row>(
        $__root__.createList(ByTagName('tr'), [], []),
        (PageLoaderElement e) => Row.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Table', 'rows');
    }
    return returnMe;
  }

  PageObjectList<Row> get rowsSync {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Table', 'rowsSync');
    }
    final returnMe = PageObjectList<Row>(
        $__root__.createList(ByTagName('tr'), [], []),
        (PageLoaderElement e) => Row.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Table', 'rowsSync');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $Row extends Row with $$Row {
  PageLoaderElement $__root__;
  $Row.create(PageLoaderElement currentContext) : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $Row.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "Row is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInRow());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInRow());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInRow(
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
    chain = findChainInRow(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "Row". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'Row\n\n${$__root__.toStringDeep()}';
}

mixin $$Row on Row {
  PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInRow() {
    return {};
  }

  Map<String, List<Map<String, String>>> testCreatorMethodsInRow() {
    return {};
  }

  dynamic testCreatorInvokeMethodInRow(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    if (methodName == 'rootElement') {
      return rootElement;
    }
    if (methodName == 'cells') {
      return cells;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInRow(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
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
    return {closestIndex: closestValue};
  }

  PageLoaderElement get rootElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Row', 'rootElement');
    }
    final element = $__root__;
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Row', 'rootElement');
    }
    return returnMe;
  }

  Future<PageObjectList<PageLoaderElement>> get cells async {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Row', 'cells');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByTagName('td'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Row', 'cells');
    }
    return returnMe;
  }
}
