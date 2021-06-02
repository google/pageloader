// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'list.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $Lists extends Lists with $$Lists {
  PageLoaderElement $__root__;
  $Lists.create(PageLoaderElement currentContext) : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $Lists.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "Lists is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInLists());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInLists());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInLists(
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
    chain = findChainInLists(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "Lists". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'Lists\n\n${$__root__.toStringDeep()}';
}

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
    if (methodName == 'basics') {
      return basics;
    }
    if (methodName == 'nested') {
      return nested;
    }
    if (methodName == 'checkTagPO') {
      return checkTagPO;
    }
    if (methodName == 'basicsSync') {
      return basicsSync;
    }
    if (methodName == 'nestedSync') {
      return nestedSync;
    }
    if (methodName == 'checkTagPOSync') {
      return checkTagPOSync;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInLists(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    final nestedSyncElements = this.nestedSync;
    for (var elementIter = 0;
        elementIter < nestedSyncElements.length;
        elementIter++) {
      try {
        var nestedSyncElement = nestedSyncElements[elementIter] as dynamic;
        var nestedSyncIndex =
            internalIds.indexOf(nestedSyncElement.$__root__.id as String);
        if (nestedSyncIndex >= 0 && nestedSyncIndex < closestIndex) {
          closestIndex = nestedSyncIndex;
          closestValue = (ids) =>
              'nestedSync[$elementIter].${nestedSyncElement.findChain(ids, action)}'
                  .replaceAll(RegExp('\\.\$'), '');
        }
      } catch (_) {
        // Ignored.
      }
    }
    final checkTagPOSyncElements = this.checkTagPOSync;
    for (var elementIter = 0;
        elementIter < checkTagPOSyncElements.length;
        elementIter++) {
      try {
        var checkTagPOSyncElement =
            checkTagPOSyncElements[elementIter] as dynamic;
        var checkTagPOSyncIndex =
            internalIds.indexOf(checkTagPOSyncElement.$__root__.id as String);
        if (checkTagPOSyncIndex >= 0 && checkTagPOSyncIndex < closestIndex) {
          closestIndex = checkTagPOSyncIndex;
          closestValue = (ids) =>
              'checkTagPOSync[$elementIter].${checkTagPOSyncElement.findChain(ids, action)}'
                  .replaceAll(RegExp('\\.\$'), '');
        }
      } catch (_) {
        // Ignored.
      }
    }
    final basicsSyncElements = this.basicsSync;
    for (var elementIter = 0;
        elementIter < basicsSyncElements.length;
        elementIter++) {
      try {
        var basicsSyncIndex =
            internalIds.indexOf(basicsSyncElements[elementIter].id);
        if (basicsSyncIndex >= 0 && basicsSyncIndex < closestIndex) {
          closestIndex = basicsSyncIndex;
          closestValue = (_) =>
              'basicsSync[$elementIter].${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
        }
      } catch (_) {
        // Ignored.
      }
    }
    return {closestIndex: closestValue};
  }

  Future<PageObjectList<PageLoaderElement>> get basics async {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Lists', 'basics');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByCss('basic'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Lists', 'basics');
    }
    return returnMe;
  }

  Future<PageObjectList<InnerListObject>> get nested async {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Lists', 'nested');
    }
    final returnMe = PageObjectList<InnerListObject>(
        $__root__.createList(ByCss('nested'), [], []),
        (PageLoaderElement e) => InnerListObject.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Lists', 'nested');
    }
    return returnMe;
  }

  Future<PageObjectList<CheckTagPO>> get checkTagPO async {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Lists', 'checkTagPO');
    }
    final returnMe = PageObjectList<CheckTagPO>(
        $__root__.createList(ByTagName('check-tag-po'), [], []),
        (PageLoaderElement e) => CheckTagPO.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Lists', 'checkTagPO');
    }
    return returnMe;
  }

  PageObjectList<PageLoaderElement> get basicsSync {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Lists', 'basicsSync');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByCss('basic'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Lists', 'basicsSync');
    }
    return returnMe;
  }

  PageObjectList<InnerListObject> get nestedSync {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Lists', 'nestedSync');
    }
    final returnMe = PageObjectList<InnerListObject>(
        $__root__.createList(ByCss('nested'), [], []),
        (PageLoaderElement e) => InnerListObject.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Lists', 'nestedSync');
    }
    return returnMe;
  }

  PageObjectList<CheckTagPO> get checkTagPOSync {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Lists', 'checkTagPOSync');
    }
    final returnMe = PageObjectList<CheckTagPO>(
        $__root__.createList(ByTagName('check-tag-po'), [], []),
        (PageLoaderElement e) => CheckTagPO.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Lists', 'checkTagPOSync');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $InnerListObject extends InnerListObject with $$InnerListObject {
  PageLoaderElement $__root__;
  $InnerListObject.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $InnerListObject.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "InnerListObject is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInInnerListObject());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInInnerListObject());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInInnerListObject(
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
    chain = findChainInInnerListObject(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "InnerListObject". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'InnerListObject\n\n${$__root__.toStringDeep()}';
}

mixin $$InnerListObject on InnerListObject {
/*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInInnerListObject() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInInnerListObject() {
    return {};
  }

  dynamic testCreatorInvokeMethodInInnerListObject(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'single') {
      return single;
    }
    if (methodName == 'innerIterable') {
      return innerIterable;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInInnerListObject(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      var singleIndex = internalIds.indexOf(this.single.id);
      if (singleIndex >= 0 && singleIndex < closestIndex) {
        closestIndex = singleIndex;
        closestValue = (_) =>
            'single.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get single {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('InnerListObject', 'single');
    }
    final element = $__root__.createElement(ByCss('single'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('InnerListObject', 'single');
    }
    return returnMe;
  }

  Future<PageObjectList<PageLoaderElement>> get innerIterable async {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('InnerListObject', 'innerIterable');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByCss('nested-iterable'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('InnerListObject', 'innerIterable');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $ListsUsingMixin extends ListsUsingMixin
    with $$ListsMixin, $$ListsUsingMixin {
  PageLoaderElement $__root__;
  $ListsUsingMixin.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $ListsUsingMixin.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "ListsUsingMixin is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInListsMixin());
    getters.addAll(testCreatorGettersInListsUsingMixin());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInListsMixin());
    methods.addAll(testCreatorMethodsInListsUsingMixin());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInListsUsingMixin(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    try {
      return testCreatorInvokeMethodInListsMixin(
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
    chain = findChainInListsUsingMixin(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    chain = findChainInListsMixin(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "ListsUsingMixin". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'ListsUsingMixin\n\n${$__root__.toStringDeep()}';
}

mixin $$ListsUsingMixin on ListsUsingMixin {
/*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInListsUsingMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInListsUsingMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInListsUsingMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInListsUsingMixin(
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

mixin $$ListsMixin on ListsMixin {
/*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInListsMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInListsMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInListsMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'basics') {
      return basics;
    }
    if (methodName == 'nested') {
      return nested;
    }
    if (methodName == 'checkTagPO') {
      return checkTagPO;
    }
    if (methodName == 'basicsSync') {
      return basicsSync;
    }
    if (methodName == 'nestedSync') {
      return nestedSync;
    }
    if (methodName == 'checkTagPOSync') {
      return checkTagPOSync;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInListsMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    final nestedSyncElements = this.nestedSync;
    for (var elementIter = 0;
        elementIter < nestedSyncElements.length;
        elementIter++) {
      try {
        var nestedSyncElement = nestedSyncElements[elementIter] as dynamic;
        var nestedSyncIndex =
            internalIds.indexOf(nestedSyncElement.$__root__.id as String);
        if (nestedSyncIndex >= 0 && nestedSyncIndex < closestIndex) {
          closestIndex = nestedSyncIndex;
          closestValue = (ids) =>
              'nestedSync[$elementIter].${nestedSyncElement.findChain(ids, action)}'
                  .replaceAll(RegExp('\\.\$'), '');
        }
      } catch (_) {
        // Ignored.
      }
    }
    final checkTagPOSyncElements = this.checkTagPOSync;
    for (var elementIter = 0;
        elementIter < checkTagPOSyncElements.length;
        elementIter++) {
      try {
        var checkTagPOSyncElement =
            checkTagPOSyncElements[elementIter] as dynamic;
        var checkTagPOSyncIndex =
            internalIds.indexOf(checkTagPOSyncElement.$__root__.id as String);
        if (checkTagPOSyncIndex >= 0 && checkTagPOSyncIndex < closestIndex) {
          closestIndex = checkTagPOSyncIndex;
          closestValue = (ids) =>
              'checkTagPOSync[$elementIter].${checkTagPOSyncElement.findChain(ids, action)}'
                  .replaceAll(RegExp('\\.\$'), '');
        }
      } catch (_) {
        // Ignored.
      }
    }
    final basicsSyncElements = this.basicsSync;
    for (var elementIter = 0;
        elementIter < basicsSyncElements.length;
        elementIter++) {
      try {
        var basicsSyncIndex =
            internalIds.indexOf(basicsSyncElements[elementIter].id);
        if (basicsSyncIndex >= 0 && basicsSyncIndex < closestIndex) {
          closestIndex = basicsSyncIndex;
          closestValue = (_) =>
              'basicsSync[$elementIter].${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
        }
      } catch (_) {
        // Ignored.
      }
    }
    return {closestIndex: closestValue};
  }

  Future<PageObjectList<PageLoaderElement>> get basics async {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ListsMixin', 'basics');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByCss('basic'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ListsMixin', 'basics');
    }
    return returnMe;
  }

  Future<PageObjectList<InnerListObjectUsingMixin>> get nested async {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ListsMixin', 'nested');
    }
    final returnMe = PageObjectList<InnerListObjectUsingMixin>(
        $__root__.createList(ByCss('nested'), [], []),
        (PageLoaderElement e) => InnerListObjectUsingMixin.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ListsMixin', 'nested');
    }
    return returnMe;
  }

  Future<PageObjectList<CheckTagPO>> get checkTagPO async {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ListsMixin', 'checkTagPO');
    }
    final returnMe = PageObjectList<CheckTagPO>(
        $__root__.createList(ByTagName('check-tag-po'), [], []),
        (PageLoaderElement e) => CheckTagPO.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ListsMixin', 'checkTagPO');
    }
    return returnMe;
  }

  PageObjectList<PageLoaderElement> get basicsSync {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ListsMixin', 'basicsSync');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByCss('basic'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ListsMixin', 'basicsSync');
    }
    return returnMe;
  }

  PageObjectList<InnerListObjectUsingMixin> get nestedSync {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ListsMixin', 'nestedSync');
    }
    final returnMe = PageObjectList<InnerListObjectUsingMixin>(
        $__root__.createList(ByCss('nested'), [], []),
        (PageLoaderElement e) => InnerListObjectUsingMixin.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ListsMixin', 'nestedSync');
    }
    return returnMe;
  }

  PageObjectList<CheckTagPO> get checkTagPOSync {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ListsMixin', 'checkTagPOSync');
    }
    final returnMe = PageObjectList<CheckTagPO>(
        $__root__.createList(ByTagName('check-tag-po'), [], []),
        (PageLoaderElement e) => CheckTagPO.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ListsMixin', 'checkTagPOSync');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $InnerListObjectUsingMixin extends InnerListObjectUsingMixin
    with $$InnerListObjectMixin, $$InnerListObjectUsingMixin {
  PageLoaderElement $__root__;
  $InnerListObjectUsingMixin.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $InnerListObjectUsingMixin.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "InnerListObjectUsingMixin is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInInnerListObjectMixin());
    getters.addAll(testCreatorGettersInInnerListObjectUsingMixin());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String /*?*/ >>>{};
    methods.addAll(testCreatorMethodsInInnerListObjectMixin());
    methods.addAll(testCreatorMethodsInInnerListObjectUsingMixin());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    try {
      return testCreatorInvokeMethodInInnerListObjectUsingMixin(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    try {
      return testCreatorInvokeMethodInInnerListObjectMixin(
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
    chain =
        findChainInInnerListObjectUsingMixin(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    chain = findChainInInnerListObjectMixin(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "InnerListObjectUsingMixin". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() =>
      'InnerListObjectUsingMixin\n\n${$__root__.toStringDeep()}';
}

mixin $$InnerListObjectUsingMixin on InnerListObjectUsingMixin {
/*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInInnerListObjectUsingMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInInnerListObjectUsingMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInInnerListObjectUsingMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ >
      findChainInInnerListObjectUsingMixin(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    return {closestIndex: closestValue};
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$InnerListObjectMixin on InnerListObjectMixin {
/*late*/ PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInInnerListObjectMixin() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInInnerListObjectMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInInnerListObjectMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'single') {
      return single;
    }
    if (methodName == 'innerIterable') {
      return innerIterable;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ >
      findChainInInnerListObjectMixin(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
    try {
      var singleIndex = internalIds.indexOf(this.single.id);
      if (singleIndex >= 0 && singleIndex < closestIndex) {
        closestIndex = singleIndex;
        closestValue = (_) =>
            'single.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get single {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('InnerListObjectMixin', 'single');
    }
    final element = $__root__.createElement(ByCss('single'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('InnerListObjectMixin', 'single');
    }
    return returnMe;
  }

  Future<PageObjectList<PageLoaderElement>> get innerIterable async {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('InnerListObjectMixin', 'innerIterable');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByCss('nested-iterable'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('InnerListObjectMixin', 'innerIterable');
    }
    return returnMe;
  }
}
