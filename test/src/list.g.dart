// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides

part of 'list.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
class $Lists extends Lists with $$Lists {
  PageLoaderElement $__root__;
  $Lists.create(PageLoaderElement currentContext) : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $Lists.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
      "Lists is not generated and can only be used on Page Object "
      "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "Lists". Requires @CheckTag annotation in order for "tagName" to be generated.';
}

class $$Lists {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__; // ignore: unused_field
  PageLoaderElement get $root => $__root__;
  Future<PageObjectList<PageLoaderElement>> get tableRows async {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Lists', 'tableRows');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByTagName('tr'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Lists', 'tableRows');
    }
    return returnMe;
  }

  PageObjectList<PageLoaderElement> get tableRowsSync {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Lists', 'tableRowsSync');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByTagName('tr'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Lists', 'tableRowsSync');
    }
    return returnMe;
  }

  PageObjectList<RowPO> get tableRowsSyncAsPO {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Lists', 'tableRowsSyncAsPO');
    }
    final returnMe = PageObjectList<RowPO>(
        $__root__.createList(ByTagName('tr'), [], []),
        (PageLoaderElement e) => RowPO.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Lists', 'tableRowsSyncAsPO');
    }
    return returnMe;
  }
}

// ignore_for_file: private_collision_in_mixin_application
class $RowPO extends RowPO with $$RowPO {
  PageLoaderElement $__root__;
  $RowPO.create(PageLoaderElement currentContext) : $__root__ = currentContext {
    $__root__.addCheckers([CheckTag('tr')]);
  }
  factory $RowPO.lookup(PageLoaderSource source) =>
      $RowPO.create(source.byTag('tr'));
  static String get tagName => 'tr';
  bool get exists {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RowPO', 'exists');
    }
    final returnMe = super.exists;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RowPO', 'exists');
    }
    return returnMe;
  }
}

class $$RowPO {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__; // ignore: unused_field
  PageLoaderElement get $root => $__root__;
  PageLoaderElement get _root {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RowPO', '_root');
    }
    final element = $__root__;
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RowPO', '_root');
    }
    return returnMe;
  }
}
