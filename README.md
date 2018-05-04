PageLoader
==========

[![Build Status](https://travis-ci.org/google/pageloader.svg?branch=master)](https://travis-ci.org/google/pageloader)
[![pub package](https://img.shields.io/pub/v/pageloader.svg)](https://pub.dartlang.org/packages/pageloader)

A framework for creating page objects for in-browser tests or Webdriver tests.

Starting with version 3.0.0, PageLoader is changed significantly from version
2.X.X. Refer to **"What Changed?"** section for more details.

A strongly typed implementation of PageLoader for Dart and does not depend on
dart:mirrors, which is slated for removal in Dart 2.0. If you're starting fresh with
Dart UI testing, we recommend you use PageLoader version 3.X.X. PageLoader version 2.X.X
and below is deprecated and no longer supported.

Migration guide will be added shortly.

If you are looking for the legacy version of PageLoader (with mirrors), refer
to the branch "2-stable" which is in sync with version 2.2.7.

What Changed?
=============

There's three big changes here:

1. Instead of using dart:mirrors, code generation is used. 
   Unfortunately this means extra boilerplate code. Every PageObject
   you write will also now have a generated component.
   
2. Everything is lazily loaded by default. `Lazy<T>` and `@optional` from
   version 2.X.X no longer exists.

3. Sync-ification of the API, which means significantly fewer `Future`s and `await`s.

Boilerplate
===========

Version 3.0.0 and above uses Dart code-gen, so the generator needs a
couple of hints to trigger the generation step. The boilerplate is:

```dart
// Assume this file is called: 'my_po.dart'
import 'package:pageloader/pageloader.dart';

part 'my_po.g.dart';

@PageObject()
abstract class MyPO {
  MyPO();
  factory MyPO.create(PageLoaderElement context) =
      $MyPO.create;
}
```

Above is the bare minimum boilerplate code needed for a PageObject.
Feel free to cut/paste this when starting new page objects.

Construction of these PageObjects are easy; call the 'create' constructor
and pass in the context. You want the `<html>` node for tests.

```dart
final myPO = new MyPO.create(pageLoaderElementContext);
```

Lazy Loading
============
In PageLoader3, all elements are lazy.

```dart
final myPO = new MyPO.create(pageLoaderElementContext);
```

Nothing happens with the browser at this point. You need to either
read information from the page or interact with the browser:

```dart
final anotherPO = myPO.anotherPO; // Still does nothing
anotherPO.click(); // Finds the page object, and clicks it
expect(anotherPO.innertext, 'text'); // Finds page object again and reads inner text
```

This matches how the rest of the API worked: you read attributes lazily,
you read text lazily, and now you find elements lazily.

What is synchronous/asynchronous?
=================================
PageLoaderElements in version 3.0.0 and above use both synchronous
and asynchronous calls in the API. The basic rule is as follows:
any call that cannot change the DOM is synchronous, and any call
that can change the DOM is asynchronous.

For example, reading DOM attributes or finding elements is synchronous.
Click and typing are still asynchronous.

```dart
Future<bool> doSomething() async {
  await myPageElement.click();
  final text = myPageElement.innerText;
  await myOtherElement.type(text);
  return myOtherElement.attributes['someattr'] == 'value';
}
```

Inheritance
===========
With code-gen, direct inheritance is no longer allowed. However,
you can use mixins or delegation to keep 'inheritance-like'
behavior in your code.

Consider: 
```dart
@PageObject()
abstract class BasePO {
  // ... boilerplate code ...
  
  @ByTagName('my-widget')
  MyWidgetPO get myWidget;
  
  String get widgetInnerText => myWidget.innerText;
}

@PageObject()
abstract class ExtraPO extends BasePO { // 'extends' not allowed
  // ... boilerplate code ...
  
  @ByTagName('extra-widget')
  MyExtraWidgetPO get extraWidget;
}
```

Delegation method fix:
```dart
@PageObject()
abstract class BasePO {
  // ... boilerplate code ...
  
  @ByTagName('my-widget')
  MyWidgetPO get myWidget;
  
  String get widgetInnerText => myWidget.innerText;
}

@PageObject()
abstract class ExtraPO {
  // ... boilerplate code ...
  
  @root
  BasePO get _basePO;
  
  MyWidgetPO get myWidget => _basePO.myWidget;
  
  String get widgetInnerText => _basePO.widgetInnerText;
  
  @ByTagName('extra-widget')
  MyExtraWidgetPO get extraWidget;
}
```

Mixin method fix:
```dart
@PageObject()
abstract class BasePO extends Object with BasePOMixin {
  // This should ONLY have the constructors
  BasePO();
  factory BasePO.create(PageLoaderElement context) =
     $BasePO.create;
}

@PageObject()
abstract class BasePOMixin {
  // Note that here are no constructors here.
  
  @ByTagName('my-widget')
  MyWidgetPO get myWidget;
  
  String get widgetInnerText => myWidget.innerText;
}

@PageObject()
abstract class ExtraPO extends Object with BasePOMixin {
  // ... boilerplate code ...
  
  @root
  BasePO get _basePO;
  
  MyWidgetPO get myWidget => _basePO.myWidget;
  
  String get widgetInnerText => _basePO.widgetInnerText;
  
  @ByTagName('extra-widget')
  MyExtraWidgetPO get extraWidget;
}
```