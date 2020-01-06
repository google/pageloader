// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
class $Lists extends Lists with $$Lists {
  PageLoaderElement $__root__;
  $Lists.create(PageLoaderElement currentContext) : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $Lists.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "Lists is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "Lists". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'Lists\n\n${$__root__.toStringDeep()}';
}

class $$Lists {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
  Future<PageObjectList<PageLoaderElement>> get basics async {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Lists', 'basics');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByCss('basic'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Lists', 'basics');
    }
    return returnMe;
  }

  Future<PageObjectList<InnerListObject>> get nested async {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Lists', 'nested');
    }
    final returnMe = PageObjectList<InnerListObject>(
        $__root__.createList(ByCss('nested'), [], []),
        (PageLoaderElement e) => InnerListObject.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Lists', 'nested');
    }
    return returnMe;
  }

  Future<PageObjectList<CheckTagPO>> get checkTagPO async {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Lists', 'checkTagPO');
    }
    final returnMe = PageObjectList<CheckTagPO>(
        $__root__.createList(ByTagName('check-tag-po'), [], []),
        (PageLoaderElement e) => CheckTagPO.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Lists', 'checkTagPO');
    }
    return returnMe;
  }

  PageObjectList<PageLoaderElement> get basicsSync {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Lists', 'basicsSync');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByCss('basic'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Lists', 'basicsSync');
    }
    return returnMe;
  }

  PageObjectList<InnerListObject> get nestedSync {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Lists', 'nestedSync');
    }
    final returnMe = PageObjectList<InnerListObject>(
        $__root__.createList(ByCss('nested'), [], []),
        (PageLoaderElement e) => InnerListObject.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Lists', 'nestedSync');
    }
    return returnMe;
  }

  PageObjectList<CheckTagPO> get checkTagPOSync {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Lists', 'checkTagPOSync');
    }
    final returnMe = PageObjectList<CheckTagPO>(
        $__root__.createList(ByTagName('check-tag-po'), [], []),
        (PageLoaderElement e) => CheckTagPO.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Lists', 'checkTagPOSync');
    }
    return returnMe;
  }
}

// ignore_for_file: private_collision_in_mixin_application
class $InnerListObject extends InnerListObject with $$InnerListObject {
  PageLoaderElement $__root__;
  $InnerListObject.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $InnerListObject.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "InnerListObject is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "InnerListObject". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'InnerListObject\n\n${$__root__.toStringDeep()}';
}

class $$InnerListObject {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
  PageLoaderElement get single {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('InnerListObject', 'single');
    }
    final element = $__root__.createElement(ByCss('single'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('InnerListObject', 'single');
    }
    return returnMe;
  }

  Future<PageObjectList<PageLoaderElement>> get innerIterable async {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('InnerListObject', 'innerIterable');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByCss('nested-iterable'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('InnerListObject', 'innerIterable');
    }
    return returnMe;
  }
}

// ignore_for_file: private_collision_in_mixin_application
class $ListsUsingMixin extends ListsUsingMixin
    with $$ListsMixin, $$ListsUsingMixin {
  PageLoaderElement $__root__;
  $ListsUsingMixin.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $ListsUsingMixin.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "ListsUsingMixin is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "ListsUsingMixin". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() => 'ListsUsingMixin\n\n${$__root__.toStringDeep()}';
}

class $$ListsUsingMixin {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
}

// ignore_for_file: private_collision_in_mixin_application

class $$ListsMixin {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
  Future<PageObjectList<PageLoaderElement>> get basics async {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ListsMixin', 'basics');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByCss('basic'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ListsMixin', 'basics');
    }
    return returnMe;
  }

  Future<PageObjectList<InnerListObjectUsingMixin>> get nested async {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ListsMixin', 'nested');
    }
    final returnMe = PageObjectList<InnerListObjectUsingMixin>(
        $__root__.createList(ByCss('nested'), [], []),
        (PageLoaderElement e) => InnerListObjectUsingMixin.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ListsMixin', 'nested');
    }
    return returnMe;
  }

  Future<PageObjectList<CheckTagPO>> get checkTagPO async {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ListsMixin', 'checkTagPO');
    }
    final returnMe = PageObjectList<CheckTagPO>(
        $__root__.createList(ByTagName('check-tag-po'), [], []),
        (PageLoaderElement e) => CheckTagPO.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ListsMixin', 'checkTagPO');
    }
    return returnMe;
  }

  PageObjectList<PageLoaderElement> get basicsSync {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ListsMixin', 'basicsSync');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByCss('basic'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ListsMixin', 'basicsSync');
    }
    return returnMe;
  }

  PageObjectList<InnerListObjectUsingMixin> get nestedSync {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ListsMixin', 'nestedSync');
    }
    final returnMe = PageObjectList<InnerListObjectUsingMixin>(
        $__root__.createList(ByCss('nested'), [], []),
        (PageLoaderElement e) => InnerListObjectUsingMixin.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ListsMixin', 'nestedSync');
    }
    return returnMe;
  }

  PageObjectList<CheckTagPO> get checkTagPOSync {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('ListsMixin', 'checkTagPOSync');
    }
    final returnMe = PageObjectList<CheckTagPO>(
        $__root__.createList(ByTagName('check-tag-po'), [], []),
        (PageLoaderElement e) => CheckTagPO.create(e));
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('ListsMixin', 'checkTagPOSync');
    }
    return returnMe;
  }
}

// ignore_for_file: private_collision_in_mixin_application
class $InnerListObjectUsingMixin extends InnerListObjectUsingMixin
    with $$InnerListObjectMixin, $$InnerListObjectUsingMixin {
  PageLoaderElement $__root__;
  $InnerListObjectUsingMixin.create(PageLoaderElement currentContext)
      : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
  factory $InnerListObjectUsingMixin.lookup(PageLoaderSource source) =>
      throw "'lookup' constructor for class "
          "InnerListObjectUsingMixin is not generated and can only be used on Page Object "
          "classes that have @CheckTag annotation.";
  static String get tagName =>
      throw '"tagName" is not defined by Page Object "InnerListObjectUsingMixin". Requires @CheckTag annotation in order for "tagName" to be generated.';
  String toStringDeep() =>
      'InnerListObjectUsingMixin\n\n${$__root__.toStringDeep()}';
}

class $$InnerListObjectUsingMixin {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
}

// ignore_for_file: private_collision_in_mixin_application

class $$InnerListObjectMixin {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
  PageLoaderElement get single {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('InnerListObjectMixin', 'single');
    }
    final element = $__root__.createElement(ByCss('single'), [], []);
    final returnMe = element;
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('InnerListObjectMixin', 'single');
    }
    return returnMe;
  }

  Future<PageObjectList<PageLoaderElement>> get innerIterable async {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('InnerListObjectMixin', 'innerIterable');
    }
    final returnMe = PageObjectList<PageLoaderElement>(
        $__root__.createList(ByCss('nested-iterable'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('InnerListObjectMixin', 'innerIterable');
    }
    return returnMe;
  }
}
