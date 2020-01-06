// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webdriver_only.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
class $WebDriverOnly extends WebDriverOnly with $$WebDriverOnly {
  PageLoaderElement $__root__;
  $WebDriverOnly.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $WebDriverOnly.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "WebDriverOnly is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "WebDriverOnly". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'WebDriverOnly\n\n${$__root__.toStringDeep()}';
}

class $$WebDriverOnly {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
  PageLoaderElement get button1 {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('WebDriverOnly', 'button1');
    }
    final element = $__root__.createElement(ById('button-1'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('WebDriverOnly', 'button1');
    }
    return returnMe;
  }
}
