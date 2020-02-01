# Introduction

Suppose you want to write tests for this component:

```html
<shopping-cart-menu>
    <shopping-cart>
        <div id="shopping-cart-header">...</div>
        <shopping-cart-item class="food">
            ...
        </shopping-cart-item>
        <shopping-cart-item class="food">
            ...
        </shopping-cart-item>
        <shopping-cart-item class="food">
            ...
        </shopping-cart-item>
    <shopping-cart>
    <button type="button" 
            id="checkout">
        Checkout
    </button>
    <button type="button"
            id="clear-cart">
        Clear Shopping Cart
    </button>
    <div id="sum-cost">...</div>
</shopping-cart-menu>
```

There are two steps:

1. Write your `PageObject`s
2. Write your tests using these `PageObject`s

## 1. Writing your PageObjects

Suppose your Dart project looks like:

```
shopping_cart
|
└───lib (contains HTML components for your shopping cart)
│   | ...
└───test
|   | ...
```

| WARNING: Your PageObject Dart files must be within `test/...` subdirectory |
| --- |

You may create your `PageObject` files directly within `test`, or within another subdirectory (ex: `test/pageobjects/...`). For this
example, we will just be writing directly into `test/`.

We will create three `PageObject`s for:

1. `<shopping-cart-menu>`
2. `<shopping-cart>`
3. `<shopping-cart-item>`

You should ideally create a separate Dart file for each `PageObject`;
you can condense multiple `PageObject`s to the same Dart file if these
`PageObject`s are not expected to grow and are either private or
short-lived.

### 1.1 `<shopping-cart-item>` PageObject

Let's start bottom-up with `<shopping-cart-item>`.
Start with the following boiler-plate code:

```dart
// FILE: shopping_cart/test/shopping_cart_item_po.dart
import 'package:pageloader/pageloader.dart';

// Pre-pend '.g' before '.dart'
// Since our file is `shopping_cart_item_po.dart`,
// we use:     `part 'shopping_cart_item_po.g.dart'`.
part 'shopping_cart_item_po.g.dart';

@PageObject()
abstract class ShoppingCartItemPO {
    ShoppingCartItemPO();
    factory ShoppingCartItemPO.create() =
        $ShoppingCartItemPO.create;
}
```

The above is the absolute bare minimum needed to create a valid
`PageObject`, however this is quite useless as it doesn't do anything
anything special. Let's add some arbitrary methods into this 
`PageObject` with some simple assumptions about the `<shopping-cart-item>` tag:

```dart
// FILE: shopping_cart/test/shopping_cart_item_po.dart
import 'package:pageloader/pageloader.dart';

part 'shopping_cart_item_po.g.dart';

@PageObject()
@CheckTag('shopping-cart-item')
abstract class ShoppingCartItemPO {
    ShoppingCartItemPO();
    factory ShoppingCartItemPO.create() =
        $ShoppingCartItemPO.create;

    @ByTagName('description')
    PageLoaderElement get _descriptionElement;

    @ByTagName('price-box')
    PageLoaderElement get _priceBoxElement;

    String get description => _descriptionElement.innerText;    

    String get price => _priceBoxElement.innerText;
}
```

We're assuming that the `<shopping-cart-item>` has `<description>`
and `<price-box>` elements. We can wrap these elements under the
generic [`PageLoaderElement`] type and bind them to their tag names via
`@ByTagName(...)`. This means that `_descriptionElement` and 
`_priceBoxElement` wrap around `<shopping-cart-item>` and
`<description>` respectively.

This allows Dart code to access information about these HTML elements
or interact with these elements via [`PageLoaderElement API`]. Refer to this API page for more information.

Note that `@CheckTag(...)` is not a requirement, but highly recommended
as a runtime check. In cases where `ShoppingCartItemPO` is bound to
anything other than `<shopping-cart-item>`, PageLoader will throw
an exception at runtime.

For more information about available annotations, refer to
our [detailed anatomy section](anatomy.md).

### 1.2 `<shopping-cart>` PageObject

Let's start with our boiler-plate again:

```dart
// FILE: shopping_cart/test/shopping_cart_po.dart
import 'package:pageloader/pageloader.dart';

part 'shopping_cart_po.g.dart';

@PageObject()
@CheckTag('shopping-cart')
abstract class ShoppingCartPO {
    ShoppingCartPO();
    factory ShoppingCartPO.create(PageLoaderElement context) =
        $ShoppingCartPO.create;
}
```

Since we've already finished writing a `PageObject` for 
`<shopping-cart-item>`, let's use this here:

```dart
// FILE: shopping_cart/test/shopping_cart_po.dart
import 'package:pageloader/pageloader.dart';

import 'shopping_cart_item_po.dart';

part 'shopping_cart_po.g.dart';

@PageObject()
@CheckTag('shopping-cart')
abstract class ShoppingCartPO {
    ShoppingCartPO();
    factory ShoppingCartPO.create(PageLoaderElement context) =
        $ShoppingCartPO.create;

    // This is simple enough to directly use `PageLoaderElement`
    // rather than wrapping it in its own PageObject.
    @ById('shopping-cart-header')
    PageLoaderElement get _header;

    @ByTagName('shopping-cart-item')
    List<ShoppingCartItemPO> get _items;

    int get itemsCount => _items.length;

    String get headerText => _header.innerText;

    String get descriptionForItemAt(int index) =>
            _items[index].description;
}
```

Note here that rather than using `PageLoaderElement` for
`<shopping-cart-item>`, we are using its `PageObject`. This allows us
to abstract functionality to self-contained `PageObject`s rather than
managing multiple layers of `PageLoaderElement`s.

In addition, we wrapped `ShoppingCartItemPO` with a `List<T>` since
we have multiple `<shopping-cart-item>`s.

Since `ShoppingCartItemPO` has a `@CheckTag(...)`, we could have also
done the following:

```dart
...

@ByCheckTag()
List<ShoppingCartItemPO> get _items;

...
```

`@ByCheckTag()` is simply a syntactic sugar for
`@ByTagName('shopping-cart-item')` since PageLoader will automatically
extract the `String` content within `@CheckTag(...)` and use that with
`@ByTagName(...)`. In cases where `shopping-cart-item` may change, this
helps the user avoid having to change the string in multiple places.

### 1.3 `<shopping-cart-menu>` PageObject

Let's create our very last `PageObject` for `<shopping-cart-menu>`:

```dart
// FILE: shopping_cart/test/shopping_cart_menu_po.dart
import 'package:pageloader/pageloader.dart';

import 'shopping_cart_item_po.dart';
import 'shopping_cart_po.dart';

part 'shopping_cart_menu_po.g.dart';

@PageObject()
@CheckTag('shopping-cart-menu')
abstract class ShoppingCartMenuPO {
    ShoppingCartMenuPO();
    factory ShoppingCartMenuPO.create(PageLoaderElement context) =
        $ShoppingCartMenuPO.create;

    @ByTagName('shopping-cart')
    ShoppingCartPO get shoppingCart;

    @ById('clear-cart')
    PageLoaderElement get _clearCartButton;

    @ById('checkout')
    PageLoaderElement get _checkoutButton;

    @ById('sum-cost')
    PageLoaderElement get sumCostElement;

    Future<void> clickCheckout() => _checkoutButton.click();

    Future<void> clickClearCart() => _clearCartButton.click();

    String get sumCost => sumCostElement.innerText;
}
```

Notice that we are once again delegating `<shopping-cart>` element's
functionality to its respective `PageObject`.

## 2. Writing your tests

`PageObjects` are abstract entities that are not implemented until
they are passed with a `context` into their `.create` factory constructor:

```dart
@PageObject()
@CheckTag('shopping-cart-menu')
abstract class ShoppingCartMenuPO {
    ShoppingCartMenuPO();
    factory ShoppingCartMenuPO.create(PageLoaderElement context) =
        $ShoppingCartMenuPO.create;
    ...
}
```

This `context` comes in two flavors:

1. `dart:html`
2. `package:webdriver`

If `dart:html` is used, you are wrapping your PageLoader entities
around the [`dart:html Element`](https://api.dart.dev/stable/2.7.1/dart-html/Element-class.html).

On the other hand, if `package:webdriver` is used, you are wrapping your
PageLoader entities around [`package:webdriver WebDriver`](https://pub.dev/documentation/webdriver/latest/webdriver.io/WebDriver-class.html).

The construction pattern differs based on your choice. 

**Note: your company, organization or team may have their own TestBeds, in which case you should use that instead of the below examples.**

### 2.1 `dart:html` construction

Example:

```dart
import 'dart:html';

import 'package:pageloader/html.dart';

Element myElement = ...;
final context = HtmlPageLoaderElement.createFromElement(myElement);
final myPO = MyPO.create(context);
```

Notice that we are using `HtmlPageLoaderElement` from `package:pageloader/html.dart` here.

For more information on `dart:html`, refer to their [documentation](https://api.dart.dev/stable/2.7.1/dart-html/Element-class.html).
You can also find examples within
this package's source code labeled as `html_?_test.dart`.

### 2.2 `package:webdriver` construction

```dart
import 'package:pageloader/webdriver.dart';
import 'package:webdriver/sync_io.dart';

String pagePath = ...; // Page uri path
Webdriver driver = ...; // Refer to Webdriver package documentation
WebDriverPageUtils loader = WebDriverPageUtils(driver);
driver.get(pagePath);

WebDriverPageLoaderElement context = loader.root;

final myPO = MyPO.create(context);

// ...run tests...

loader = null;
driver.quit();
```

Notice that we are using `WebdriverPageLoaderElement` from `package:pageloader/webdriver.dart` here.

For more information on `package:webdriver`, refer to their [documentation](https://pub.dev/documentation/webdriver/latest/webdriver.io/WebDriver-class.html).
You can also find examples within
this package's source code labeled as `webdriver_?_test.dart`.

### 2.3 Sample tests

Let's go back to our example and write some tests! For this example,
we will be using `dart:html` since it requires no additional
packages and we can directly a library found in its SDK.

Users should have multiple layers of unit tests (ex: one fore each of the `<shopping-cart-menu>`, `<shopping-cart>`, and `<shopping-cart-item>`), but for brevity we will focus only on
the top-most `<shopping-cart-menu>` here.

```dart
// FILE: shopping_cart/test/shopping_cart_menu_test.dart
import 'dart:html';

import 'package:pageloader/html.dart';
import 'package:test/test.dart';

// We don't have to import the other two.
import 'shopping_cart_menu_po.dart';

// https://github.com/dart-lang/test/tree/master/pkgs/test#platform-selectors
@TestOn('browser')

void main() {
    ShoppingCartMenuPO menu;

    setUp(() {
        // `dart:html` Element representing `shopping-cart-menu`
        Element shoppingCartMenu = ...;
        final context = 
            HtmlPageLoaderElement.createFromElement(shoppingCartMenu);
        menu = MyPO.create(context);
    });

    group('shopping cart menu', () async {
        test('should start with 5 items', () {
            expect(menu.shoppingCart.itemCount, equals(5));
        });

        test('clicking clear cart should drop count to 0', () async {
            await menu.clickClearCart();
            expect()
        });
    });
}
```

The above example is a very simplified, but users can easily
add more complex functionalities into `PageObject`s and test these
behaviors directly within their Dart tests.

Users should navigate under PageLoader's `test/...` subdirectory to find
more concrete examples.

### 2.4 Using the `.lookup()` constructor

```dart
// FILE: shopping_cart/test/shopping_cart_menu_test.dart

// ...

void main() {
    ShoppingCartMenuPO menu;

    setUp(() {
        // `dart:html` Element representing `shopping-cart-menu`
        Element shoppingCartMenu = ...;
        final context = 
            HtmlPageLoaderElement.createFromElement(shoppingCartMenu);
        menu = MyPO.create(context);
    });

    //...
}
```

In this example, we had to explicitly find the `dart:html Element`
representing `<shopping-cart-menu>`. This may become tedious
if you're dealing with an HTML document that has many layers.

Instead of manually finding your target element, there is the
`lookup` constructor which you can use so that the `PageObject`
automatically looks up its the tag found in `@CheckTag(...)`
once provided with any element above `<shopping-cart-menu>`.

In `ShoppingCartMenuPO`, add another factory constructor:

```dart
// FILE: shopping_cart/test/shopping_cart_menu_po.dart

// ...

@PageObject()
@CheckTag('shopping-cart-menu')
abstract class ShoppingCartMenuPO {
    ShoppingCartMenuPO();
    factory ShoppingCartMenuPO.create(PageLoaderElement context) =
        $ShoppingCartMenuPO.create;
    factory ShoppingCartMenuPO.lookup(PageLoaderSource context) =
        $ShoppingCartMenuPO.lookup;
    
    // ...
}
```

Then, in your test:

```dart
// FILE: shopping_cart/test/shopping_cart_menu_test.dart

// ...

void main() {
    ShoppingCartMenuPO menu;

    setUp(() {
        // `document` getter from `dart:html` that represents
        // the root node. 
        Element rootDocument = document;
        final context = 
            HtmlPageLoaderElement.createFromElement(rootDocument);
        menu = MyPO.lookup(context);
    });

    //...
}
```

This, however assumes that `<shopping-cart-menu>` is unique underneath
the root HTML document node. If more than one `<shopping-cart-menu>`
is available underneath the root node, users should avoid using
`lookup` constructor and manually navigate to a specific target.

## 3. `package:pageloader/utils.dart` and `package:pageloader/testing.dart`

There are two helper libraries within PageLoader.

[`package:pageloader/utils.dart`](https://pub.dev/documentation/pageloader/latest/utils/utils-library.html) are helper functions that should be used **within PageObject definition files**.

[`package:pageloader/testing.dart`](https://pub.dev/documentation/pageloader/latest/testing/testing-library.html) contains `package:test/test.dart` `Matcher`s that can be used with PageLoader entities. This
library should be used **within test files**. 

[`PageLoaderElement`]: https://github.com/google/pageloader/blob/master/lib/src/api/page_loader_element_interface.dart

[`dart:html`]: https://api.dart.dev/stable/2.7.1/dart-html/dart-html-library.html

[`package:webdriver`]: https://github.com/google/webdriver.dart 

[`PageLoaderElement API`]: https://pub.dev/documentation/pageloader/latest/webdriver/PageLoaderElement-class.html