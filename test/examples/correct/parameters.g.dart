// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameters.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
class $Parameters extends Parameters with $$Parameters {
  PageLoaderElement $__root__;
  $Parameters.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $Parameters.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "Parameters is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "Parameters". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String testOptionalPositionalParam(
      [String first = 'a', String second = 'b']) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'Parameters', 'testOptionalPositionalParam');
    }
    final returnMe = super.testOptionalPositionalParam(first, second);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'Parameters', 'testOptionalPositionalParam');
    }
    return returnMe;
  }

  String testMixedOptionalPositionalParam(String x,
      [String first = 'a', String second = 'b']) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'Parameters', 'testMixedOptionalPositionalParam');
    }
    final returnMe = super.testMixedOptionalPositionalParam(x, first, second);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'Parameters', 'testMixedOptionalPositionalParam');
    }
    return returnMe;
  }

  String testOptionalNamedParam({String first = 'a', String second = 'b'}) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Parameters', 'testOptionalNamedParam');
    }
    final returnMe = super.testOptionalNamedParam(first: first, second: second);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Parameters', 'testOptionalNamedParam');
    }
    return returnMe;
  }

  String testMixedOptionalNamedParam(String x,
      {String first = 'a', String second = 'b'}) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod(
          'Parameters', 'testMixedOptionalNamedParam');
    }
    final returnMe =
        super.testMixedOptionalNamedParam(x, first: first, second: second);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod(
          'Parameters', 'testMixedOptionalNamedParam');
    }
    return returnMe;
  }

  String toStringDeep() => 'Parameters\n\n${$__root__.toStringDeep()}';
}

class $$Parameters {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
}

// ignore_for_file: private_collision_in_mixin_application
class $ParametersUsingMixin extends ParametersUsingMixin
    with $$ParametersMixin, $$ParametersUsingMixin {
  PageLoaderElement $__root__;
  $ParametersUsingMixin.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $ParametersUsingMixin.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "ParametersUsingMixin is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "ParametersUsingMixin". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() =>
      'ParametersUsingMixin\n\n${$__root__.toStringDeep()}';
}

class $$ParametersUsingMixin {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
}

// ignore_for_file: private_collision_in_mixin_application

class $$ParametersMixin {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
}
