// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'mouse.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$PageForMouseTest on PageForMouseTest {
  /*late*/ PageLoaderElement $__root__;
  PageLoaderMouse /*?*/ __mouse__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForMouseTest() {
    return {};
  }

  Map<String, List<Map<String, String /*?*/ >>>
      testCreatorMethodsInPageForMouseTest() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForMouseTest(
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
    if (methodName == 'svgElement') {
      return svgElement;
    }
    if (methodName == 'svgOutputElement') {
      return svgOutputElement;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>) /*?*/ > findChainInPageForMouseTest(
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
    try {
      var svgElementIndex = internalIds.indexOf(this.svgElement.id);
      if (svgElementIndex >= 0 && svgElementIndex < closestIndex) {
        closestIndex = svgElementIndex;
        closestValue = (_) =>
            'svgElement.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var svgOutputElementIndex = internalIds.indexOf(this.svgOutputElement.id);
      if (svgOutputElementIndex >= 0 && svgOutputElementIndex < closestIndex) {
        closestIndex = svgOutputElementIndex;
        closestValue = (_) =>
            'svgOutputElement.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get element {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForMouseTest', 'element');
    }
    final element = $__root__.createElement(ById('mouse'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForMouseTest', 'element');
    }
    return returnMe;
  }

  PageLoaderElement get topElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForMouseTest', 'topElement');
    }
    final element = $__root__.createElement(ById('mouse-top'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForMouseTest', 'topElement');
    }
    return returnMe;
  }

  PageLoaderElement get centerElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForMouseTest', 'centerElement');
    }
    final element = $__root__.createElement(ById('mouse-center'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForMouseTest', 'centerElement');
    }
    return returnMe;
  }

  PageLoaderElement get bottomElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForMouseTest', 'bottomElement');
    }
    final element = $__root__.createElement(ById('mouse-bottom'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForMouseTest', 'bottomElement');
    }
    return returnMe;
  }

  PageLoaderElement get svgElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForMouseTest', 'svgElement');
    }
    final element = $__root__.createElement(ById('svg-element'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForMouseTest', 'svgElement');
    }
    return returnMe;
  }

  PageLoaderElement get svgOutputElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForMouseTest', 'svgOutputElement');
    }
    final element = $__root__.createElement(ById('svg-output'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForMouseTest', 'svgOutputElement');
    }
    return returnMe;
  }

  PageLoaderMouse get mouse {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForMouseTest', 'mouse');
    }
    __mouse__ ??= $__root__.utils.mouse;
    final returnMe = __mouse__ /*!*/;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForMouseTest', 'mouse');
    }
    return returnMe;
  }
}
