// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mouse.dart';

// **************************************************************************
// Generator: PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
class $MouseObject extends MouseObject with $$MouseObject {
  PageLoaderElement $__root__;
  $MouseObject.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
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
