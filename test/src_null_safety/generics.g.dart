// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generics.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

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
