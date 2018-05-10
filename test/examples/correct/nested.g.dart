// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides

part of 'nested.dart';

// **************************************************************************
// Generator: PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
class $Nested extends Nested with $$Nested {
  PageLoaderElement $__root__;
  $Nested.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
}

class $$Nested {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
  Finders get findersElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Nested', 'findersElement');
    }
    final element =
        $__root__.createElement(const ByCss('some-nested-class'), [], []);
    final returnMe = new Finders.create(element);
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
    final element =
        $__root__.createElement(const ByCss('some-nested-class'), [], []);
    final returnMe = new FindersUsingMixin.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('NestedMixin', 'findersElement');
    }
    return returnMe;
  }
}
