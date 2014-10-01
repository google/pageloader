PageLoader Manual
=================

Introduction
------------

PageLoader provides a mechanism for creating structured page objects easily using an annotation-based mechanism.
 - PageLoader objects can be used in in-browser tests or with WebDriver tests.
 - PageLoader allows the user to create custom annotations for finding elements.
 - PageLoader allows multiple annotations to be combined on a field.
 - PageLoader supports Collections and arrays of elements.
 - PageLoader recursively constructs and loads fields that are not of type PageLoaderElement.
 - By default, PageLoader will only find elements in the page that are visible.

These features combine to allow creation of structured page objects with relative ease.

Basic Usage
-----------

```dart
import 'package:pageloader/objects.dart';
import 'package:pageloader/webdriver.dart';
import 'package:sync_webdriver/webdriver.dart';
class Page {
  @ById('element1')
  PageLoaderElement element;
  @ByTagName('input')
  @WithAttribute('type', 'radio')
  List<PageLoaderElement> radioButtons;
  @ById('select1')
  Select select1;
}
void main() {
  PageLoader loader;
  setUp(() {
    loader = new WebDriverPageLoader(new WebDriver());
  });
  test('test1', () {
    var page = loader.getInstance(Page);
    ...
  });
}
```

Features
--------

**Custom Annotations**

PageLoader includes a library of standard annotations. In addition, any classes that implement Finder or Filter and have a const constructor can also be used as a PageLoader annotation. For example:

```dart
class GwtDebugId extends ById {
  final String _id;
  const GwtDebugId(this._id) ;
  @override
  List<PageLoaderElement> findElements(PageLoaderElement context) =>
      super.findElements('gwt-debug-$_id');
 
  @override
  String toString() => '@GwtDebugId("$_id")';
}
```

Which can then be used:

```dart
@GwtDebugId('my-id') PageLoaderElement element;
```

**Combining Annotations**

A single field on a page object can have multiple find-by annotations. These annotations are broken down into two categories: Finders and Filters. The basic find procedure works as follows:

 - An initial list of candidate elements, _elements_, is identified by using the Finder annotation on the element (every PageLoaded field must have exactly one Finder annotation).
 - If the field is not annotated with a @WithState annotation, then any elements that are currently not visible are removed from _elements_.
 - The list, _elements_, is then passed to each of the Filters, which remove additional unwanted elements.

**Optional Fields**

You can specify that a pageloaded field is optional with

```dart
@ById('id') @Optional PageLoaderElement element;
```
If the field is not present on the page, then `element == null`.

**Function Fields**

You can specify that a field be loaded lazily by giving it a Function-type. This type can be Function, in which case the type can be specified with an `@Returns` or `@ReturnsList` annotation (defaults to PageLoaderElement if no type is provided). Or the type can be specified by a typedef in your code, in which case the type will be based on the typedef'ed function return type.

```dart
@ById('tid') Function element;
```

This field will be loaded using the normal procedure when `element()` is called.

**Basic Object Creation**

When PageLoader sees a field as follows:

```dart
@ByTagName('name') MyClass myClass;
```

`Loader._getInstance(ClassMirror, PageLoaderElement)` is called with `reflectClass(MyClass)` and the first element that matches the find-by annotations. This creates an instance of MyClass using the first no-arg constructor defined for that class, and then assigns all of the fields inside it according to their annotations.

**List or Array Object Creation**

When PageLoader sees a field as follows:

```dart
@ByTagName('name') List<MyClass> myList;
```

it begins by finding the list, _elements_, of all the elements that match the find-by annotations. A `List<MyClass>` of the same length as _elements_ is constructed. Then `Loader._getInstance(ClassMirror, PageLoaderElement)` is used to create instances of `MyClass` from the instances of `PageLoaderElement` in _elements_.
