// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generics.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $Generics<T> extends Generics<T> with $$Generics<T> {
  PageLoaderElement $__root__;
  $Generics.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $Generics.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "Generics is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInGenerics());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInGenerics());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInGenerics(
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
    chain = findChainInGenerics(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "Generics". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String typeDefParameter(T thing, MyGenericTypeDef<T> typeDef) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Generics', 'typeDefParameter');
    }
    final returnMe = super.typeDefParameter(thing, typeDef);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Generics', 'typeDefParameter');
    }
    return returnMe;
  }

  String toStringDeep() => 'Generics\n\n${$__root__.toStringDeep()}';
}

mixin $$Generics<T> on Generics<T> {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInGenerics() {
    return {};
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInGenerics() {
    return {};
  }

  dynamic testCreatorInvokeMethodInGenerics(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'typeDefParameter') {
      return Function.apply(
          typeDefParameter, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInGenerics(
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
class $RootPo<T> extends RootPo<T> with $$RootPo<T> {
  PageLoaderElement $__root__;
  $RootPo.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $RootPo.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "RootPo is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInRootPo());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInRootPo());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInRootPo(
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
    chain = findChainInRootPo(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "RootPo". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'RootPo\n\n${$__root__.toStringDeep()}';
}

mixin $$RootPo<T> on RootPo<T> {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInRootPo() {
    return {};
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInRootPo() {
    return {};
  }

  dynamic testCreatorInvokeMethodInRootPo(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'generics') {
      return generics;
    }
    if (methodName == 'genericsList') {
      return genericsList;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInRootPo(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var genericsElement = this.generics as dynamic;
      var genericsIndex =
          internalIds.indexOf(genericsElement.$__root__.id as String);
      if (genericsIndex >= 0 && genericsIndex < closestIndex) {
        closestIndex = genericsIndex;
        closestValue = (ids) =>
            'generics.${genericsElement.findChain(ids, action)}'
                .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    final genericsListElements = this.genericsList;
    for (var elementIter = 0;
        elementIter < genericsListElements.length;
        elementIter++) {
      try {
        var genericsListElement = genericsListElements[elementIter] as dynamic;
        var genericsListIndex =
            internalIds.indexOf(genericsListElement.$__root__.id as String);
        if (genericsListIndex >= 0 && genericsListIndex < closestIndex) {
          closestIndex = genericsListIndex;
          closestValue = (ids) =>
              'genericsList[$elementIter].${genericsListElement.findChain(ids, action)}'
                  .replaceAll(RegExp('\\.\$'), '');
        }
      } catch (_) {
        // Ignored.
      }
    }
    return {closestIndex: closestValue};
  }

  Generics<T> get generics {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootPo', 'generics');
    }
    final element = $__root__.createElement(ById('button-1'), [], []);
    final returnMe = Generics<T>.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootPo', 'generics');
    }
    return returnMe;
  }

  PageObjectList<Generics<T>> get genericsList {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootPo', 'genericsList');
    }
    final returnMe = PageObjectList<Generics<T>>(
        $__root__.createList(ByTagName('td'), [], []),
        (PageLoaderElement e) => Generics<T>.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootPo', 'genericsList');
    }
    return returnMe;
  }
}
