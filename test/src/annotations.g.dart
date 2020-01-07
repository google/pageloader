// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotations.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $BaseObject extends BaseObject with $$BaseObject {
  PageLoaderElement $__root__;
  $BaseObject.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $BaseObject.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "BaseObject is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInBaseObject());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInBaseObject());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInBaseObject(
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
    chain = findChainInBaseObject(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "BaseObject". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'BaseObject\n\n${$__root__.toStringDeep()}';
}

mixin $$BaseObject on BaseObject {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderPointer __pointer__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInBaseObject() {
    return {};
  }

  Map<String, List<Map<String, String>>> testCreatorMethodsInBaseObject() {
    return {};
  }

  dynamic testCreatorInvokeMethodInBaseObject(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    if (methodName == 'table') {
      return table;
    }
    if (methodName == 'tableUsingCheckedTag') {
      return tableUsingCheckedTag;
    }
    if (methodName == 'globalTable') {
      return globalTable;
    }
    if (methodName == 'badTable') {
      return badTable;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInBaseObject(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
    try {
      var tableElement = this.table as dynamic;
      var tableIndex = internalIds.indexOf(tableElement.$__root__.id);
      if (tableIndex >= 0 && tableIndex < closestIndex) {
        closestIndex = tableIndex;
        closestValue = (ids) => 'table.${tableElement.findChain(ids, action)}'
            .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var tableUsingCheckedTagElement = this.tableUsingCheckedTag as dynamic;
      var tableUsingCheckedTagIndex =
          internalIds.indexOf(tableUsingCheckedTagElement.$__root__.id);
      if (tableUsingCheckedTagIndex >= 0 &&
          tableUsingCheckedTagIndex < closestIndex) {
        closestIndex = tableUsingCheckedTagIndex;
        closestValue = (ids) =>
            'tableUsingCheckedTag.${tableUsingCheckedTagElement.findChain(ids, action)}'
                .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var badTableElement = this.badTable as dynamic;
      var badTableIndex = internalIds.indexOf(badTableElement.$__root__.id);
      if (badTableIndex >= 0 && badTableIndex < closestIndex) {
        closestIndex = badTableIndex;
        closestValue = (ids) =>
            'badTable.${badTableElement.findChain(ids, action)}'
                .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var globalTableIndex = internalIds.indexOf(this.globalTable.id);
      if (globalTableIndex >= 0 && globalTableIndex < closestIndex) {
        closestIndex = globalTableIndex;
        closestValue = (_) =>
            'globalTable.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  TableForCheckTag get table {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BaseObject', 'table');
    }
    final element = $__root__.createElement(ByTagName('table'), [], []);
    final returnMe = TableForCheckTag.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BaseObject', 'table');
    }
    return returnMe;
  }

  TableForCheckTag get tableUsingCheckedTag {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BaseObject', 'tableUsingCheckedTag');
    }
    final element = $__root__.createElement(ByTagName('table'), [], []);
    final returnMe = TableForCheckTag.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BaseObject', 'tableUsingCheckedTag');
    }
    return returnMe;
  }

  PageLoaderElement get globalTable {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BaseObject', 'globalTable');
    }
    final element = $__root__.createElement(Global(ByTagName('table')), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BaseObject', 'globalTable');
    }
    return returnMe;
  }

  CheckTagFails get badTable {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BaseObject', 'badTable');
    }
    final element = $__root__.createElement(ByTagName('table'), [], []);
    final returnMe = CheckTagFails.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BaseObject', 'badTable');
    }
    return returnMe;
  }
}

// ignore_for_file: private_collision_in_mixin_application
// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $PseudoBaseObject extends PseudoBaseObject with $$PseudoBaseObject {
  PageLoaderElement $__root__;
  $PseudoBaseObject.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PseudoBaseObject.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PseudoBaseObject is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPseudoBaseObject());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInPseudoBaseObject());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInPseudoBaseObject(
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
    chain = findChainInPseudoBaseObject(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "PseudoBaseObject". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'PseudoBaseObject\n\n${$__root__.toStringDeep()}';
}

mixin $$PseudoBaseObject on PseudoBaseObject {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderPointer __pointer__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPseudoBaseObject() {
    return {};
  }

  Map<String, List<Map<String, String>>>
      testCreatorMethodsInPseudoBaseObject() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPseudoBaseObject(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    if (methodName == 'table') {
      return table;
    }
    if (methodName == 'globalTable') {
      return globalTable;
    }
    if (methodName == 'badTable') {
      return badTable;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInPseudoBaseObject(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
    try {
      var tableElement = this.table as dynamic;
      var tableIndex = internalIds.indexOf(tableElement.$__root__.id);
      if (tableIndex >= 0 && tableIndex < closestIndex) {
        closestIndex = tableIndex;
        closestValue = (ids) => 'table.${tableElement.findChain(ids, action)}'
            .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var badTableElement = this.badTable as dynamic;
      var badTableIndex = internalIds.indexOf(badTableElement.$__root__.id);
      if (badTableIndex >= 0 && badTableIndex < closestIndex) {
        closestIndex = badTableIndex;
        closestValue = (ids) =>
            'badTable.${badTableElement.findChain(ids, action)}'
                .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var globalTableIndex = internalIds.indexOf(this.globalTable.id);
      if (globalTableIndex >= 0 && globalTableIndex < closestIndex) {
        closestIndex = globalTableIndex;
        closestValue = (_) =>
            'globalTable.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  TableForCheckTag get table {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PseudoBaseObject', 'table');
    }
    final element = $__root__.createElement(PseudoByTagName('table'), [], []);
    final returnMe = TableForCheckTag.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PseudoBaseObject', 'table');
    }
    return returnMe;
  }

  PageLoaderElement get globalTable {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PseudoBaseObject', 'globalTable');
    }
    final element =
        $__root__.createElement(Global(PseudoByTagName('table')), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PseudoBaseObject', 'globalTable');
    }
    return returnMe;
  }

  CheckTagFails get badTable {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PseudoBaseObject', 'badTable');
    }
    final element = $__root__.createElement(PseudoByTagName('table'), [], []);
    final returnMe = CheckTagFails.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PseudoBaseObject', 'badTable');
    }
    return returnMe;
  }
}

// ignore_for_file: private_collision_in_mixin_application
// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $TableForCheckTag extends TableForCheckTag with $$TableForCheckTag {
  PageLoaderElement $__root__;
  $TableForCheckTag.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([CheckTag('table')]);
  }
  factory $TableForCheckTag.lookup(PageLoaderSource source) =>
      $TableForCheckTag.create(source.byTag('table'));
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInTableForCheckTag());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInTableForCheckTag());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInTableForCheckTag(
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
    chain = findChainInTableForCheckTag(internalIds, action).entries.first;
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

  static const String tagName = 'table';
  String toStringDeep() => 'TableForCheckTag\n\n${$__root__.toStringDeep()}';
}

mixin $$TableForCheckTag on TableForCheckTag {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderPointer __pointer__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInTableForCheckTag() {
    return {};
  }

  Map<String, List<Map<String, String>>>
      testCreatorMethodsInTableForCheckTag() {
    return {};
  }

  dynamic testCreatorInvokeMethodInTableForCheckTag(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    if (methodName == 'table') {
      return table;
    }
    if (methodName == 'globalTable') {
      return globalTable;
    }
    if (methodName == 'rows') {
      return rows;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInTableForCheckTag(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
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
    try {
      var globalTableIndex = internalIds.indexOf(this.globalTable.id);
      if (globalTableIndex >= 0 && globalTableIndex < closestIndex) {
        closestIndex = globalTableIndex;
        closestValue = (_) =>
            'globalTable.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get table {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('TableForCheckTag', 'table');
    }
    final element = $__root__;
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('TableForCheckTag', 'table');
    }
    return returnMe;
  }

  PageLoaderElement get globalTable {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('TableForCheckTag', 'globalTable');
    }
    final element = $__root__.createElement(Global(ByTagName('table')), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('TableForCheckTag', 'globalTable');
    }
    return returnMe;
  }

  PageObjectIterable<Row> get rows {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('TableForCheckTag', 'rows');
    }
    final returnMe = PageObjectIterable<Row>(
        $__root__.createIterable(ByTagName('tr'), [], []),
        (PageLoaderElement e) => Row.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('TableForCheckTag', 'rows');
    }
    return returnMe;
  }
}

// ignore_for_file: private_collision_in_mixin_application
// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $BaseEnsureObject extends BaseEnsureObject with $$BaseEnsureObject {
  PageLoaderElement $__root__;
  $BaseEnsureObject.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $BaseEnsureObject.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "BaseEnsureObject is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInBaseEnsureObject());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInBaseEnsureObject());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInBaseEnsureObject(
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
    chain = findChainInBaseEnsureObject(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "BaseEnsureObject". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'BaseEnsureObject\n\n${$__root__.toStringDeep()}';
}

mixin $$BaseEnsureObject on BaseEnsureObject {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderPointer __pointer__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInBaseEnsureObject() {
    return {};
  }

  Map<String, List<Map<String, String>>>
      testCreatorMethodsInBaseEnsureObject() {
    return {};
  }

  dynamic testCreatorInvokeMethodInBaseEnsureObject(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    if (methodName == 'table') {
      return table;
    }
    if (methodName == 'badTable') {
      return badTable;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInBaseEnsureObject(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
    try {
      var tableElement = this.table as dynamic;
      var tableIndex = internalIds.indexOf(tableElement.$__root__.id);
      if (tableIndex >= 0 && tableIndex < closestIndex) {
        closestIndex = tableIndex;
        closestValue = (ids) => 'table.${tableElement.findChain(ids, action)}'
            .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var badTableElement = this.badTable as dynamic;
      var badTableIndex = internalIds.indexOf(badTableElement.$__root__.id);
      if (badTableIndex >= 0 && badTableIndex < closestIndex) {
        closestIndex = badTableIndex;
        closestValue = (ids) =>
            'badTable.${badTableElement.findChain(ids, action)}'
                .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  TableForEnsureTag get table {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BaseEnsureObject', 'table');
    }
    final element = $__root__.createElement(ByTagName('table'), [], []);
    final returnMe = TableForEnsureTag.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BaseEnsureObject', 'table');
    }
    return returnMe;
  }

  EnsureTagFails get badTable {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BaseEnsureObject', 'badTable');
    }
    final element = $__root__.createElement(ByTagName('table'), [], []);
    final returnMe = EnsureTagFails.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BaseEnsureObject', 'badTable');
    }
    return returnMe;
  }
}

// ignore_for_file: private_collision_in_mixin_application
// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $TableForEnsureTag extends TableForEnsureTag with $$TableForEnsureTag {
  PageLoaderElement $__root__;
  $TableForEnsureTag.create(PageLoaderElement currentContext)
      : $__root__ = currentContext.createElement(EnsureTag('table'), [], []) {
    $__root__.addCheckers([EnsureTag('table')]);
  }
  factory $TableForEnsureTag.lookup(PageLoaderSource source) =>
      $TableForEnsureTag.create(source.byTag('table'));
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInTableForEnsureTag());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInTableForEnsureTag());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInTableForEnsureTag(
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
    chain = findChainInTableForEnsureTag(internalIds, action).entries.first;
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

  static const String tagName = 'table';
  String toStringDeep() => 'TableForEnsureTag\n\n${$__root__.toStringDeep()}';
}

mixin $$TableForEnsureTag on TableForEnsureTag {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderPointer __pointer__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInTableForEnsureTag() {
    return {};
  }

  Map<String, List<Map<String, String>>>
      testCreatorMethodsInTableForEnsureTag() {
    return {};
  }

  dynamic testCreatorInvokeMethodInTableForEnsureTag(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    if (methodName == 'table') {
      return table;
    }
    if (methodName == 'rows') {
      return rows;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInTableForEnsureTag(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
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
      __listener.startPageObjectMethod('TableForEnsureTag', 'table');
    }
    final element = $__root__;
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('TableForEnsureTag', 'table');
    }
    return returnMe;
  }

  PageObjectIterable<Row> get rows {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('TableForEnsureTag', 'rows');
    }
    final returnMe = PageObjectIterable<Row>(
        $__root__.createIterable(ByTagName('tr'), [], []),
        (PageLoaderElement e) => Row.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('TableForEnsureTag', 'rows');
    }
    return returnMe;
  }
}

// ignore_for_file: private_collision_in_mixin_application
// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $CheckTagFails extends CheckTagFails with $$CheckTagFails {
  PageLoaderElement $__root__;
  $CheckTagFails.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([CheckTag('inconceivable')]);
  }
  factory $CheckTagFails.lookup(PageLoaderSource source) =>
      $CheckTagFails.create(source.byTag('inconceivable'));
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInCheckTagFails());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInCheckTagFails());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInCheckTagFails(
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
    chain = findChainInCheckTagFails(internalIds, action).entries.first;
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

  static const String tagName = 'inconceivable';
  String toStringDeep() => 'CheckTagFails\n\n${$__root__.toStringDeep()}';
}

mixin $$CheckTagFails on CheckTagFails {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderPointer __pointer__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInCheckTagFails() {
    return {};
  }

  Map<String, List<Map<String, String>>> testCreatorMethodsInCheckTagFails() {
    return {};
  }

  dynamic testCreatorInvokeMethodInCheckTagFails(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    if (methodName == 'table') {
      return table;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInCheckTagFails(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
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
      __listener.startPageObjectMethod('CheckTagFails', 'table');
    }
    final element = $__root__;
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('CheckTagFails', 'table');
    }
    return returnMe;
  }
}

// ignore_for_file: private_collision_in_mixin_application
// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $EnsureTagFails extends EnsureTagFails with $$EnsureTagFails {
  PageLoaderElement $__root__;
  $EnsureTagFails.create(PageLoaderElement currentContext)
      : $__root__ =
            currentContext.createElement(EnsureTag('inconceivable'), [], []) {
    $__root__.addCheckers([EnsureTag('inconceivable')]);
  }
  factory $EnsureTagFails.lookup(PageLoaderSource source) =>
      $EnsureTagFails.create(source.byTag('inconceivable'));
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInEnsureTagFails());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInEnsureTagFails());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInEnsureTagFails(
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
    chain = findChainInEnsureTagFails(internalIds, action).entries.first;
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

  static const String tagName = 'inconceivable';
  String toStringDeep() => 'EnsureTagFails\n\n${$__root__.toStringDeep()}';
}

mixin $$EnsureTagFails on EnsureTagFails {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderPointer __pointer__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInEnsureTagFails() {
    return {};
  }

  Map<String, List<Map<String, String>>> testCreatorMethodsInEnsureTagFails() {
    return {};
  }

  dynamic testCreatorInvokeMethodInEnsureTagFails(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    if (methodName == 'table') {
      return table;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInEnsureTagFails(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
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
      __listener.startPageObjectMethod('EnsureTagFails', 'table');
    }
    final element = $__root__;
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('EnsureTagFails', 'table');
    }
    return returnMe;
  }
}

// ignore_for_file: private_collision_in_mixin_application
// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $PageForWithAttributeTest extends PageForWithAttributeTest
    with $$PageForWithAttributeTest {
  PageLoaderElement $__root__;
  $PageForWithAttributeTest.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageForWithAttributeTest.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageForWithAttributeTest is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageForWithAttributeTest());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInPageForWithAttributeTest());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageForWithAttributeTest(
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
    chain =
        findChainInPageForWithAttributeTest(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "PageForWithAttributeTest". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() =>
      'PageForWithAttributeTest\n\n${$__root__.toStringDeep()}';
}

mixin $$PageForWithAttributeTest on PageForWithAttributeTest {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderPointer __pointer__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForWithAttributeTest() {
    return {};
  }

  Map<String, List<Map<String, String>>>
      testCreatorMethodsInPageForWithAttributeTest() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForWithAttributeTest(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    if (methodName == 'element') {
      return element;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInPageForWithAttributeTest(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
    try {
      var elementIndex = internalIds.indexOf(this.element.id);
      if (elementIndex >= 0 && elementIndex < closestIndex) {
        closestIndex = elementIndex;
        closestValue = (_) =>
            'element.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get element {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForWithAttributeTest', 'element');
    }
    final element = $__root__.createElement(
        ByTagName('input'), [WithAttribute('type', 'checkbox')], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForWithAttributeTest', 'element');
    }
    return returnMe;
  }
}

// ignore_for_file: private_collision_in_mixin_application
// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $PageForWithClassTest extends PageForWithClassTest
    with $$PageForWithClassTest {
  PageLoaderElement $__root__;
  $PageForWithClassTest.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageForWithClassTest.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageForWithClassTest is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageForWithClassTest());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInPageForWithClassTest());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageForWithClassTest(
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
    chain = findChainInPageForWithClassTest(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "PageForWithClassTest". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() =>
      'PageForWithClassTest\n\n${$__root__.toStringDeep()}';
}

mixin $$PageForWithClassTest on PageForWithClassTest {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderPointer __pointer__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForWithClassTest() {
    return {};
  }

  Map<String, List<Map<String, String>>>
      testCreatorMethodsInPageForWithClassTest() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForWithClassTest(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    if (methodName == 'element') {
      return element;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInPageForWithClassTest(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
    try {
      var elementIndex = internalIds.indexOf(this.element.id);
      if (elementIndex >= 0 && elementIndex < closestIndex) {
        closestIndex = elementIndex;
        closestValue = (_) =>
            'element.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get element {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForWithClassTest', 'element');
    }
    final element = $__root__
        .createElement(ByTagName('input'), [WithClass('with-class-test')], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForWithClassTest', 'element');
    }
    return returnMe;
  }
}

// ignore_for_file: private_collision_in_mixin_application
// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $DebugIds extends DebugIds with $$DebugIds {
  PageLoaderElement $__root__;
  $DebugIds.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $DebugIds.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "DebugIds is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInDebugIds());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInDebugIds());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInDebugIds(
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
    chain = findChainInDebugIds(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "DebugIds". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'DebugIds\n\n${$__root__.toStringDeep()}';
}

mixin $$DebugIds on DebugIds {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderPointer __pointer__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInDebugIds() {
    return {};
  }

  Map<String, List<Map<String, String>>> testCreatorMethodsInDebugIds() {
    return {};
  }

  dynamic testCreatorInvokeMethodInDebugIds(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    if (methodName == 'option1') {
      return option1;
    }
    if (methodName == 'option2') {
      return option2;
    }
    if (methodName == 'option3') {
      return option3;
    }
    if (methodName == 'usePlain') {
      return usePlain;
    }
    if (methodName == 'useDash') {
      return useDash;
    }
    if (methodName == 'useCamelCase') {
      return useCamelCase;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInDebugIds(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
    try {
      var option1Index = internalIds.indexOf(this.option1.id);
      if (option1Index >= 0 && option1Index < closestIndex) {
        closestIndex = option1Index;
        closestValue = (_) =>
            'option1.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var option2Index = internalIds.indexOf(this.option2.id);
      if (option2Index >= 0 && option2Index < closestIndex) {
        closestIndex = option2Index;
        closestValue = (_) =>
            'option2.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var option3Index = internalIds.indexOf(this.option3.id);
      if (option3Index >= 0 && option3Index < closestIndex) {
        closestIndex = option3Index;
        closestValue = (_) =>
            'option3.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var usePlainIndex = internalIds.indexOf(this.usePlain.id);
      if (usePlainIndex >= 0 && usePlainIndex < closestIndex) {
        closestIndex = usePlainIndex;
        closestValue = (_) =>
            'usePlain.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var useDashIndex = internalIds.indexOf(this.useDash.id);
      if (useDashIndex >= 0 && useDashIndex < closestIndex) {
        closestIndex = useDashIndex;
        closestValue = (_) =>
            'useDash.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var useCamelCaseIndex = internalIds.indexOf(this.useCamelCase.id);
      if (useCamelCaseIndex >= 0 && useCamelCaseIndex < closestIndex) {
        closestIndex = useCamelCaseIndex;
        closestValue = (_) =>
            'useCamelCase.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get option1 {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('DebugIds', 'option1');
    }
    final element = $__root__.createElement(ByDebugId('option1'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('DebugIds', 'option1');
    }
    return returnMe;
  }

  PageLoaderElement get option2 {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('DebugIds', 'option2');
    }
    final element = $__root__.createElement(ByDebugId('option2'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('DebugIds', 'option2');
    }
    return returnMe;
  }

  PageLoaderElement get option3 {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('DebugIds', 'option3');
    }
    final element = $__root__.createElement(ByDebugId('option3'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('DebugIds', 'option3');
    }
    return returnMe;
  }

  PageLoaderElement get usePlain {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('DebugIds', 'usePlain');
    }
    final element =
        $__root__.createElement(ByDebugId('option1', usePlain: true), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('DebugIds', 'usePlain');
    }
    return returnMe;
  }

  PageLoaderElement get useDash {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('DebugIds', 'useDash');
    }
    final element =
        $__root__.createElement(ByDebugId('option2', useDash: true), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('DebugIds', 'useDash');
    }
    return returnMe;
  }

  PageLoaderElement get useCamelCase {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('DebugIds', 'useCamelCase');
    }
    final element = $__root__
        .createElement(ByDebugId('option3', useCamelCase: true), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('DebugIds', 'useCamelCase');
    }
    return returnMe;
  }
}

// ignore_for_file: private_collision_in_mixin_application
// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $TestIds extends TestIds with $$TestIds {
  PageLoaderElement $__root__;
  $TestIds.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $TestIds.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "TestIds is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInTestIds());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInTestIds());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInTestIds(
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
    chain = findChainInTestIds(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "TestIds". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'TestIds\n\n${$__root__.toStringDeep()}';
}

mixin $$TestIds on TestIds {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderPointer __pointer__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInTestIds() {
    return {};
  }

  Map<String, List<Map<String, String>>> testCreatorMethodsInTestIds() {
    return {};
  }

  dynamic testCreatorInvokeMethodInTestIds(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    if (methodName == 'divOne') {
      return divOne;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)> findChainInTestIds(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
    try {
      var divOneIndex = internalIds.indexOf(this.divOne.id);
      if (divOneIndex >= 0 && divOneIndex < closestIndex) {
        closestIndex = divOneIndex;
        closestValue = (_) =>
            'divOne.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get divOne {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('TestIds', 'divOne');
    }
    final element = $__root__.createElement(ByTestId('one'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('TestIds', 'divOne');
    }
    return returnMe;
  }
}
