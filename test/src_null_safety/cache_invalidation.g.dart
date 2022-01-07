// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_invalidation.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$CacheInvalidation on CacheInvalidation {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInCacheInvalidation() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInCacheInvalidation() {
    return {};
  }

  dynamic testCreatorInvokeMethodInCacheInvalidation(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'button1') {
      return button1;
    }
    if (methodName == 'select1') {
      return select1;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInCacheInvalidation(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var select1Element = this.select1 as dynamic;
      var select1Index =
          internalIds.indexOf(select1Element.$__root__.id as String);
      if (select1Index >= 0 && select1Index < closestIndex) {
        closestIndex = select1Index;
        closestValue = (ids) =>
            'select1.${select1Element.findChain(ids, action)}'
                .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var button1Index = internalIds.indexOf(this.button1.id);
      if (button1Index >= 0 && button1Index < closestIndex) {
        closestIndex = button1Index;
        closestValue = (_) =>
            'button1.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get button1 {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('CacheInvalidation', 'button1');
    }
    final element = $__root__.createElement(ById('button-1'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('CacheInvalidation', 'button1');
    }
    return returnMe;
  }

  _Nested get select1 {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('CacheInvalidation', 'select1');
    }
    final element = $__root__.createElement(ById('select1'), [], []);
    final returnMe = _Nested.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('CacheInvalidation', 'select1');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$_Nested on _Nested {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersIn_Nested() {
    return {};
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsIn_Nested() {
    return {};
  }

  dynamic testCreatorInvokeMethodIn_Nested(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'option1') {
      return option1;
    }
    if (methodName == 'option2') {
      return option2;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainIn_Nested(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
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
    return {closestIndex: closestValue};
  }

  PageLoaderElement get option1 {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('_Nested', 'option1');
    }
    final element = $__root__.createElement(ById('option1'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('_Nested', 'option1');
    }
    return returnMe;
  }

  PageLoaderElement get option2 {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('_Nested', 'option2');
    }
    final element = $__root__.createElement(ById('option2'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('_Nested', 'option2');
    }
    return returnMe;
  }
}
