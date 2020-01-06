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

  S exampleMethod<S>(S s) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Generics', 'exampleMethod');
    }
    final returnMe = super.exampleMethod(s);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Generics', 'exampleMethod');
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
class $CheckedGenerics<T> extends CheckedGenerics<T> with $$CheckedGenerics<T> {
  PageLoaderElement $__root__;
  $CheckedGenerics.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([CheckTag('checked-generics')]);
  }
  factory $CheckedGenerics.lookup(PageLoaderSource source) =>
      $CheckedGenerics.create(source.byTag('checked-generics'));
  static const String tagName = 'checked-generics';
  String typeDefParameter(T thing, MyGenericTypeDef<T> typeDef) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('CheckedGenerics', 'typeDefParameter');
    }
    final returnMe = super.typeDefParameter(thing, typeDef);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('CheckedGenerics', 'typeDefParameter');
    }
    return returnMe;
  }

  String toStringDeep() => 'CheckedGenerics\n\n${$__root__.toStringDeep()}';
}

class $$CheckedGenerics<T> {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
}

// ignore_for_file: private_collision_in_mixin_application
class $GenericPair<T, V> extends GenericPair<T, V> with $$GenericPair<T, V> {
  PageLoaderElement $__root__;
  $GenericPair.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $GenericPair.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "GenericPair is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "GenericPair". Requires @CheckTag annotation in order for "tagName" to be generated.';
  Map<R, S> exampleMethodMap<R, S>(R r, S s) {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('GenericPair', 'exampleMethodMap');
    }
    final returnMe = super.exampleMethodMap(r, s);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('GenericPair', 'exampleMethodMap');
    }
    return returnMe;
  }

  String toStringDeep() => 'GenericPair\n\n${$__root__.toStringDeep()}';
}

class $$GenericPair<T, V> {
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
    final element = $__root__.createElement(ByTagName('x'), [], []);
    final returnMe = Generics<T>.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootPo', 'generics');
    }
    return returnMe;
  }

  CheckedGenerics<T> get checkedGenerics {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootPo', 'checkedGenerics');
    }
    final element =
        $__root__.createElement(ByTagName('checked-generics'), [], []);
    final returnMe = CheckedGenerics<T>.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootPo', 'checkedGenerics');
    }
    return returnMe;
  }

  PageObjectList<Generics<T>> get genericsList {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootPo', 'genericsList');
    }
    final returnMe = PageObjectList<Generics<T>>(
        $__root__.createList(ByTagName('y'), [], []),
        (PageLoaderElement e) => Generics<T>.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootPo', 'genericsList');
    }
    return returnMe;
  }

  PageObjectList<CheckedGenerics<T>> get checkedGenericsList {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootPo', 'checkedGenericsList');
    }
    final returnMe = PageObjectList<CheckedGenerics<T>>(
        $__root__.createList(ByTagName('checked-generics'), [], []),
        (PageLoaderElement e) => CheckedGenerics<T>.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootPo', 'checkedGenericsList');
    }
    return returnMe;
  }
}

// ignore_for_file: private_collision_in_mixin_application
class $GenericsUsingMixin<T> extends GenericsUsingMixin<T>
    with $$GenericsMixin<T>, $$GenericsUsingMixin<T> {
  PageLoaderElement $__root__;
  $GenericsUsingMixin.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $GenericsUsingMixin.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "GenericsUsingMixin is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "GenericsUsingMixin". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'GenericsUsingMixin\n\n${$__root__.toStringDeep()}';
}

class $$GenericsUsingMixin<T> {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
}

// ignore_for_file: private_collision_in_mixin_application

class $$GenericsMixin<T> {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
}

// ignore_for_file: private_collision_in_mixin_application
class $GenericPairUsingMixin<T, V> extends GenericPairUsingMixin<T, V>
    with $$GenericPairMixin<T, V>, $$GenericPairUsingMixin<T, V> {
  PageLoaderElement $__root__;
  $GenericPairUsingMixin.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $GenericPairUsingMixin.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "GenericPairUsingMixin is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "GenericPairUsingMixin". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() =>
      'GenericPairUsingMixin\n\n${$__root__.toStringDeep()}';
}

class $$GenericPairUsingMixin<T, V> {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
}

// ignore_for_file: private_collision_in_mixin_application

class $$GenericPairMixin<T, V> {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
}

// ignore_for_file: private_collision_in_mixin_application
class $RootPoUsingMixin<T> extends RootPoUsingMixin<T>
    with $$RootPoMixin<T>, $$RootPoUsingMixin<T> {
  PageLoaderElement $__root__;
  $RootPoUsingMixin.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $RootPoUsingMixin.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "RootPoUsingMixin is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "RootPoUsingMixin". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'RootPoUsingMixin\n\n${$__root__.toStringDeep()}';
}

class $$RootPoUsingMixin<T> {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
}

// ignore_for_file: private_collision_in_mixin_application

class $$RootPoMixin<T> {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
  Generics<T> get generics {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootPoMixin', 'generics');
    }
    final element = $__root__.createElement(ByTagName('x'), [], []);
    final returnMe = Generics<T>.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootPoMixin', 'generics');
    }
    return returnMe;
  }

  CheckedGenerics<T> get checkedGenerics {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootPoMixin', 'checkedGenerics');
    }
    final element =
        $__root__.createElement(ByTagName('checked-generics'), [], []);
    final returnMe = CheckedGenerics<T>.create(element);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootPoMixin', 'checkedGenerics');
    }
    return returnMe;
  }

  PageObjectList<Generics<T>> get genericsList {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootPoMixin', 'genericsList');
    }
    final returnMe = PageObjectList<Generics<T>>(
        $__root__.createList(ByTagName('y'), [], []),
        (PageLoaderElement e) => Generics<T>.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootPoMixin', 'genericsList');
    }
    return returnMe;
  }

  PageObjectList<CheckedGenerics<T>> get checkedGenericsList {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('RootPoMixin', 'checkedGenericsList');
    }
    final returnMe = PageObjectList<CheckedGenerics<T>>(
        $__root__.createList(ByTagName('checked-generics'), [], []),
        (PageLoaderElement e) => CheckedGenerics<T>.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('RootPoMixin', 'checkedGenericsList');
    }
    return returnMe;
  }
}
