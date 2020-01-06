// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generics.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
class $Generics<T> extends Generics<T> with $$Generics<T> {
  PageLoaderElement $__root__;
  $Generics.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $Generics.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "Generics is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "Generics". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String typeDefParameter(T thing, MyGenericTypeDef<T> typeDef) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Generics', 'typeDefParameter');
    }
    final returnMe = super.typeDefParameter(thing, typeDef);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Generics', 'typeDefParameter');
    }
    return returnMe;
  }

  String toStringDeep() => 'Generics\n\n${$__root__.toStringDeep()}';
}

class $$Generics<T> {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
}

// ignore_for_file: private_collision_in_mixin_application
class $RootPo<T> extends RootPo<T> with $$RootPo<T> {
  PageLoaderElement $__root__;
  $RootPo.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $RootPo.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "RootPo is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "RootPo". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'RootPo\n\n${$__root__.toStringDeep()}';
}

class $$RootPo<T> {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
  Generics<T> get generics {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootPo', 'generics');
    }
    final element = $__root__.createElement(ById('button-1'), [], []);
    final returnMe = Generics<T>.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootPo', 'generics');
    }
    return returnMe;
  }

  PageObjectList<Generics<T>> get genericsList {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootPo', 'genericsList');
    }
    final returnMe = PageObjectList<Generics<T>>(
        $__root__.createList(ByTagName('td'), [], []),
        (PageLoaderElement e) => Generics<T>.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootPo', 'genericsList');
    }
    return returnMe;
  }
}
