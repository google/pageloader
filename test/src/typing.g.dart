// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typing.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
// ignore_for_file: unused_field, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
class $PageForTextAreaTypingText extends PageForTextAreaTypingText
    with $$PageForTextAreaTypingText {
  PageLoaderElement $__root__;
  $PageForTextAreaTypingText.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageForTextAreaTypingText.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
      "PageForTextAreaTypingText is not generated and can only be used on Page Object "
      "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "PageForTextAreaTypingText". Requires @CheckTag annotation in order for "tagName" to be generated.';
}

class $$PageForTextAreaTypingText {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__; // ignore: unused_field
  PageLoaderElement get $root => $__root__;
  PageLoaderElement get textArea {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForTextAreaTypingText', 'textArea');
    }
    final element = $__root__.createElement(ById('textarea'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForTextAreaTypingText', 'textArea');
    }
    return returnMe;
  }
}

class $PageForTypingTests extends PageForTypingTests with $$PageForTypingTests {
  PageLoaderElement $__root__;
  $PageForTypingTests.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $PageForTypingTests.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
      "PageForTypingTests is not generated and can only be used on Page Object "
      "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "PageForTypingTests". Requires @CheckTag annotation in order for "tagName" to be generated.';
}

class $$PageForTypingTests {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__; // ignore: unused_field
  PageLoaderElement get $root => $__root__;
  PageLoaderElement get text {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('PageForTypingTests', 'text');
    }
    final element = $__root__.createElement(ById('text'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('PageForTypingTests', 'text');
    }
    return returnMe;
  }
}
