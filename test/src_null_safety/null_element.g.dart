// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'null_element.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$BasePO on BasePO {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInBasePO() {
    return {
      'allRows': 'List<PageLoaderElement>',
      'allRowPOs': 'List<RowPO>',
    };
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInBasePO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInBasePO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    if (methodName == 'allRows') {
      return allRows;
    }
    if (methodName == 'allRowPOs') {
      return allRowPOs;
    }
    if (methodName == 'button') {
      return button;
    }
    if (methodName == 'nullButton') {
      return nullButton;
    }
    if (methodName == 'buttonPO') {
      return buttonPO;
    }
    if (methodName == 'nullButtonPO') {
      return nullButtonPO;
    }
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInBasePO(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    try {
      var buttonPOElement = this.buttonPO as dynamic;
      var buttonPOIndex =
          internalIds.indexOf(buttonPOElement.$__root__.id as String);
      if (buttonPOIndex >= 0 && buttonPOIndex < closestIndex) {
        closestIndex = buttonPOIndex;
        closestValue = (ids) =>
            'buttonPO.${buttonPOElement.findChain(ids, action)}'
                .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var nullButtonPOElement = this.nullButtonPO as dynamic;
      var nullButtonPOIndex =
          internalIds.indexOf(nullButtonPOElement.$__root__.id as String);
      if (nullButtonPOIndex >= 0 && nullButtonPOIndex < closestIndex) {
        closestIndex = nullButtonPOIndex;
        closestValue = (ids) =>
            'nullButtonPO.${nullButtonPOElement.findChain(ids, action)}'
                .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var _nullRowPOElement = this._nullRowPO as dynamic;
      var _nullRowPOIndex =
          internalIds.indexOf(_nullRowPOElement.$__root__.id as String);
      if (_nullRowPOIndex >= 0 && _nullRowPOIndex < closestIndex) {
        closestIndex = _nullRowPOIndex;
        closestValue = (ids) =>
            '_nullRowPO.${_nullRowPOElement.findChain(ids, action)}'
                .replaceAll(RegExp('\\.\$'), '');
      }
    } catch (_) {
      // Ignored.
    }
    final _rowPOsElements = this._rowPOs;
    for (var elementIter = 0;
        elementIter < _rowPOsElements.length;
        elementIter++) {
      try {
        var _rowPOsElement = _rowPOsElements[elementIter] as dynamic;
        var _rowPOsIndex =
            internalIds.indexOf(_rowPOsElement.$__root__.id as String);
        if (_rowPOsIndex >= 0 && _rowPOsIndex < closestIndex) {
          closestIndex = _rowPOsIndex;
          closestValue = (ids) =>
              '_rowPOs[$elementIter].${_rowPOsElement.findChain(ids, action)}'
                  .replaceAll(RegExp('\\.\$'), '');
        }
      } catch (_) {
        // Ignored.
      }
    }
    try {
      var buttonIndex = internalIds.indexOf(this.button.id);
      if (buttonIndex >= 0 && buttonIndex < closestIndex) {
        closestIndex = buttonIndex;
        closestValue = (_) =>
            'button.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var nullButtonIndex = internalIds.indexOf(this.nullButton.id);
      if (nullButtonIndex >= 0 && nullButtonIndex < closestIndex) {
        closestIndex = nullButtonIndex;
        closestValue = (_) =>
            'nullButton.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    try {
      var _nullRowElementIndex = internalIds.indexOf(this._nullRowElement.id);
      if (_nullRowElementIndex >= 0 && _nullRowElementIndex < closestIndex) {
        closestIndex = _nullRowElementIndex;
        closestValue = (_) =>
            '_nullRowElement.${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
      }
    } catch (_) {
      // Ignored.
    }
    final _rowElementsElements = this._rowElements;
    for (var elementIter = 0;
        elementIter < _rowElementsElements.length;
        elementIter++) {
      try {
        var _rowElementsIndex =
            internalIds.indexOf(_rowElementsElements[elementIter].id);
        if (_rowElementsIndex >= 0 && _rowElementsIndex < closestIndex) {
          closestIndex = _rowElementsIndex;
          closestValue = (_) =>
              '_rowElements[$elementIter].${PageObject.defaultCode[action] ?? PageObject.defaultCode['default']}';
        }
      } catch (_) {
        // Ignored.
      }
    }
    return {closestIndex: closestValue};
  }

  PageLoaderElement get button {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BasePO', 'button');
    }
    final element = $__root__.createElement(ById('button-1'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BasePO', 'button');
    }
    return returnMe;
  }

  PageLoaderElement get nullButton {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BasePO', 'nullButton');
    }
    final element = NullPageLoaderElement();
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BasePO', 'nullButton');
    }
    return returnMe;
  }

  ButtonPO get buttonPO {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BasePO', 'buttonPO');
    }
    final element = $__root__.createElement(ById('button-1'), [], []);
    final returnMe = ButtonPO.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BasePO', 'buttonPO');
    }
    return returnMe;
  }

  ButtonPO get nullButtonPO {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BasePO', 'nullButtonPO');
    }
    final element = NullPageLoaderElement();
    final returnMe = ButtonPO.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BasePO', 'nullButtonPO');
    }
    return returnMe;
  }

  PageLoaderElement get _nullRowElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BasePO', '_nullRowElement');
    }
    final element = NullPageLoaderElement();
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BasePO', '_nullRowElement');
    }
    return returnMe;
  }

  RowPO get _nullRowPO {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BasePO', '_nullRowPO');
    }
    final element = NullPageLoaderElement();
    final returnMe = RowPO.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BasePO', '_nullRowPO');
    }
    return returnMe;
  }

  PageObjectList<PageLoaderElement> get _rowElements {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BasePO', '_rowElements');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByTagName('tr'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BasePO', '_rowElements');
    }
    return returnMe;
  }

  PageObjectList<RowPO> get _rowPOs {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BasePO', '_rowPOs');
    }
    final returnMe = PageObjectList<RowPO>(
        $__root__.createList(ByTagName('tr'), [], []),
        (PageLoaderElement e) => RowPO.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BasePO', '_rowPOs');
    }
    return returnMe;
  }
}

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
// ignore_for_file: prefer_final_locals, deprecated_member_use_from_same_package

mixin $$ButtonPO on ButtonPO {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInButtonPO() {
    return {};
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInButtonPO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInButtonPO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInButtonPO(
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

mixin $$RowPO on RowPO {
  late PageLoaderElement $__root__;
  PageLoaderElement get $root => $__root__;
  Map<String, String> testCreatorGettersInRowPO() {
    return {};
  }

  Map<String, List<Map<String, String?>>> testCreatorMethodsInRowPO() {
    return {};
  }

  dynamic testCreatorInvokeMethodInRowPO(
      String methodName, List<dynamic> positionalArguments,
      [Map<Symbol, dynamic>? namedArguments]) {
    throw 'METHOD NOT FOUND. This method'
        ' failed to be generated during test creator codegen.';
  }

  Map<int, String Function(List<String>)?> findChainInRowPO(
      List<String> internalIds,
      [String action = 'default']) {
    var closestIndex = internalIds.length;
    String Function(List<String>)? closestValue;
    return {closestIndex: closestValue};
  }
}
