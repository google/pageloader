// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_creator_invoke_method.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageObjectHasGettersAndMethods on PageObjectHasGettersAndMethods {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageObjectHasGettersAndMethods() {
    return {
      'getter': 'String',
    };
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInPageObjectHasGettersAndMethods() {
    return {
      'complexFn': [
        {'name': 'str', 'kind': 'required', 'type': 'String'},
        {'name': 'number', 'kind': 'required', 'type': 'int'},
        {'name': 'float', 'kind': 'required', 'type': 'double'},
        {'name': 'boolean', 'kind': 'required', 'type': 'bool'},
      ],
    };
  }

  dynamic testCreatorInvokeMethodInPageObjectHasGettersAndMethods(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'getter') {
      return getter;
    }
    if (methodName == 'po') {
      return po;
    }
    if (methodName == 'poList') {
      return poList;
    }
    if (methodName == 'emptyFn') {
      return Function.apply(emptyFn, positionalArguments, namedArguments);
    }
    if (methodName == 'complexFn') {
      return Function.apply(complexFn, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?>
      findChainInPageObjectHasGettersAndMethods(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var poIndex = internalIds.indexOf(this.po.id);
      if (poIndex >= 0 && poIndex < closestIndex) {
        closestIndex = poIndex;
        closestValue = (_) =>
            'po.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    final poListElements = this.poList;
    for (var elementIter = 0;
        elementIter < poListElements.length;
        elementIter++) {
      try {
        var poListIndex = internalIds.indexOf(poListElements[elementIter].id);
        if (poListIndex >= 0 && poListIndex < closestIndex) {
          closestIndex = poListIndex;
          closestValue = (_) =>
              'poList[$elementIter].${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
        }
      } catch (_) {
        // Ignored.
      }
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get po {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageObjectHasGettersAndMethods', 'po');
    }
    final element = $__root__.createElement(ByTagName('input'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageObjectHasGettersAndMethods', 'po');
    }
    return returnMe;
  }

  PageObjectList<PageLoaderElement> get poList {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasGettersAndMethods', 'poList');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByTagName('div'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasGettersAndMethods', 'poList');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageObjectHasGettersAndMethodsWithMixin
    on PageObjectHasGettersAndMethodsWithMixin {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String>
      testCreatorGettersInPageObjectHasGettersAndMethodsWithMixin() {
    return {
      'getter': 'String',
    };
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInPageObjectHasGettersAndMethodsWithMixin() {
    return {
      'complexFn': [
        {'name': 'str', 'kind': 'required', 'type': 'String'},
        {'name': 'number', 'kind': 'required', 'type': 'int'},
        {'name': 'float', 'kind': 'required', 'type': 'double'},
        {'name': 'boolean', 'kind': 'required', 'type': 'bool'},
      ],
    };
  }

  dynamic testCreatorInvokeMethodInPageObjectHasGettersAndMethodsWithMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'getter') {
      return getter;
    }
    if (methodName == 'po') {
      return po;
    }
    if (methodName == 'poList') {
      return poList;
    }
    if (methodName == 'emptyFn') {
      return Function.apply(emptyFn, positionalArguments, namedArguments);
    }
    if (methodName == 'complexFn') {
      return Function.apply(complexFn, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?>
      findChainInPageObjectHasGettersAndMethodsWithMixin(
          List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var poIndex = internalIds.indexOf(this.po.id);
      if (poIndex >= 0 && poIndex < closestIndex) {
        closestIndex = poIndex;
        closestValue = (_) =>
            'po.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    final poListElements = this.poList;
    for (var elementIter = 0;
        elementIter < poListElements.length;
        elementIter++) {
      try {
        var poListIndex = internalIds.indexOf(poListElements[elementIter].id);
        if (poListIndex >= 0 && poListIndex < closestIndex) {
          closestIndex = poListIndex;
          closestValue = (_) =>
              'poList[$elementIter].${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
        }
      } catch (_) {
        // Ignored.
      }
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get po {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasGettersAndMethodsWithMixin', 'po');
    }
    final element = $__root__.createElement(ByTagName('input'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasGettersAndMethodsWithMixin', 'po');
    }
    return returnMe;
  }

  PageObjectList<PageLoaderElement> get poList {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectHasGettersAndMethodsWithMixin', 'poList');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByTagName('div'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectHasGettersAndMethodsWithMixin', 'poList');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageObjectMixinHasGettersAndMethods
    on PageObjectMixinHasGettersAndMethods {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String>
      testCreatorGettersInPageObjectMixinHasGettersAndMethods() {
    return {
      'getter': 'String',
    };
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInPageObjectMixinHasGettersAndMethods() {
    return {
      'complexFn': [
        {'name': 'str', 'kind': 'required', 'type': 'String'},
        {'name': 'number', 'kind': 'required', 'type': 'int'},
        {'name': 'float', 'kind': 'required', 'type': 'double'},
        {'name': 'boolean', 'kind': 'required', 'type': 'bool'},
      ],
    };
  }

  dynamic testCreatorInvokeMethodInPageObjectMixinHasGettersAndMethods(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'getter') {
      return getter;
    }
    if (methodName == 'po2') {
      return po2;
    }
    if (methodName == 'poList2') {
      return poList2;
    }
    if (methodName == 'emptyFn') {
      return Function.apply(emptyFn, positionalArguments, namedArguments);
    }
    if (methodName == 'intFn') {
      return Function.apply(intFn, positionalArguments, namedArguments);
    }
    if (methodName == 'complexFn') {
      return Function.apply(complexFn, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?>
      findChainInPageObjectMixinHasGettersAndMethods(List<String> internalIds,
          [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var po2Index = internalIds.indexOf(this.po2.id);
      if (po2Index >= 0 && po2Index < closestIndex) {
        closestIndex = po2Index;
        closestValue = (_) =>
            'po2.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    final poList2Elements = this.poList2;
    for (var elementIter = 0;
        elementIter < poList2Elements.length;
        elementIter++) {
      try {
        var poList2Index = internalIds.indexOf(poList2Elements[elementIter].id);
        if (poList2Index >= 0 && poList2Index < closestIndex) {
          closestIndex = poList2Index;
          closestValue = (_) =>
              'poList2[$elementIter].${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
        }
      } catch (_) {
        // Ignored.
      }
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get po2 {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectMixinHasGettersAndMethods', 'po2');
    }
    final element = $__root__.createElement(ByTagName('input'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectMixinHasGettersAndMethods', 'po2');
    }
    return returnMe;
  }

  PageObjectList<PageLoaderElement> get poList2 {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'PageObjectMixinHasGettersAndMethods', 'poList2');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByTagName('div'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'PageObjectMixinHasGettersAndMethods', 'poList2');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$RightMostPageObjectMixin on RightMostPageObjectMixin {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInRightMostPageObjectMixin() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInRightMostPageObjectMixin() {
    return {};
  }

  dynamic testCreatorInvokeMethodInRightMostPageObjectMixin(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'intFn') {
      return Function.apply(intFn, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInRightMostPageObjectMixin(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    return {closestIndex: closestValue};
  }
}
