// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scroll.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$ScrollPO on ScrollPO {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInScrollPO() {
    return {
      'scrollLeft': 'int',
      'scrollTop': 'int',
    };
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInScrollPO() {
    return {
      'scroll': [
        {'name': 'x', 'kind': 'named', 'type': 'int?', 'default': null},
        {'name': 'y', 'kind': 'named', 'type': 'int?', 'default': null},
      ],
    };
  }

  dynamic testCreatorInvokeMethodInScrollPO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'scrollLeft') {
      return scrollLeft;
    }
    if (methodName == 'scrollTop') {
      return scrollTop;
    }
    if (methodName == 'scrollBottom') {
      return scrollBottom;
    }
    if (methodName == 'scroll') {
      return Function.apply(scroll, positionalArguments, namedArguments);
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInScrollPO(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var _scrollBoxIndex = internalIds.indexOf(this._scrollBox.id);
      if (_scrollBoxIndex >= 0 && _scrollBoxIndex < closestIndex) {
        closestIndex = _scrollBoxIndex;
        closestValue = (_) =>
            '_scrollBox.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var scrollBottomIndex = internalIds.indexOf(this.scrollBottom.id);
      if (scrollBottomIndex >= 0 && scrollBottomIndex < closestIndex) {
        closestIndex = scrollBottomIndex;
        closestValue = (_) =>
            'scrollBottom.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var _scrollLeftIndex = internalIds.indexOf(this._scrollLeft.id);
      if (_scrollLeftIndex >= 0 && _scrollLeftIndex < closestIndex) {
        closestIndex = _scrollLeftIndex;
        closestValue = (_) =>
            '_scrollLeft.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var _scrollTopIndex = internalIds.indexOf(this._scrollTop.id);
      if (_scrollTopIndex >= 0 && _scrollTopIndex < closestIndex) {
        closestIndex = _scrollTopIndex;
        closestValue = (_) =>
            '_scrollTop.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get _scrollBox {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ScrollPO', '_scrollBox');
    }
    final element = $__root__.createElement(ById('scroll-box'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ScrollPO', '_scrollBox');
    }
    return returnMe;
  }

  PageLoaderElement get scrollBottom {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ScrollPO', 'scrollBottom');
    }
    final element = $__root__.createElement(ById('scroll-bottom'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ScrollPO', 'scrollBottom');
    }
    return returnMe;
  }

  PageLoaderElement get _scrollLeft {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ScrollPO', '_scrollLeft');
    }
    final element = $__root__.createElement(ById('scroll-left'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ScrollPO', '_scrollLeft');
    }
    return returnMe;
  }

  PageLoaderElement get _scrollTop {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ScrollPO', '_scrollTop');
    }
    final element = $__root__.createElement(ById('scroll-top'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ScrollPO', '_scrollTop');
    }
    return returnMe;
  }
}
