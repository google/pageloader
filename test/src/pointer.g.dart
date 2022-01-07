// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'pointer.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageForPointerTest on PageForPointerTest {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderPointer /*?*/ __pointer__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForPointerTest() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageForPointerTest() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForPointerTest(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> /*?*/ namedArguments]) {
    if (methodName == 'element') {
      return element;
    }
    if (methodName == 'topElement') {
      return topElement;
    }
    if (methodName == 'centerElement') {
      return centerElement;
    }
    if (methodName == 'bottomElement') {
      return bottomElement;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInPageForPointerTest(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) /*?*/ closestValue;
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
    try {
      var topElementIndex = internalIds.indexOf(this.topElement.id);
      if (topElementIndex >= 0 && topElementIndex < closestIndex) {
        closestIndex = topElementIndex;
        closestValue = (_) =>
            'topElement.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var centerElementIndex = internalIds.indexOf(this.centerElement.id);
      if (centerElementIndex >= 0 && centerElementIndex < closestIndex) {
        closestIndex = centerElementIndex;
        closestValue = (_) =>
            'centerElement.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var bottomElementIndex = internalIds.indexOf(this.bottomElement.id);
      if (bottomElementIndex >= 0 && bottomElementIndex < closestIndex) {
        closestIndex = bottomElementIndex;
        closestValue = (_) =>
            'bottomElement.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get element {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForPointerTest', 'element');
    }
    final element = $__root__.createElement(ById('pointer'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForPointerTest', 'element');
    }
    return returnMe;
  }

  PageLoaderElement get topElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForPointerTest', 'topElement');
    }
    final element = $__root__.createElement(ById('pointer-top'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForPointerTest', 'topElement');
    }
    return returnMe;
  }

  PageLoaderElement get centerElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForPointerTest', 'centerElement');
    }
    final element = $__root__.createElement(ById('pointer-center'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForPointerTest', 'centerElement');
    }
    return returnMe;
  }

  PageLoaderElement get bottomElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForPointerTest', 'bottomElement');
    }
    final element = $__root__.createElement(ById('pointer-bottom'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForPointerTest', 'bottomElement');
    }
    return returnMe;
  }

  PageLoaderPointer get pointer {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForPointerTest', 'pointer');
    }
    __pointer__ ??= $__root__.utils.pointer;
    final returnMe = __pointer__ /*!*/;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForPointerTest', 'pointer');
    }
    return returnMe;
  }
}
