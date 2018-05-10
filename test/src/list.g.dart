// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// Generator: PageObjectGenerator
// **************************************************************************

// ignore_for_file: private_collision_in_mixin_application
class $Lists extends Lists with $$Lists {
  PageLoaderElement $__root__;
  $Lists.create(PageLoaderElement currentContext) : $__root__ = currentContext {
    $__root__.addCheckers([]);
  }
}

class $$Lists {
  PageLoaderElement $__root__;
  PageLoaderMouse __mouse__;
  PageLoaderElement get $root => $__root__;
  Future<PageObjectList<PageLoaderElement>> get tableRows async {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Lists', 'tableRows');
    }
    final returnMe = new PageObjectList<PageLoaderElement>(
        $__root__.createList(const ByTagName('tr'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Lists', 'tableRows');
    }
    return returnMe;
  }

  PageObjectList<PageLoaderElement> get tableRowsSync {
    for (final __listener in $__root__.listeners) {
      __listener.startPageObjectMethod('Lists', 'tableRowsSync');
    }
    final returnMe = new PageObjectList<PageLoaderElement>(
        $__root__.createList(const ByTagName('tr'), [], []),
        (PageLoaderElement e) => e);
    for (final __listener in $__root__.listeners) {
      __listener.endPageObjectMethod('Lists', 'tableRowsSync');
    }
    return returnMe;
  }
}
