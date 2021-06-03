// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mouse.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package
class $PageForMouseTest extends PageForMouseTest with $$PageForMouseTest {
  PageLoaderElement $__root__;
  $PageForMouseTest.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageForMouseTest.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageForMouseTest is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  String testCreatorGetters() {
    final getters = <String, String>{};
    getters.addAll(testCreatorGettersInPageForMouseTest());
    return json.encode(getters);
  }

  String testCreatorMethods() {
    final methods = <String, List<Map<String, String?>>>{};
    methods.addAll(testCreatorMethodsInPageForMouseTest());
    return json.encode(methods);
  }

  dynamic testCreatorInvokeMethod(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    try {
      return testCreatorInvokeMethodInPageForMouseTest(
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
    chain = findChainInPageForMouseTest(internalIds, action).entries.first;
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
      throw '"tagName" is not defined by Page Object "PageForMouseTest". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'PageForMouseTest\n\n${$__root__.toStringDeep()}';
}

mixin $$PageForMouseTest on PageForMouseTest {
  late PageLoaderElement $__root__;
  PageLoaderMouse? __mouse__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInPageForMouseTest() {
    return {};
  }

  Map<String, List<Map<String, String?>>>
      testCreatorMethodsInPageForMouseTest() {
    return {};
  }

  dynamic testCreatorInvokeMethodInPageForMouseTest(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
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

  Map<int, String Function(List<String>)?> findChainInPageForMouseTest(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
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
    final returnMe = __mouse__!;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForMouseTest', 'mouse');
    }
    return returnMe;
  }
}
