// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webdriver_only.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
class $WebDriverOnly extends WebDriverOnly with $$WebDriverOnly {
  PageLoaderElement $__root__;
  $WebDriverOnly.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
}

class $$WebDriverOnly {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
  PageLoaderElement get button1 {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('WebDriverOnly', 'button1');
    }
    final element = $__root__.createElement(const ById('button-1'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('WebDriverOnly', 'button1');
    }
    return returnMe;
  }
}
