## 4.0.0

- Migrate to Unsound Null Safety.
- Stop using deprecated API.
- Add `dispatchCustomEvents` method to `PageLoaderElement`.

## 3.3.2

- Bump dependencies up until but not included null safety versions.
- Stop using deprecated API calls from `analyzer`.
- Remove violations of `private_collision_in_mixin_application`.
- Fix generated code to be compatible with `implicit_casts: false`.
- Use `<int>` type parameter with `Point`.
- Use `Iterator` in HTML/Webdriver iterators to prevent explicit `null` returns.
- Syntactical changes to make null safety migration easier.
- `HtmlPageLoaderElement` sends `key` property value on keyboard usage.
- Add support for `shadowDomChildren`. `shadowDom` is still not supported since it does not return a singular `Element`. However, users may still need to access its children elements.
- Make errors from `@CheckTag`/`@CheckTags` more descriptive.
- Remove usages of `dart:async` imports; they're part of `dart:core` now.
- Improve error message on `isFocused` test matcher.
- Respect `clickOption` in `HtmlPageLoaderElement`'s `click()` method.
- Make `WebdriverPageLoaderElement`'s click more tolerant to changed views ports.
- Check whether a `WebdriverPageLoaderElement` is displayed or not on `visibleText` and `click`.

## 3.3.1

- Fix bug where type parameters were not being passed as args into generated
  unannotated methods.

## 3.3.0

- Expose more files within `lib/html.dart` and `lib/webdriver.dart`.
- New `PageLoaderPointer` entity which behaves similarly to `PageLoaderMouse`. **Only supported for HTML at the moment.**
- Add `@Pointer` annotation (similar to `@Mouse`).
- Fix PageLoader checks when using `@CheckTag(...)` for Safari browser - which produces all upper case tag names.
- Numerous Dart lint fixes and hiding lints within generated files.
- Add `ClickOption` parameter to click-based events within `PageLoaderElement`.
- Add `scroll()` and `scrollIntoView()` functionality to `PageLoaderElement`.
- `focused` and `pointer` getters added to `PageUtils.

## 3.2.5

- Use `built_value` version `7.0.0`.
- Re-add lint ignores in generated files.

## 3.2.4
- Bump SDK minimum version to 2.3.

## 3.2.3
- Bump `analyzer` version to up to `0.40.0`.

## 3.2.2

- `build_config` bumped to 1.6.0.
- Allow `analyzer` version `0.37.x`.

## 3.2.1

- `build_config` dependency now uses version range.

## 3.2.0

- Allow `analyzer` version `0.36.x`.
- Require Dart SDK `>=2.2.0`.

## 3.1.1

- Generated `tagName` getter is now const if valid, getter if not valid.
- HtmlPageLoaderElement's `typeSequence` now calls `syncFn`.

## 3.1.0

- Added `@nullElement` annotation to create a non-existent PageLoaderElement object. 
  Null elements should be returned instead of `null` for better compatibility with
  utils and matcher.
- (`HtmlPageLoaderElement` only) `type(...)` better emulates individual keystrokes and sends
  `keyUp`, `keyPress` and `keyDown` more accurately.
- (`HtmlPageLoaderElement` only) `typeSequence(...)` added to better emulate sequence of
  individual keystrokes.
- `isVisible` utility function and matcher to determine whether an element exists,
  isDisplayed, and isNotHidden.
- Removed `@DisplayedOnly`. Use only `@IsDisplayed` instead.
- (`HtmlPageLoaderElement` only) Supports keyboard input into elements with 
  `contenteditable` attribute.
- More descriptive error messages.
- Lint and deprecated artifact clean up.

## 3.0.3

- Support the latest release of `package:built_value_generator`
  and `package:analyzer`.

## 3.0.2

- Support the latest release of `package:built_value`,
  `package:quiver`, and `package:source_gen`.

## 3.0.1

- Support the latest release of `package:build`.

## 3.0.0

- Added `lookup` constructor that can also be delegated as another constructor.
- Improved HtmlMouse to send more accurate mouse events. `moveTo` API changed.
- Added `clickOutside()` API to PageLoaderElement.
- Lint fixes and suppression in generated code.
- Remove unnecessary usages of `new` and `const`.
- Bump `webdriver` to v2.0.0.
- Update to the latest `source_gen`. This generator can now be used with other
  generators that want to write to .g.dart files without a manual build script.
- Breaking: The `header` builder option is no longer supported.
- `@EnsureTag` is marked as deprecated. Will be removed in a future
  release.
- Add listeners into `WebdriverPageLoaderElement` if searching for
  descendants.
- Add `@ByCheckTag()` as a convenience annotation that can be used
  in place of `@ByTagName(...)`.
- Dart 2 compatible version that uses code generation instead of
  mirrors.
- Dropped `@FirstByCss()` annotation class. Use `@First(ByCss(...))`.
- Added matchers for `PageLoaderElement` and PageObjects.

## 2.2.6

* Fix static analysis warnings for Dart and DDC 1.23.
* Remove PageLoaderElement.attributes, and class WithAttribute.
* Add properties and attributes fields to PageLoaderElement.
* Deprecate PageLoaderElement.seleniumAttributes.

## 2.2.5

* Bump minimum SDK version to 1.21.0.
* Pageloader now builds and tests with Bazel.
* Add new seleniumAttributes getter to PageLoaderElement.

## 2.2.4

* Remove broken KeyEvent use
* Added docs to PageLoaderElement

## 2.2.3

* remove unnecessary casts
* Make getInstance a generic method

## 2.2.2

* strong mode fixes
* added changelog

## 2.2.1

* Fix more strong mode errors.

## 2.2.0

* Fix some strong mode errors.

## 2.1.2

* Add `FirstByCss` finder to help support recursively defined components.

## 2.0.2

* Fixed compatibility issue with the webdriver package's `awaitChecking`.

## 2.0.1

* No functional change. Test Setup has been refactored to eliminate code
  duplication.

# 2.0.0

* No functional change, just bumping the version number.
