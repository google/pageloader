// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
class $Nested extends Nested with $$Nested {
  PageLoaderElement $__root__;
  $Nested.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $Nested.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "Nested is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "Nested". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'Nested\n\n${$__root__.toStringDeep()}';
}

class $$Nested {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
  Finders get findersElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Nested', 'findersElement');
    }
    final element = $__root__.createElement(ByCss('some-nested-class'), [], []);
    final returnMe = Finders.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Nested', 'findersElement');
    }
    return returnMe;
  }
}

// ignore_for_file: private_collision_in_mixin_application
class $NestedUsingMixin extends NestedUsingMixin
    with $$NestedMixin, $$NestedUsingMixin {
  PageLoaderElement $__root__;
  $NestedUsingMixin.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $NestedUsingMixin.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "NestedUsingMixin is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "NestedUsingMixin". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'NestedUsingMixin\n\n${$__root__.toStringDeep()}';
}

class $$NestedUsingMixin {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
}

// ignore_for_file: private_collision_in_mixin_application

class $$NestedMixin {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
  FindersUsingMixin get findersElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('NestedMixin', 'findersElement');
    }
    final element = $__root__.createElement(ByCss('some-nested-class'), [], []);
    final returnMe = FindersUsingMixin.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('NestedMixin', 'findersElement');
    }
    return returnMe;
  }
}
