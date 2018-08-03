PageLoader
==========

[![Build Status](https://travis-ci.org/google/pageloader.svg?branch=master)](https://travis-ci.org/google/pageloader)

A framework for creating page objects for in-browser tests or Webdriver tests.

Starting with version 3.0.0, PageLoader is changed significantly from version
2.X.X. Refer to **"What Changed since version 2?"** section for more details.

A strongly typed implementation of PageLoader for Dart and does not depend on
dart:mirrors, which is slated for removal in Dart 2.0. If you're starting fresh with
Dart UI testing, we recommend you use PageLoader version 3.X.X. PageLoader version 2.X.X
and below is deprecated and no longer supported.

Migration guide will be added shortly.

If you are looking for the legacy version of PageLoader (with mirrors), refer
to the branch "2-stable" which is in sync with version 2.2.7.

What Changed since version 2?
=============================

There are three big changes here:

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

**PageObject containing Dart files must be in `test/...` directory
for the code generation step to occur.**

For example:
1. `test/page_objects/special_po.dart` will work
2. `test/src/page_objects/special_po.dart` will work
3. `lib/src/foo/my_po.dart` will not work
    * File is located in `lib/...` directory; must be in `test/...`

The above restriction is only **temporary** and will be relaxed in the future.
But by convention, this should be done even after the requirement is relaxed.

Above is the bare minimum boilerplate code needed for a PageObject.
Feel free to cut/paste this when starting new page objects.

To construct a PageObject, use this `create` constructor on either
`HtmlPageLoaderElement` or `WebdriverPageLoaderElement`.

### `HtmlPageLoaderElement` example:

```dart
import 'package:pageloader/html.dart';

Element myElement = ...;
final context = HtmlPageLoaderElement.createFromElement(myElement);
final myPO = MyPO.create(context);
```

`createFromElement` has an additional named argument `SyncFn externalSyncFn`.
This synchronizing function is called on asynchronous events 
(click, type, etc.) and ensures that these events have time to take 
into effect. By default, this is a no-op function. 

An example of a custom sync function:

```dart
HtmlPageLoaderElement.createFromElement(myElement,
        externalSyncFn: (Future action()) async {
      await action();
      // Wait longer than normal
      for (var i = 0; i < 1000; i++) {
        await Future.value();
      }
    });
```

Note that this `externalSyncFn` is then called on every asynchronous method
of that `HtmlPageLoaderElement` as well as its childrens' 
`HtmlPageLoaderElement`s. Refer to **"What is synchronous/asynchronous"** section
for more information about which events are asynchronous.

### `WebdriverPageLoaderElement` example:

```dart
import 'package:pageloader/webdriver.dart';
import 'package:webdriver/sync_io.dart';

String pagePath = ...; // Page uri path
Webdriver driver = ...; // Refer to Webdriver package documentation
WebDriverPageUtils loader = WebDriverPageUtils(driver);
driver.get(pagePath);

WebDriverPageLoaderElement context = loader.root;
WebDriverMouse get mouse = loader.mouse;

final myPO = MyPO.create(context);

// ...run tests...

loader = null;
driver.quit();
```

How do I trigger the generation step?
=====================================
`pub run build_runner build`

Lazy Loading
============
Starting from version 3, all elements are lazy.

```dart
final myPO = MyPO.create(pageLoaderElementContext);
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

Existence Checking
==================

In PageLoader version 2.X.X, the `@optional` tag was used to mark some entity
as possibly not existing. For example:

```dart
// Pageloader2
class MyPO {
  @optional
  @ByTagName('maybe-here')
  PageLoaderElement someElement;
  
  @optional
  @ByTagName('also-maybe-here')
  SomePO somePO;
}
```

In the case that either `someElement` or `somePO` did not
exist, it would have `null` value. 

Starting from version 3, `@optional` is removed and these entities no
longer return as `null`. For `PageLoaderElement`, you directly use
its `.exists` getter to check or use provided matchers.

```dart
import 'package:pageloader/testing.dart';

PageLoaderElement myElement = ...;
expect(myElement.exists, isTrue);
expect(myElement, exists);
```

For PageObjects, use provided matchers:

```dart
import 'package:pageloader/testing.dart';

SomePO somePO = SomePO.create(context);
expect(somePO, exists);
```

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

### Why do we still have async methods?

Interactions, e.g. clicking, typing, etc. still return `Future`s. Why?

Remember that component tests actually run in the browser, with the component,
in the same thread. Dart (like JavaScript) has no threads, so if the test is
doing something then the component is not. If the whole test is synchronous
it'll execute start to finish without any pause, as one massive action in
the event loop.

So, we'll type something, but the component won't update... because it
can't actually execute. And the next line, where we assert something about
the component it will fail:

```dart
myPo.type('someKeys');
expect(myPo.someElement.innerText, 'someKeys'); // This won't work!
```

We need to allow the component to update. Having interactions with the browser
(i.e. clicking, typing) be asynchronous allows the component to change:

```dart
await myPo.type('someKeys'); // Generates a Future.
expect(myPo.someElement.innerText, 'someKeys'); // This is fine now.
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

