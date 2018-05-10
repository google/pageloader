// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_page_objects.dart';

// **************************************************************************
// Generator: PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
class $PageForSimpleTest extends PageForSimpleTest with $$PageForSimpleTest {
  PageLoaderElement $__root__;
  $PageForSimpleTest.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
}

class $$PageForSimpleTest {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
  Table get table {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForSimpleTest', 'table');
    }
    final element = $__root__.createElement(const ByTagName('table'), [], []);
    final returnMe = new Table.create(element);
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
    final returnMe = new PageObjectIterable<Row>(
        $__root__.createIterable(const ByTagName('tr'), [], []),
        (PageLoaderElement e) => new Row.create(e));
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
}

class $$Row {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
  PageObjectIterable<PageLoaderElement> get cells {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Row', 'cells');
    }
    final returnMe = new PageObjectIterable<PageLoaderElement>(
        $__root__.createIterable(const ByTagName('td'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Row', 'cells');
    }
    return returnMe;
  }
}
