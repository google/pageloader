// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'findchain.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $PageForFindChainTests extends PageForFindChainTests
    with $$PageForFindChainTests {
  PageLoaderElement $__root__;
  $PageForFindChainTests.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageForFindChainTests.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageForFindChainTests is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageForFindChainTests());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInPageForFindChainTests());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageForFindChainTests(
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
    chain = findChainInPageForFindChainTests(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "PageForFindChainTests". Requires @CheckTag annotation in order for "tagName" to be generated.';
  OuterPO get firstOuter {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForFindChainTests', 'firstOuter');
    }
    final returnMe = super.firstOuter;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForFindChainTests', 'firstOuter');
    }
    return returnMe;
  }

  String toStringDeep() =>
      'PageForFindChainTests\n\n${$__root__.toStringDeep()}';
}

mixin $$PageForFindChainTests on PageForFindChainTests {
/*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForFindChainTests() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageForFindChainTests() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForFindChainTests(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'custom') {
      return custom;
    }
    if (methodName == 'table') {
      return table;
    }
    if (methodName == 'inputs') {
      return inputs;
    }
    if (methodName == 'outers') {
      return outers;
    }
    if (methodName == 'customPOs') {
      return customPOs;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ >
      findChainInPageForFindChainTests(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      // Do not know the type. Try it out and ignore if not successful.
      var firstOuterElement = this.firstOuter as dynamic;
      var firstOuterIndex =
          internalIds.indexOf(firstOuterElement.$__root__.id as String);
      if (firstOuterIndex >= 0 && firstOuterIndex < closestIndex) {
        closestIndex = firstOuterIndex;
        closestValue = (ids) =>
            'firstOuter.${firstOuterElement.findChain(ids, action)}'
                .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var customElement = this.custom as dynamic;
      var customIndex =
          internalIds.indexOf(customElement.$__root__.id as String);
      if (customIndex >= 0 && customIndex < closestIndex) {
        closestIndex = customIndex;
        closestValue = (ids) => 'custom.${customElement.findChain(ids, action)}'
            .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
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
    final outersElements = this.outers;
    for (var elementIter = 0;
        elementIter < outersElements.length;
        elementIter++) {
      try {
        var outersElement = outersElements[elementIter] as dynamic;
        var outersIndex =
            internalIds.indexOf(outersElement.$__root__.id as String);
        if (outersIndex >= 0 && outersIndex < closestIndex) {
          closestIndex = outersIndex;
          closestValue = (ids) =>
              'outers[$elementIter].${outersElement.findChain(ids, action)}'
                  .replaceAll(RegExp('\\.\$'), '');
        }
      } catch (_) {
        // Ignored.
      }
    }
    final customPOsElements = this.customPOs;
    for (var elementIter = 0;
        elementIter < customPOsElements.length;
        elementIter++) {
      try {
        var customPOsElement = customPOsElements[elementIter] as dynamic;
        var customPOsIndex =
            internalIds.indexOf(customPOsElement.$__root__.id as String);
        if (customPOsIndex >= 0 && customPOsIndex < closestIndex) {
          closestIndex = customPOsIndex;
          closestValue = (ids) =>
              'customPOs[$elementIter].${customPOsElement.findChain(ids, action)}'
                  .replaceAll(RegExp('\\.\$'), '');
        }
      } catch (_) {
        // Ignored.
      }
    }
    final inputsElements = this.inputs;
    for (var elementIter = 0;
        elementIter < inputsElements.length;
        elementIter++) {
      try {
        var inputsIndex = internalIds.indexOf(inputsElements[elementIter].id);
        if (inputsIndex >= 0 && inputsIndex < closestIndex) {
          closestIndex = inputsIndex;
          closestValue = (_) =>
              'inputs[$elementIter].${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
        }
      } catch (_) {
        // Ignored.
      }
    }
    return {closestIndex: closestValue};
  }

  CustomPO get custom {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForFindChainTests', 'custom');
    }
    final element = $__root__.createElement(ById('button-1'), [], []);
    final returnMe = CustomPO.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForFindChainTests', 'custom');
    }
    return returnMe;
  }

  TablePO get table {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForFindChainTests', 'table');
    }
    final element = $__root__.createElement(ById('table1'), [], []);
    final returnMe = TablePO.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForFindChainTests', 'table');
    }
    return returnMe;
  }

  PageObjectList<PageLoaderElement> get inputs {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForFindChainTests', 'inputs');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByTagName('input'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForFindChainTests', 'inputs');
    }
    return returnMe;
  }

  PageObjectList<OuterPO> get outers {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForFindChainTests', 'outers');
    }
    final returnMe = PageObjectList<OuterPO>(
        $__root__.createList(ByClass('outer-div'), [], []),
        (PageLoaderElement e) => OuterPO.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForFindChainTests', 'outers');
    }
    return returnMe;
  }

  PageObjectList<CustomPO> get customPOs {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForFindChainTests', 'customPOs');
    }
    final returnMe = PageObjectList<CustomPO>(
        $__root__.createList(ByTagName('button'), [], []),
        (PageLoaderElement e) => CustomPO.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForFindChainTests', 'customPOs');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $CustomPO extends CustomPO with $$CustomPO {
  PageLoaderElement $__root__;
  $CustomPO.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([CheckTag('button')]);
  }
  factory $CustomPO.lookup(PageLoaderSource source) =>
      $CustomPO.create(source.byTag('button'));
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInCustomPO());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInCustomPO());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInCustomPO(
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
    chain = findChainInCustomPO(internalIds, action).entries.first;
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

  static const String tagName = 'button';
  String toStringDeep() => 'CustomPO\n\n${$__root__.toStringDeep()}';
}

mixin $$CustomPO on CustomPO {
/*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInCustomPO() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>> testCreatorMethodsInCustomPO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInCustomPO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInCustomPO(
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
class $OuterPO extends OuterPO with $$OuterMixin, $$OuterPO {
  PageLoaderElement $__root__;
  $OuterPO.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $OuterPO.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "OuterPO is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInOuterMixin());
    getters.addAll(testCreatorGettersInOuterPO());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInOuterMixin());
    methods.addAll(testCreatorMethodsInOuterPO());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInOuterPO(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    try {
      return testCreatorInvokeMethodInOuterMixin(
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
    chain = findChainInOuterPO(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    chain = findChainInOuterMixin(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "OuterPO". Requires @CheckTag annotation in order for "tagName" to be generated.';
  PageLoaderElement get firstInner {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('OuterPO', 'firstInner');
    }
    final returnMe = super.firstInner;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('OuterPO', 'firstInner');
    }
    return returnMe;
  }

  String toStringDeep() => 'OuterPO\n\n${$__root__.toStringDeep()}';
}

mixin $$OuterPO on OuterPO {
/*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInOuterPO() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>> testCreatorMethodsInOuterPO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInOuterPO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'specialInner') {
      return specialInner;
    }
    if (methodName == 'divDiv') {
      return divDiv;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInOuterPO(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      var firstInnerIndex = internalIds.indexOf(this.firstInner.id);
      if (firstInnerIndex >= 0 && firstInnerIndex < closestIndex) {
        closestIndex = firstInnerIndex;
        closestValue = (_) =>
            'firstInner.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var specialInnerIndex = internalIds.indexOf(this.specialInner.id);
      if (specialInnerIndex >= 0 && specialInnerIndex < closestIndex) {
        closestIndex = specialInnerIndex;
        closestValue = (_) =>
            'specialInner.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var divDivIndex = internalIds.indexOf(this.divDiv.id);
      if (divDivIndex >= 0 && divDivIndex < closestIndex) {
        closestIndex = divDivIndex;
        closestValue = (_) =>
            'divDiv.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get specialInner {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('OuterPO', 'specialInner');
    }
    final element = $__root__.createElement(ByClass('special'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('OuterPO', 'specialInner');
    }
    return returnMe;
  }

  PageLoaderElement get divDiv {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('OuterPO', 'divDiv');
    }
    final element = $__root__.createElement(Global(ById('div')), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('OuterPO', 'divDiv');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$OuterMixin on OuterMixin {
/*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInOuterMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInOuterMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInOuterMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'inners') {
      return inners;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInOuterMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    final innersElements = this.inners;
    for (var elementIter = 0;
        elementIter < innersElements.length;
        elementIter++) {
      try {
        var innersIndex = internalIds.indexOf(innersElements[elementIter].id);
        if (innersIndex >= 0 && innersIndex < closestIndex) {
          closestIndex = innersIndex;
          closestValue = (_) =>
              'inners[$elementIter].${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
        }
      } catch (_) {
        // Ignored.
      }
    }
    return {closestIndex: closestValue};
  }

  PageObjectList<PageLoaderElement> get inners {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('OuterMixin', 'inners');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByClass('inner-div'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('OuterMixin', 'inners');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $TablePO extends TablePO with $$TablePO {
  PageLoaderElement $__root__;
  $TablePO.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $TablePO.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "TablePO is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInTablePO());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInTablePO());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInTablePO(
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
    chain = findChainInTablePO(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "TablePO". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'TablePO\n\n${$__root__.toStringDeep()}';
}

mixin $$TablePO on TablePO {
/*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInTablePO() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>> testCreatorMethodsInTablePO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInTablePO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'rows') {
      return rows;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInTablePO(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    final rowsElements = this.rows;
    for (var elementIter = 0;
        elementIter < rowsElements.length;
        elementIter++) {
      try {
        var rowsElement = rowsElements[elementIter] as dynamic;
        var rowsIndex = internalIds.indexOf(rowsElement.$__root__.id as String);
        if (rowsIndex >= 0 && rowsIndex < closestIndex) {
          closestIndex = rowsIndex;
          closestValue = (ids) =>
              'rows[$elementIter].${rowsElement.findChain(ids, action)}'
                  .replaceAll(RegExp('\\.\$'), '');
        }
      } catch (_) {
        // Ignored.
      }
    }
    return {closestIndex: closestValue};
  }

  PageObjectList<RowPO> get rows {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('TablePO', 'rows');
    }
    final returnMe = PageObjectList<RowPO>(
        $__root__.createList(ByTagName('tr'), [], []),
        (PageLoaderElement e) => RowPO.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('TablePO', 'rows');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $RowPO extends RowPO with $$RowPO {
  PageLoaderElement $__root__;
  $RowPO.create(PageLoaderElement currentContext) : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $RowPO.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "RowPO is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInRowPO());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInRowPO());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInRowPO(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String /*?*/ findChain(List<dynamic> rawInternalIds,
      [String action = 'default']) {
    final internalIds = rawInternalIds.cast<String>();
    final code = {"value": "test", "click": "focus"};

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
    chain = findChainInRowPO(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "RowPO". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'RowPO\n\n${$__root__.toStringDeep()}';
}

mixin $$RowPO on RowPO {
/*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInRowPO() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>> testCreatorMethodsInRowPO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInRowPO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'cells') {
      return cells;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInRowPO(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    final cellsElements = this.cells;
    for (var elementIter = 0;
        elementIter < cellsElements.length;
        elementIter++) {
      try {
        var cellsIndex = internalIds.indexOf(cellsElements[elementIter].id);
        if (cellsIndex >= 0 && cellsIndex < closestIndex) {
          closestIndex = cellsIndex;
          closestValue = (_) =>
              'cells[$elementIter].${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
        }
      } catch (_) {
        // Ignored.
      }
    }
    return {closestIndex: closestValue};
  }

  PageObjectList<PageLoaderElement> get cells {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RowPO', 'cells');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByTagName('td'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RowPO', 'cells');
    }
    return returnMe;
  }
}
