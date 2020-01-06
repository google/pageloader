// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mouse.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
class $MouseObject extends MouseObject with $$MouseObject {
  PageLoaderElement $__root__;
  $MouseObject.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $MouseObject.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "MouseObject is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "MouseObject". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'MouseObject\n\n${$__root__.toStringDeep()}';
}

class $$MouseObject {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
  PageLoaderMouse get mouse {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('MouseObject', 'mouse');
    }
    __mouse__ ??= $__root__.utils.mouse;
    final returnMe = __mouse__;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('MouseObject', 'mouse');
    }
    return returnMe;
  }
}

// ignore_for_file: private_collision_in_mixin_application
class $MouseObjectUsingMixin extends MouseObjectUsingMixin
    with $$MouseObjectMixin, $$MouseObjectUsingMixin {
  PageLoaderElement $__root__;
  $MouseObjectUsingMixin.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $MouseObjectUsingMixin.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "MouseObjectUsingMixin is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "MouseObjectUsingMixin". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() =>
      'MouseObjectUsingMixin\n\n${$__root__.toStringDeep()}';
}

class $$MouseObjectUsingMixin {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
}

// ignore_for_file: private_collision_in_mixin_application

class $$MouseObjectMixin {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
  PageLoaderMouse get mouse {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('MouseObjectMixin', 'mouse');
    }
    __mouse__ ??= $__root__.utils.mouse;
    final returnMe = __mouse__;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('MouseObjectMixin', 'mouse');
    }
    return returnMe;
  }
}
