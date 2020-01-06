// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'null_element.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
class $BasePO extends BasePO with $$BasePO {
  PageLoaderElement $__root__;
  $BasePO.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $BasePO.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "BasePO is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "BasePO". Requires @CheckTag annotation in order for "tagName" to be generated.';
  List<PageLoaderElement> get allRows {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BasePO', 'allRows');
    }
    final returnMe = super.allRows;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BasePO', 'allRows');
    }
    return returnMe;
  }

  List<RowPO> get allRowPOs {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('BasePO', 'allRowPOs');
    }
    final returnMe = super.allRowPOs;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('BasePO', 'allRowPOs');
    }
    return returnMe;
  }

  String toStringDeep() => 'BasePO\n\n${$__root__.toStringDeep()}';
}

class $$BasePO {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
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

// ignore_for_file: private_collision_in_mixin_application
class $ButtonPO extends ButtonPO with $$ButtonPO {
  PageLoaderElement $__root__;
  $ButtonPO.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $ButtonPO.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "ButtonPO is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "ButtonPO". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'ButtonPO\n\n${$__root__.toStringDeep()}';
}

class $$ButtonPO {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
}

// ignore_for_file: private_collision_in_mixin_application
class $RowPO extends RowPO with $$RowPO {
  PageLoaderElement $__root__;
  $RowPO.create(PageLoaderElement currentContext) : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $RowPO.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "RowPO is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "RowPO". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'RowPO\n\n${$__root__.toStringDeep()}';
}

class $$RowPO {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
}
