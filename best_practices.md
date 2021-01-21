# PageLoader Best Practices

## DO suffix every PageObject type with 'PO'

PageObject types should be suffixed with 'PO' to quickly distinguish PageObject
types from non-PageObject types.

BAD:

```dart {.bad}
@PageObject()
@CheckTag('special-tag')
abstract class SpecialTag {
  // ...
}
```

GOOD:

```dart {.good}
@PageObject()
@CheckTag('special-tag')
abstract class SpecialTagPO {
   // ...
}
```

## DO annotate every non-mixin PageObject with `@CheckTag(...)`

Non-mixin PageObjects should be annotated with `@CheckTag(...)`. This enables
PageLoader to detect tag mismatch errors quickly. In addition, this allows the
usage of `@ByCheckedTag()` annotation.

**The exception to this rule if a PageObject is intended to match on unknown or
variable tag names.**

BAD:

```dart {.bad}
@PageObject()
abstract class MyTagPO {
  // This PageObject can bind to any tag.
  // ...
}
```

GOOD:

```dart {.good}
@PageObject()
@CheckTag('my-tag')
abstract class MyTagPO {
  // This PageObject can only bind to 'my-tag'.
  // ...
}
```

## DO check for existence on entities that conditionally exist

If any annotated PageLoader entity may not exist (not rendered in the
HTML document), users should explicitly check for their existence
before they are accessed (either directly in test or within another method).

BAD:

```dart {.bad}
@PageObject()
abstract class MyPO {
  // ...constructors...

  @ByTagName('may-exist-tag')
  PageLoaderElement get _mayExist;

  void doSomethingWithMayExist() {
    // use `_mayExist`
  }
}
```

GOOD:

```dart {.good}
@PageObject()
abstract class MyPO {
  // ...constructors...

  @ByTagName('may-exist-tag')
  PageLoaderElement get _mayExist;

  void doSomethingWithMayExist() {
    if (_mayExist.exists) {
      // use `_mayExist`
    }
  }
}
```

## PREFER `@ByCheckTag()` over `@ByTagName(...)` wherever possible

If you're using `@ByTagName(...)` on a PageObject that's annotated with
`@CheckTag(...)`, prefer using `@ByCheckTag()`. This is identical but reduces
verbosity and allows for changing of tag name in a single location.

**This will NOT work if the PageObject is not annotated with `@CheckTag(...)`.**

BAD:

```dart {.bad}
@PageObject()
@CheckTag('child-tag')
abstract class ChildPO { // .... }

@PageObject()
@CheckTag('parent-tag')
abstract class ParentPO {
  // ... constructors ...

  @ByTagName('child-tag')
  ChildPO get childPo;
}

```

GOOD:

```dart {.good}
@PageObject()
@CheckTag('child-tag')
abstract class ChildPO { // .... }

@PageObject()
@CheckTag('parent-tag')
abstract class ParentPO {
  // ... constructors ...

  // 'ChildPO' has '@CheckTag(...)', so we can use '@ByCheckTag()'
  @ByCheckTag()
  ChildPO get childPo;
}

```

## DO suffix PageObject mixins with "POMixin"

Mixin PageObjects should be suffixed with `POMixin` to distinguish them from
non-mixin PageObjects.

Example:

```dart
@PageObject()
abstract class RedButtonPOMixin {
  // This is a mixin PageObject
  // ...
}

@PageObject()
@CheckTag('custom-button')
abstract class CustomButtonPO extends Object with RedButtonPOMixin {
  // This is a non-mixin PageObject
}
```

## DO separate state-altering logic from non-altering logic

Web elements are stateful and their states can change based on user
interactions. For example, some dropdown element may not show up unless a
specific button is clicked. Methods that change the state of the element should
be kept separate from those that do not.

This can be achieved by following these guidelines:

1.  If a PageObject method changes the state of the web element, it should only
    do that.
2.  Avoid state-conditional logic within PageObject methods. Move
    state-conditional logic to tests instead.

BAD:

```dart {.bad}
@PageObject()
@CheckTag('my-menu-box')
abstract class MenuBoxPO {
  // ... constructors ...

  // This returns the state of the wrapped element, but does not change it.
  bool get menuIsClosed => //...

  @ByClass('menu-item')
  List<PageLoaderElement> get items;

  @ByClass('menu-button')
  PageLoaderElement get _menuButton;

  // This changes the state and only does that. This does not violate (1).
  Future<void> openMenu() => _menuButton.click();

  // This violates rules (1) and (2).
  //   (1) Changes the state AND performs additional logic.
  //   (2) Has state-conditional logic.
  Future<void> selectMenuItem(int id) async {
    // This is a state-conditional action and also changes the state implicitly
    if (menuIsClosed) {
      await openMenu();
    }
    await items[id].click();
  }
}

// TEST:
final menuPO = ...;
await menuPO.selectMenuItem(1);
```

GOOD:

```dart {.good}
@PageObject()
@CheckTag('my-menu-box')
abstract class MenuBoxPO {
  // ... constructors ...

  bool get menuIsClosed => //...

  @ByClass('menu-item')
  List<PageLoaderElement> get items;

  @ByClass('menu-button')
  PageLoaderElement get _menuButton;

  Future<void> openMenu() => _menuButton.click();

  Future<void> selectMenuItem(int id) =>  await items[id].click();
}

// TEST:
final menuPO = ...;
// State-conditional logic is moved from PageObject to test.
if (menuPO.menuIsClosed) {
  await menuPO.openMenu();
}
```

## DO use `createPO<T>(...)` for construction of variable PageObject types within another PageObject

If your PageObject needs to create other PageObjects of variable type, use
`createPO<T>` in utils.

Example:

```dart
import 'package:pageloader/utils.dart';

// ...

@PageObject()
@CheckTag('overlay-manager')
abstract class OverlayManagerPO {
  // ... constructors ...

  @root
  PageLoaderElement get _rootElement;

  // Example:
  //   getFromOverlay<MyPO>((c) => MyPO.lookup(c), byCss: const ByCss('my-po-tag'))
  T getFromOverlay<T>(POFactory<T> poFactory, {ByCss bycss}) =>
      createPO<T>(_rootElement, poFactory, finder: byCss)
}
```

## PREFER using `lookup` over `create` if the passed PageLoader context cannot be bound directly

The `create` constructor **directly binds** the PageObject instance with the
passed context. For example:

```dart
@PageObject()
@CheckTag('my-tag')
abstract class MyTagPO {
  MyTagPO();
  factory MyPO.create(PageLoaderElement context) = $MyPO.create;
}

void someTest() {
  PageLoaderElement rootElement = ...;
  final myPO = MyPO.create(rootElement);
}
```

and `rootElement` represents the following HTML:

```html
<my-root-element>
  <my-tag>
    ...
  </my-tag>
<my-root-element>
```

In this example, `MyTagPO` is bound directly to `<my-root-element>` tag.
`MyTagPO` expects `<my-tag>` but is currently bound to `my-root-element`; this
will lead to a tag mismatch error.

This can be fixed by:

```dart
void someTest() {
  PageLoaderElement rootElement = ...;
  final myPO = MyPO.create(
      rootElement.createElement(ByTagName('my-tag'), [], []));
}
```

Rather than manually extracting the correct `<my-tag>` child element from
`rootElement`, users can opt to use the `lookup` constructor to automatically
have PageLoader look up the correct tag within the children tags of the passed
context:

```dart
@PageObject()
@CheckTag('my-tag') // PageLoader knows `MyTagPO` is meant to bind to `my-tag`
abstract class MyTagPO {
  MyTagPO();
  factory MyPO.create(PageLoaderElement context) = $MyPO.create;
  factory MyPO.lookup(PageLoaderSource context) = $MyPO.lookup;
}

void someTest() {
  PageLoaderElement rootElement = ...;
  // Using lookup makes PageLoader automatically look for 'my-tag' context
  // within the `rootElement` context.
  final myPO = MyPO.lookup(rootElement);
}
```

**`lookup` constructor will fail if the PageObject does not have a
`@CheckTag(...)` annotation since PageLoader does not know what to look for.**

## PREFER `@Mouse` over PageUtils.mouse

The mouse entity can be obtained directly through `@Mouse` annotation instead of
PageUtils.

BAD:

```dart {.bad}
@PageObject()
@CheckTag('my-tag')
abstract class MyPO {
  // ... constructors ...

  @root
  PageLoaderElement get rootElement;

  PageLoaderMouse get mouse => rootElement.utils.mouse;
}
```

GOOD:

```dart {.good}
@PageObject()
@CheckTag('my-tag')
abstract class MyPO {
  // ... constructors ...

  @Mouse
  PageLoaderMouse get mouse;
}

```

## PREFER using utils/testing library over manual code

PageLoader provides API to perform common operations/checks on PageLoaderElement
or PageObject. Users should use these API whenever possible.

[Utils API](https://pub.dartlang.org/documentation/pageloader/latest/utils/utils-library.html)

[Testing API](https://pub.dartlang.org/documentation/pageloader/latest/testing/testing-library.html)

BAD:

```dart {.bad}
import 'package:pageloader/pageloader.dart';

@PageObject()
@CheckTag('some-tag')
abstract class SomePO {
  // ....

  @root
  PageLoaderElement get rootElement;
}

SomePO somePO = ...;
final poExists = somePO.rootElement.exists;
```

GOOD:

```dart {.good}
import 'package:pageloader/pageloader.dart';
import 'package:pageloader/utils.dart';

@PageObject()
@CheckTag('some-tag')
abstract class SomePO {
  // ....

  @root
  PageLoaderElement get rootElement;
}

SomePO somePO = ...;
final poExists = exists(somePO);
```

BAD:

```dart {.bad}
expect(somePO.rootElement.exists, isTrue);
```

GOOD:

```dart {.good}
import 'package:pageloader/testing.dart';

expect(somePO, exists);
```

## AVOID making methods in PageObjects too complex

Overly-complex methods within PageObjects limit the reusability and
extensibility of PageObjects. PageObjects should contain simple logic that help
you perform test and test-specific methods should be written in the test file
instead unless the method can be re-used by other tests.

BAD:

```dart {.bad}
@PageObject()
@CheckTag('search-menu')
abstract class SearchMenuPO {
  // ... constructors ...

  @ByClass('search-text-box')
  PageLoaderElement get _searchTextBox;

  @ByClass('search-results')
  List<PageLoaderElement> get _searchResults;

  Future<bool> typeTextAndCheckResult(String searchText, String expectedText) {
    // This method is overly complex and is test-specific.
    await _searchTextBox.click();
    await _searchTextBox.type(searchText);
    return _searchResults.map((e) => e.innerText).contains(expectedText);
  }
}

// TEST:
final searchMenuPO = ...;
expect(await searchMenuPO.typeTextAndCheckResult('foo', 'foobar'), isTrue);
```

GOOD:

```dart {.good}
@PageObject()
@CheckTag('search-menu')
abstract class SearchMenuPO {
  // ... constructors ...

  @ByClass('search-text-box')
  PageLoaderElement get _searchTextBox;

  Future<void> openTextBox() => _searchTextBox.click();

  @ByClass('search-results')
  List<PageLoaderElement> get _searchResults;

  Future<void> typeSearchText(String searchText) =>
      _searchTextBox.type(searchTextBox);

  bool resultContains(String expected) => _searchResults.map(
      (e) => e.innerText).contains(expectedText);

}

// TEST:
final searchMenuPO = ...;

Future<bool> typeTextAndCheckResult(String searchText, String expectedText) {
  await searchMenuPO.openTextBox();
  await searchMenuPO.typeSearchText(searchText);
  return searchMenuPO.resultContains(expectedText);
}

expect(await typeTextAndCheckResult('foo', 'foobar'), isTrue);
```

## AVOID exposing `PageLoaderElement` directly in PO

Instead expose the more granular API you expect in tests.

The reason is that if people start depending on this and using methods inside
`PageLoaderElement` it will be very hard to refactor the component's HTML, as
you will need to provide an element that support all the same interactions. If
on the other hand you just provide method, then it is easy to route old stuff to
new dom elements. It also makes the test code more readable.

BAD:

```dart {.bad}
@PageObject()
@CheckTag('animated-menu')
abstract class AnimatedMenuPO {
  // ... constructors ...
  @ByClass('button')
  PageLoaderElement get button;
}

// TEST:
final animatedMenuPO = // ...
expect(await animatedMenuPO.button.innerText, 'Open');
```

GOOD:

```dart {.good}
@PageObject()
@CheckTag('animated-menu')
abstract class AnimatedMenuPO {
  // ... constructors ...
  @ByClass('button')
  PageLoaderElement get _button;
  String get buttonLabel => _button.innerText;

// TEST:
final animatedMenuPO = // ...
expect(await animatedMenuPO.buttonLabel, 'Open');
```

## DO return `NullPageLoaderElement` instead of `null` if the expected type is a PageLoader entity

If any method signature has a potential to return a `null` value,
return a `NullPageLoaderElement` instance or a
`NullPageLoaderElement`-wrapped PageObject using `@nullElement`:

```dart {.bad}
@PageObject()
abstract class MyPO {
  // ...constructors...

  PageLoaderElement potentialNullElement() {
    // ...logic...
    return null;
  }

  AnotherPO potentialNullPO() {
    // ...logic...
    return null;
  }

  String getSomeString() {
    // ...logic...
    return null;
  }
}
```

Instead:

```dart {.good}
@PageObject()
abstract class MyPO {
  // ...constructors...

  @nullElement
  PageLoaderElement get _nullElement;

  @nullElement
  AnotherPO get _nullPO;

  PageLoaderElement potentialNullElement() {
    // ...logic...
    return _nullElement;
  }

  AnotherPO potentialNullPO() {
    // ...logic...
    return _nullPO;
  }

  // Note: this method is unchanged since `String` is not a PageLoader entity.
  String getSomeString() {
    // ...logic...
    return null;
  }
}
```