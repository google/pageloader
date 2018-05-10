// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generics.dart';

// **************************************************************************
// Generator: PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
class $Generics<T> extends Generics<T> with $$Generics<T> {
  PageLoaderElement $__root__;
  $Generics.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
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
}

class $$RootPo<T> {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
  Generics<T> get generics {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootPo', 'generics');
    }
    final element = $__root__.createElement(const ById('button-1'), [], []);
    final returnMe = new Generics<T>.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootPo', 'generics');
    }
    return returnMe;
  }

  PageObjectList<Generics<T>> get genericsList {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootPo', 'genericsList');
    }
    final returnMe = new PageObjectList<Generics<T>>(
        $__root__.createList(const ByTagName('td'), [], []),
        (PageLoaderElement e) => new Generics<T>.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootPo', 'genericsList');
    }
    return returnMe;
  }
}
