// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mouse.dart';

// **************************************************************************
// Generator: PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
class $PageForMouseTest extends PageForMouseTest with $$PageForMouseTest {
  PageLoaderElement $__root__;
  $PageForMouseTest.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
}

class $$PageForMouseTest {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
  PageLoaderElement get element {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForMouseTest', 'element');
    }
    final element = $__root__.createElement(const ById('mouse'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForMouseTest', 'element');
    }
    return returnMe;
  }

  PageLoaderMouse get mouse {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForMouseTest', 'mouse');
    }
    __mouse__ ??= $__root__.utils.mouse;
    final returnMe = __mouse__;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForMouseTest', 'mouse');
    }
    return returnMe;
  }
}
