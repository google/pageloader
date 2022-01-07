// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageForExistsTest on PageForExistsTest {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForExistsTest() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInPageForExistsTest() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForExistsTest(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'doesntExist') {
      return doesntExist;
    }
    if (methodName == 'doesExist') {
      return doesExist;
    }
    if (methodName == 'tooManyExist') {
      return tooManyExist;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInPageForExistsTest(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var doesntExistIndex = internalIds.indexOf(this.doesntExist.id);
      if (doesntExistIndex >= 0 && doesntExistIndex < closestIndex) {
        closestIndex = doesntExistIndex;
        closestValue = (_) =>
            'doesntExist.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var doesExistIndex = internalIds.indexOf(this.doesExist.id);
      if (doesExistIndex >= 0 && doesExistIndex < closestIndex) {
        closestIndex = doesExistIndex;
        closestValue = (_) =>
            'doesExist.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var tooManyExistIndex = internalIds.indexOf(this.tooManyExist.id);
      if (tooManyExistIndex >= 0 && tooManyExistIndex < closestIndex) {
        closestIndex = tooManyExistIndex;
        closestValue = (_) =>
            'tooManyExist.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get doesntExist {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForExistsTest', 'doesntExist');
    }
    final element = $__root__.createElement(ByTagName('non-existant'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForExistsTest', 'doesntExist');
    }
    return returnMe;
  }

  PageLoaderElement get doesExist {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForExistsTest', 'doesExist');
    }
    final element = $__root__.createElement(ById('button-1'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForExistsTest', 'doesExist');
    }
    return returnMe;
  }

  PageLoaderElement get tooManyExist {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForExistsTest', 'tooManyExist');
    }
    final element = $__root__.createElement(ByTagName('td'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForExistsTest', 'tooManyExist');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageForVisibilityTest on PageForVisibilityTest {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForVisibilityTest() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInPageForVisibilityTest() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForVisibilityTest(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'invisibleDiv') {
      return invisibleDiv;
    }
    if (methodName == 'visibleButton') {
      return visibleButton;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInPageForVisibilityTest(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var invisibleDivIndex = internalIds.indexOf(this.invisibleDiv.id);
      if (invisibleDivIndex >= 0 && invisibleDivIndex < closestIndex) {
        closestIndex = invisibleDivIndex;
        closestValue = (_) =>
            'invisibleDiv.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var visibleButtonIndex = internalIds.indexOf(this.visibleButton.id);
      if (visibleButtonIndex >= 0 && visibleButtonIndex < closestIndex) {
        closestIndex = visibleButtonIndex;
        closestValue = (_) =>
            'visibleButton.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get invisibleDiv {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForVisibilityTest', 'invisibleDiv');
    }
    final element = $__root__.createElement(ById('invisible-div'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForVisibilityTest', 'invisibleDiv');
    }
    return returnMe;
  }

  PageLoaderElement get visibleButton {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageForVisibilityTest', 'visibleButton');
    }
    final element = $__root__.createElement(ById('button-1'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForVisibilityTest', 'visibleButton');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageForClassAnnotationTest on PageForClassAnnotationTest {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForClassAnnotationTest() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInPageForClassAnnotationTest() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForClassAnnotationTest(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'table') {
      return table;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?>
      findChainInPageForClassAnnotationTest(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
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
    return {closestIndex: closestValue};
  }

  Table get table {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForClassAnnotationTest', 'table');
    }
    final element = $__root__;
    final returnMe = Table.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForClassAnnotationTest', 'table');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageForPrivateFieldsTest on PageForPrivateFieldsTest {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForPrivateFieldsTest() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInPageForPrivateFieldsTest() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForPrivateFieldsTest(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInPageForPrivateFieldsTest(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      // Do not know the type. Try it out and ignore if not successful.
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
      var _privateTableElement = this._privateTable as dynamic;
      var _privateTableIndex =
          internalIds.indexOf(_privateTableElement.$__root__.id as String);
      if (_privateTableIndex >= 0 && _privateTableIndex < closestIndex) {
        closestIndex = _privateTableIndex;
        closestValue = (ids) =>
            '_privateTable.${_privateTableElement.findChain(ids, action)}'
                .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  Table get _privateTable {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageForPrivateFieldsTest', '_privateTable');
    }
    final element = $__root__.createElement(ByTagName('table'), [], []);
    final returnMe = Table.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageForPrivateFieldsTest', '_privateTable');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageForFocusTest on PageForFocusTest {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForFocusTest() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInPageForFocusTest() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForFocusTest(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'textfield') {
      return textfield;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInPageForFocusTest(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var textfieldIndex = internalIds.indexOf(this.textfield.id);
      if (textfieldIndex >= 0 && textfieldIndex < closestIndex) {
        closestIndex = textfieldIndex;
        closestValue = (_) =>
            'textfield.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get textfield {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForFocusTest', 'textfield');
    }
    final element = $__root__.createElement(ById('text'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForFocusTest', 'textfield');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageForNbspTest on PageForNbspTest {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForNbspTest() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInPageForNbspTest() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForNbspTest(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'span') {
      return span;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInPageForNbspTest(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var spanIndex = internalIds.indexOf(this.span.id);
      if (spanIndex >= 0 && spanIndex < closestIndex) {
        closestIndex = spanIndex;
        closestValue = (_) =>
            'span.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get span {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForNbspTest', 'span');
    }
    final element = $__root__.createElement(ById('nbsp'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForNbspTest', 'span');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$Basic on Basic {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInBasic() {
    return {};
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInBasic() {
    return {};
  }

  dynamic testCreatorInvokeMethodInBasic(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'outerNested') {
      return outerNested;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInBasic(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var outerNestedElement = this.outerNested as dynamic;
      var outerNestedIndex =
          internalIds.indexOf(outerNestedElement.$__root__.id as String);
      if (outerNestedIndex >= 0 && outerNestedIndex < closestIndex) {
        closestIndex = outerNestedIndex;
        closestValue = (ids) =>
            'outerNested.${outerNestedElement.findChain(ids, action)}'
                .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  OuterNested get outerNested {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Basic', 'outerNested');
    }
    final element = $__root__.createElement(ByClass('outer-nested'), [], []);
    final returnMe = OuterNested.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Basic', 'outerNested');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$OuterNested on OuterNested {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInOuterNested() {
    return {};
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInOuterNested() {
    return {};
  }

  dynamic testCreatorInvokeMethodInOuterNested(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'innerNested') {
      return innerNested;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInOuterNested(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var innerNestedIndex = internalIds.indexOf(this.innerNested.id);
      if (innerNestedIndex >= 0 && innerNestedIndex < closestIndex) {
        closestIndex = innerNestedIndex;
        closestValue = (_) =>
            'innerNested.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get innerNested {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('OuterNested', 'innerNested');
    }
    final element = $__root__.createElement(ByClass('inner-nested'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('OuterNested', 'innerNested');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$DebugId on DebugId {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInDebugId() {
    return {};
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInDebugId() {
    return {};
  }

  dynamic testCreatorInvokeMethodInDebugId(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'debug') {
      return debug;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInDebugId(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var debugIndex = internalIds.indexOf(this.debug.id);
      if (debugIndex >= 0 && debugIndex < closestIndex) {
        closestIndex = debugIndex;
        closestValue = (_) =>
            'debug.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get debug {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('DebugId', 'debug');
    }
    final element = $__root__.createElement(ByDebugId('debugId'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('DebugId', 'debug');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$Display on Display {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInDisplay() {
    return {};
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInDisplay() {
    return {};
  }

  dynamic testCreatorInvokeMethodInDisplay(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'notDisplayed') {
      return notDisplayed;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInDisplay(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var notDisplayedIndex = internalIds.indexOf(this.notDisplayed.id);
      if (notDisplayedIndex >= 0 && notDisplayedIndex < closestIndex) {
        closestIndex = notDisplayedIndex;
        closestValue = (_) =>
            'notDisplayed.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get notDisplayed {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Display', 'notDisplayed');
    }
    final element = $__root__.createElement(ById('div'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Display', 'notDisplayed');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$ClassMixinPO on ClassMixinPO {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInClassMixinPO() {
    return {
      'mixinDivText': 'String',
      'getterMessage': 'String',
    };
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInClassMixinPO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInClassMixinPO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'mixinDivText') {
      return mixinDivText;
    }
    if (methodName == 'getterMessage') {
      return getterMessage;
    }
    if (methodName == 'methodMessage') {
      return Function.apply(methodMessage, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInClassMixinPO(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var _mixinDivIndex = internalIds.indexOf(this._mixinDiv.id);
      if (_mixinDivIndex >= 0 && _mixinDivIndex < closestIndex) {
        closestIndex = _mixinDivIndex;
        closestValue = (_) =>
            '_mixinDiv.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get _mixinDiv {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ClassMixinPO', '_mixinDiv');
    }
    final element = $__root__.createElement(ById('mixin-div'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ClassMixinPO', '_mixinDiv');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$POWithClassMixinPO on POWithClassMixinPO {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPOWithClassMixinPO() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInPOWithClassMixinPO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPOWithClassMixinPO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInPOWithClassMixinPO(
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

mixin $$POWithMixinPO on POWithMixinPO {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPOWithMixinPO() {
    return {};
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInPOWithMixinPO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPOWithMixinPO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInPOWithMixinPO(
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

mixin $$MixinPO on MixinPO {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInMixinPO() {
    return {
      'mixinDivText': 'String',
      'getterMessage': 'String',
    };
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInMixinPO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInMixinPO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'mixinDivText') {
      return mixinDivText;
    }
    if (methodName == 'getterMessage') {
      return getterMessage;
    }
    if (methodName == 'methodMessage') {
      return Function.apply(methodMessage, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInMixinPO(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var _mixinDivIndex = internalIds.indexOf(this._mixinDiv.id);
      if (_mixinDivIndex >= 0 && _mixinDivIndex < closestIndex) {
        closestIndex = _mixinDivIndex;
        closestValue = (_) =>
            '_mixinDiv.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get _mixinDiv {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('MixinPO', '_mixinDiv');
    }
    final element = $__root__.createElement(ById('mixin-div'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('MixinPO', '_mixinDiv');
    }
    return returnMe;
  }
}
