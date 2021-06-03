// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'constructors.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $BasePO extends BasePO with $$BasePO {
  PageLoaderElement $__root__;
  $BasePO.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $BasePO.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "BasePO is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInBasePO());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInBasePO());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInBasePO(
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
    chain = findChainInBasePO(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "BasePO". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'BasePO\n\n${$__root__.toStringDeep()}';
}

mixin $$BasePO on BasePO {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInBasePO() {
    return {};
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInBasePO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInBasePO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'bTagPO') {
      return bTagPO;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInBasePO(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
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
class $BCustomTagPO extends BCustomTagPO with $$BCustomTagPO {
  PageLoaderElement $__root__;
  $BCustomTagPO.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([CheckTag(BCustomTagPO.tagName)]);
  }
  factory $BCustomTagPO.lookup(PageLoaderSource source) =>
      $BCustomTagPO.create(source.byTag(BCustomTagPO.tagName));
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInBCustomTagPO());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInBCustomTagPO());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInBCustomTagPO(
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
    chain = findChainInBCustomTagPO(internalIds, action).entries.first;
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

  static const String tagName = BCustomTagPO.tagName;
  PageLoaderElement get rootElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BCustomTagPO', 'rootElement');
    }
    final returnMe = super.rootElement;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BCustomTagPO', 'rootElement');
    }
    return returnMe;
  }

  PageUtils get _utils {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BCustomTagPO', '_utils');
    }
    final returnMe = super._utils;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BCustomTagPO', '_utils');
    }
    return returnMe;
  }

  CCustomTagPO get cTagFromPLE {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BCustomTagPO', 'cTagFromPLE');
    }
    final returnMe = super.cTagFromPLE;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BCustomTagPO', 'cTagFromPLE');
    }
    return returnMe;
  }

  CCustomTagPO get cTagFromUtils {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BCustomTagPO', 'cTagFromUtils');
    }
    final returnMe = super.cTagFromUtils;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BCustomTagPO', 'cTagFromUtils');
    }
    return returnMe;
  }

  NoLookupPO get noLookupPO {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BCustomTagPO', 'noLookupPO');
    }
    final returnMe = super.noLookupPO;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BCustomTagPO', 'noLookupPO');
    }
    return returnMe;
  }

  String toStringDeep() => 'BCustomTagPO\n\n${$__root__.toStringDeep()}';
}

mixin $$BCustomTagPO on BCustomTagPO {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInBCustomTagPO() {
    return {};
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInBCustomTagPO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInBCustomTagPO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInBCustomTagPO(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
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
class $CCustomTagPO extends CCustomTagPO with $$CCustomTagPO {
  PageLoaderElement $__root__;
  $CCustomTagPO.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([CheckTag(CCustomTagPO.tagName)]);
  }
  factory $CCustomTagPO.lookup(PageLoaderSource source) =>
      $CCustomTagPO.create(source.byTag(CCustomTagPO.tagName));
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInCCustomTagPO());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInCCustomTagPO());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInCCustomTagPO(
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
    chain = findChainInCCustomTagPO(internalIds, action).entries.first;
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

  static const String tagName = CCustomTagPO.tagName;
  String get innerText {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('CCustomTagPO', 'innerText');
    }
    final returnMe = super.innerText;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('CCustomTagPO', 'innerText');
    }
    return returnMe;
  }

  String toStringDeep() => 'CCustomTagPO\n\n${$__root__.toStringDeep()}';
}

mixin $$CCustomTagPO on CCustomTagPO {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInCCustomTagPO() {
    return {
      'innerText': 'String',
    };
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInCCustomTagPO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInCCustomTagPO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'innerText') {
      return innerText;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInCCustomTagPO(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
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
class $NoLookupPO extends NoLookupPO with $$NoLookupPO {
  PageLoaderElement $__root__;
  $NoLookupPO.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $NoLookupPO.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "NoLookupPO is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInNoLookupPO());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInNoLookupPO());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInNoLookupPO(
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
    chain = findChainInNoLookupPO(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "NoLookupPO". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'NoLookupPO\n\n${$__root__.toStringDeep()}';
}

mixin $$NoLookupPO on NoLookupPO {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInNoLookupPO() {
    return {};
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInNoLookupPO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInNoLookupPO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInNoLookupPO(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    return {closestIndex: closestValue};
  }
}
