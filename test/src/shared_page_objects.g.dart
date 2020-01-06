// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_page_objects.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
class $PageForSimpleTest extends PageForSimpleTest with $$PageForSimpleTest {
  PageLoaderElement $__root__;
  $PageForSimpleTest.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageForSimpleTest.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageForSimpleTest is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "PageForSimpleTest". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'PageForSimpleTest\n\n${$__root__.toStringDeep()}';
}

class $$PageForSimpleTest {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
  Table get table {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForSimpleTest', 'table');
    }
    final element = $__root__.createElement(ByTagName('table'), [], []);
    final returnMe = Table.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForSimpleTest', 'table');
    }
    return returnMe;
  }
}

// ignore_for_file: private_collision_in_mixin_application
class $Table extends Table with $$Table {
  PageLoaderElement $__root__;
  $Table.create(PageLoaderElement currentContext) : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $Table.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "Table is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "Table". Requires @CheckTag annotation in order for "tagName" to be generated.';
  Future doSlowAction() {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Table', 'doSlowAction');
    }
    final returnMe = super.doSlowAction();
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Table', 'doSlowAction');
    }
    return returnMe;
  }

  String toStringDeep() => 'Table\n\n${$__root__.toStringDeep()}';
}

class $$Table {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
  PageLoaderElement get table {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Table', 'table');
    }
    final element = $__root__;
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Table', 'table');
    }
    return returnMe;
  }

  PageObjectIterable<Row> get rows {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Table', 'rows');
    }
    final returnMe = PageObjectIterable<Row>(
        $__root__.createIterable(ByTagName('tr'), [], []),
        (PageLoaderElement e) => Row.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Table', 'rows');
    }
    return returnMe;
  }
}

// ignore_for_file: private_collision_in_mixin_application
class $Row extends Row with $$Row {
  PageLoaderElement $__root__;
  $Row.create(PageLoaderElement currentContext) : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $Row.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "Row is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "Row". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'Row\n\n${$__root__.toStringDeep()}';
}

class $$Row {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
  PageObjectIterable<PageLoaderElement> get cells {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Row', 'cells');
    }
    final returnMe = PageObjectIterable<PageLoaderElement>(
        $__root__.createIterable(ByTagName('td'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Row', 'cells');
    }
    return returnMe;
  }
}
