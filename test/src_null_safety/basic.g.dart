// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

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

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $PageForExistsTest extends PageForExistsTest with $$PageForExistsTest {
  PageLoaderElement $__root__;
  $PageForExistsTest.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageForExistsTest.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageForExistsTest is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageForExistsTest());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInPageForExistsTest());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageForExistsTest(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String? findChain(List<dynamic> rawInternalIds, [String action = 'default']) {
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
    String Function(List<String>)? closestValue;
    MapEntry<int, String Function(List<String>)?> chain;
    chain = findChainInPageForExistsTest(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    if (closestIndex < internalIds.length) {
      final value = closestValue!(internalIds);
      return code[value] ?? value;
    }

    return rootNotFound
        ? null
        : PageObject.defaultCode[action] ?? PageObject.defaultCode['default'];
  }

  static String get tagName =>
      throw '"tagName" is not defined by Page Object "PageForExistsTest". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'PageForExistsTest\n\n${$__root__.toStringDeep()}';
}

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
class $PageForVisibilityTest extends PageForVisibilityTest
    with $$PageForVisibilityTest {
  PageLoaderElement $__root__;
  $PageForVisibilityTest.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageForVisibilityTest.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageForVisibilityTest is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageForVisibilityTest());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInPageForVisibilityTest());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageForVisibilityTest(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String? findChain(List<dynamic> rawInternalIds, [String action = 'default']) {
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
    String Function(List<String>)? closestValue;
    MapEntry<int, String Function(List<String>)?> chain;
    chain = findChainInPageForVisibilityTest(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    if (closestIndex < internalIds.length) {
      final value = closestValue!(internalIds);
      return code[value] ?? value;
    }

    return rootNotFound
        ? null
        : PageObject.defaultCode[action] ?? PageObject.defaultCode['default'];
  }

  static String get tagName =>
      throw '"tagName" is not defined by Page Object "PageForVisibilityTest". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() =>
      'PageForVisibilityTest\n\n${$__root__.toStringDeep()}';
}

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
class $PageForClassAnnotationTest extends PageForClassAnnotationTest
    with $$PageForClassAnnotationTest {
  PageLoaderElement $__root__;
  $PageForClassAnnotationTest.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageForClassAnnotationTest.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageForClassAnnotationTest is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageForClassAnnotationTest());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInPageForClassAnnotationTest());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageForClassAnnotationTest(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String? findChain(List<dynamic> rawInternalIds, [String action = 'default']) {
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
    String Function(List<String>)? closestValue;
    MapEntry<int, String Function(List<String>)?> chain;
    chain = findChainInPageForClassAnnotationTest(internalIds, action)
        .entries
        .first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    if (closestIndex < internalIds.length) {
      final value = closestValue!(internalIds);
      return code[value] ?? value;
    }

    return rootNotFound
        ? null
        : PageObject.defaultCode[action] ?? PageObject.defaultCode['default'];
  }

  static String get tagName =>
      throw '"tagName" is not defined by Page Object "PageForClassAnnotationTest". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() =>
      'PageForClassAnnotationTest\n\n${$__root__.toStringDeep()}';
}

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
class $PageForPrivateFieldsTest extends PageForPrivateFieldsTest
    with $$PageForPrivateFieldsTest {
  PageLoaderElement $__root__;
  $PageForPrivateFieldsTest.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageForPrivateFieldsTest.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageForPrivateFieldsTest is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageForPrivateFieldsTest());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInPageForPrivateFieldsTest());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageForPrivateFieldsTest(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String? findChain(List<dynamic> rawInternalIds, [String action = 'default']) {
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
    String Function(List<String>)? closestValue;
    MapEntry<int, String Function(List<String>)?> chain;
    chain =
        findChainInPageForPrivateFieldsTest(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    if (closestIndex < internalIds.length) {
      final value = closestValue!(internalIds);
      return code[value] ?? value;
    }

    return rootNotFound
        ? null
        : PageObject.defaultCode[action] ?? PageObject.defaultCode['default'];
  }

  static String get tagName =>
      throw '"tagName" is not defined by Page Object "PageForPrivateFieldsTest". Requires @CheckTag annotation in order for "tagName" to be generated.';
  Table get table {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForPrivateFieldsTest', 'table');
    }
    final returnMe = super.table;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForPrivateFieldsTest', 'table');
    }
    return returnMe;
  }

  String toStringDeep() =>
      'PageForPrivateFieldsTest\n\n${$__root__.toStringDeep()}';
}

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
class $PageForFocusTest extends PageForFocusTest with $$PageForFocusTest {
  PageLoaderElement $__root__;
  $PageForFocusTest.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageForFocusTest.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageForFocusTest is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageForFocusTest());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInPageForFocusTest());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageForFocusTest(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String? findChain(List<dynamic> rawInternalIds, [String action = 'default']) {
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
    String Function(List<String>)? closestValue;
    MapEntry<int, String Function(List<String>)?> chain;
    chain = findChainInPageForFocusTest(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    if (closestIndex < internalIds.length) {
      final value = closestValue!(internalIds);
      return code[value] ?? value;
    }

    return rootNotFound
        ? null
        : PageObject.defaultCode[action] ?? PageObject.defaultCode['default'];
  }

  static String get tagName =>
      throw '"tagName" is not defined by Page Object "PageForFocusTest". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'PageForFocusTest\n\n${$__root__.toStringDeep()}';
}

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
class $PageForNbspTest extends PageForNbspTest with $$PageForNbspTest {
  PageLoaderElement $__root__;
  $PageForNbspTest.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageForNbspTest.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageForNbspTest is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageForNbspTest());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInPageForNbspTest());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageForNbspTest(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String? findChain(List<dynamic> rawInternalIds, [String action = 'default']) {
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
    String Function(List<String>)? closestValue;
    MapEntry<int, String Function(List<String>)?> chain;
    chain = findChainInPageForNbspTest(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    if (closestIndex < internalIds.length) {
      final value = closestValue!(internalIds);
      return code[value] ?? value;
    }

    return rootNotFound
        ? null
        : PageObject.defaultCode[action] ?? PageObject.defaultCode['default'];
  }

  static String get tagName =>
      throw '"tagName" is not defined by Page Object "PageForNbspTest". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'PageForNbspTest\n\n${$__root__.toStringDeep()}';
}

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
class $Basic extends Basic with $$Basic {
  PageLoaderElement $__root__;
  $Basic.create(PageLoaderElement currentContext) : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $Basic.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "Basic is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInBasic());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInBasic());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInBasic(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String? findChain(List<dynamic> rawInternalIds, [String action = 'default']) {
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
    String Function(List<String>)? closestValue;
    MapEntry<int, String Function(List<String>)?> chain;
    chain = findChainInBasic(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    if (closestIndex < internalIds.length) {
      final value = closestValue!(internalIds);
      return code[value] ?? value;
    }

    return rootNotFound
        ? null
        : PageObject.defaultCode[action] ?? PageObject.defaultCode['default'];
  }

  static String get tagName =>
      throw '"tagName" is not defined by Page Object "Basic". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'Basic\n\n${$__root__.toStringDeep()}';
}

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
class $OuterNested extends OuterNested with $$OuterNested {
  PageLoaderElement $__root__;
  $OuterNested.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $OuterNested.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "OuterNested is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInOuterNested());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInOuterNested());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInOuterNested(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String? findChain(List<dynamic> rawInternalIds, [String action = 'default']) {
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
    String Function(List<String>)? closestValue;
    MapEntry<int, String Function(List<String>)?> chain;
    chain = findChainInOuterNested(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    if (closestIndex < internalIds.length) {
      final value = closestValue!(internalIds);
      return code[value] ?? value;
    }

    return rootNotFound
        ? null
        : PageObject.defaultCode[action] ?? PageObject.defaultCode['default'];
  }

  static String get tagName =>
      throw '"tagName" is not defined by Page Object "OuterNested". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'OuterNested\n\n${$__root__.toStringDeep()}';
}

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
class $DebugId extends DebugId with $$DebugId {
  PageLoaderElement $__root__;
  $DebugId.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $DebugId.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "DebugId is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInDebugId());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInDebugId());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInDebugId(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String? findChain(List<dynamic> rawInternalIds, [String action = 'default']) {
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
    String Function(List<String>)? closestValue;
    MapEntry<int, String Function(List<String>)?> chain;
    chain = findChainInDebugId(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    if (closestIndex < internalIds.length) {
      final value = closestValue!(internalIds);
      return code[value] ?? value;
    }

    return rootNotFound
        ? null
        : PageObject.defaultCode[action] ?? PageObject.defaultCode['default'];
  }

  static String get tagName =>
      throw '"tagName" is not defined by Page Object "DebugId". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'DebugId\n\n${$__root__.toStringDeep()}';
}

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
class $Display extends Display with $$Display {
  PageLoaderElement $__root__;
  $Display.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $Display.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "Display is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInDisplay());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInDisplay());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInDisplay(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String? findChain(List<dynamic> rawInternalIds, [String action = 'default']) {
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
    String Function(List<String>)? closestValue;
    MapEntry<int, String Function(List<String>)?> chain;
    chain = findChainInDisplay(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    if (closestIndex < internalIds.length) {
      final value = closestValue!(internalIds);
      return code[value] ?? value;
    }

    return rootNotFound
        ? null
        : PageObject.defaultCode[action] ?? PageObject.defaultCode['default'];
  }

  static String get tagName =>
      throw '"tagName" is not defined by Page Object "Display". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'Display\n\n${$__root__.toStringDeep()}';
}

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
class $POWithClassMixinPO extends POWithClassMixinPO
    with $$ClassMixinPO, $$POWithClassMixinPO {
  PageLoaderElement $__root__;
  $POWithClassMixinPO.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $POWithClassMixinPO.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "POWithClassMixinPO is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInClassMixinPO());
    getters.addAll(testCreatorGettersInPOWithClassMixinPO());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInClassMixinPO());
    methods.addAll(testCreatorMethodsInPOWithClassMixinPO());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInPOWithClassMixinPO(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    try {
      return testCreatorInvokeMethodInClassMixinPO(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String? findChain(List<dynamic> rawInternalIds, [String action = 'default']) {
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
    String Function(List<String>)? closestValue;
    MapEntry<int, String Function(List<String>)?> chain;
    chain = findChainInPOWithClassMixinPO(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    chain = findChainInClassMixinPO(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    if (closestIndex < internalIds.length) {
      final value = closestValue!(internalIds);
      return code[value] ?? value;
    }

    return rootNotFound
        ? null
        : PageObject.defaultCode[action] ?? PageObject.defaultCode['default'];
  }

  static String get tagName =>
      throw '"tagName" is not defined by Page Object "POWithClassMixinPO". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'POWithClassMixinPO\n\n${$__root__.toStringDeep()}';
}

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
class $POWithMixinPO extends POWithMixinPO with $$MixinPO, $$POWithMixinPO {
  PageLoaderElement $__root__;
  $POWithMixinPO.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $POWithMixinPO.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "POWithMixinPO is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInMixinPO());
    getters.addAll(testCreatorGettersInPOWithMixinPO());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInMixinPO());
    methods.addAll(testCreatorMethodsInPOWithMixinPO());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInPOWithMixinPO(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    try {
      return testCreatorInvokeMethodInMixinPO(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String? findChain(List<dynamic> rawInternalIds, [String action = 'default']) {
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
    String Function(List<String>)? closestValue;
    MapEntry<int, String Function(List<String>)?> chain;
    chain = findChainInPOWithMixinPO(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    chain = findChainInMixinPO(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    if (closestIndex < internalIds.length) {
      final value = closestValue!(internalIds);
      return code[value] ?? value;
    }

    return rootNotFound
        ? null
        : PageObject.defaultCode[action] ?? PageObject.defaultCode['default'];
  }

  static String get tagName =>
      throw '"tagName" is not defined by Page Object "POWithMixinPO". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'POWithMixinPO\n\n${$__root__.toStringDeep()}';
}

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
