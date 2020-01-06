// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mouse.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
class $PageForMouseTest extends PageForMouseTest with $$PageForMouseTest {
  PageLoaderElement $__root__;
  $PageForMouseTest.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageForMouseTest.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "PageForMouseTest is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "PageForMouseTest". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'PageForMouseTest\n\n${$__root__.toStringDeep()}';
}

class $$PageForMouseTest {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
  PageLoaderElement get element {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForMouseTest', 'element');
    }
    final element = $__root__.createElement(ById('mouse'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForMouseTest', 'element');
    }
    return returnMe;
  }

  PageLoaderElement get topElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForMouseTest', 'topElement');
    }
    final element = $__root__.createElement(ById('mouse-top'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForMouseTest', 'topElement');
    }
    return returnMe;
  }

  PageLoaderElement get centerElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForMouseTest', 'centerElement');
    }
    final element = $__root__.createElement(ById('mouse-center'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForMouseTest', 'centerElement');
    }
    return returnMe;
  }

  PageLoaderElement get bottomElement {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForMouseTest', 'bottomElement');
    }
    final element = $__root__.createElement(ById('mouse-bottom'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForMouseTest', 'bottomElement');
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
