// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pointer.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $PageForPointerTest extends PageForPointerTest with $$PageForPointerTest {
  PageLoaderElement $__root__;
  $PageForPointerTest.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageForPointerTest.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageForPointerTest is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageForPointerTest());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String>>>{};
    methods.addAll(testCreatorMethodsInPageForPointerTest());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageForPointerTest(
          methodName, positionalArguments, namedArguments);
    } catch (_) {}

    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  String findChain(List<dynamic> rawInternalIds, [String action = 'default']) {
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
    String Function(List<String>) closestValue;
    MapEntry<int, String Function(List<String>)> chain;
    chain = findChainInPageForPointerTest(internalIds, action).entries.first;
    if (chain.key < closestIndex) {
      closestIndex = chain.key;
      closestValue = chain.value;
    }
    if (closestIndex < internalIds.length) {
      final value = closestValue(internalIds);
      return code[value] ?? value;
    }

    return rootNotFound
        ? null
        : PageObject.defaultCode[action] ?? PageObject.defaultCode['default'];
  }

  static String get tagName =>
      throw '"tagName" is not defined by Page Object "PageForPointerTest". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'PageForPointerTest\n\n${$__root__.toStringDeep()}';
}

mixin $$PageForPointerTest on PageForPointerTest {
  PageLoaderElement $__root__;
  PageLoaderPointer __pointer__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForPointerTest() {
    return {};
  }

  Map<String, List<Map<String, String>>>
      testCreatorMethodsInPageForPointerTest() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForPointerTest(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
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

  Map<int, String Function(List<String>)> findChainInPageForPointerTest(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>) closestValue;
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
    final returnMe = __pointer__;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForPointerTest', 'pointer');
    }
    return returnMe;
  }
}
