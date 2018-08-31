// Copyright 2017 Google Inc. All rights reserved.
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

library pageloader.annotations;

import 'annotation_interfaces.dart';
import 'page_loader_element_interface.dart';
import 'page_loader_mouse_interface.dart';

export 'page_object_annotation.dart';

/// Matches the root [PageLoaderElement] being used for constructing the
/// current page object. Allows [PageLoaderElement] interactions (e.g. clicking)
/// directly on a page object.
///
/// Must be applied to a [PageLoaderElement] getter. No other annotations may be
/// used.
const root = _Root();

class _Root {
  const _Root();

  @override
  String toString() => '@root';
}

/// Convenience annotation for using [PageLoaderMouse] within a page object.
///
/// Must be applied to a [PageLoaderMouse] getter. No other annotations may be
/// used.
const Mouse = _Mouse();

class _Mouse {
  const _Mouse();

  @override
  String toString() => '@Mouse';
}

/// Finder annotations. See [CssFinder] for usage details.

/// Finds elements by the page object's @CheckTag contents.
///
/// Example, given:
///   @CheckTag('example-tag')
///   @PageObject()
///   abstract class ExampleTagPO { ... }
/// Then:
///   @ByCheckTag()
///   ExampleTagPO get exampleTag;
/// is equivalent to:
///   @ByTagName('example-tag')
///   ExampleTagPO get exampleTag;
class ByCheckTag implements Finder {
  const ByCheckTag();
}

/// Finds elements by their CSS class.
class ByClass implements CssFinder {
  final String _class;

  const ByClass(this._class);

  @override
  String get cssSelector => '.$_class';

  @override
  String toString() => '@ByClass("$_class")';
}

/// Finds elements by some arbitrary CSS selector.
class ByCss implements CssFinder {
  final String _locator;

  const ByCss(this._locator);

  @override
  String get cssSelector => _locator;

  @override
  String toString() => '@ByCss("$_locator")';
}

/// Finds element by debugid.
class ByDebugId implements CssFinder {
  final String _debugId;
  final bool useDash;
  final bool usePlain;
  final bool useCamelCase;

  /// @ByDebugId('x') looks for debug id attribute. By default (no args),
  /// looks for 'debugid=x', 'debug-id=x', or 'debugId="x"'.
  ///
  /// Args:
  ///   `useDash` looks for 'debug-id'
  ///   `usePlain` looks for 'debugid'
  ///   `useCamelCase` looks for 'debugId'
  ///
  /// If one or more named args are provided, looks for only those debug ids:
  ///   Example: @ByDebugId('x', useDash: true, usePlain: true)
  ///       looks for 'debug-id=x' or 'debugid=x'
  const ByDebugId(this._debugId,
      {this.useDash: false, this.usePlain: false, this.useCamelCase: false});

  String get _default => '$_useDash,$_usePlain,$_useCamelCase';

  String get _useDash => '[debug-id=$_debugId]';

  String get _usePlain => '[debugid=$_debugId]';

  String get _useCamelCase => '[debugId=$_debugId]';

  @override
  String get cssSelector {
    final selectors = <String>[];
    if (useDash) {
      selectors.add(_useDash);
    }
    if (usePlain) {
      selectors.add(_usePlain);
    }
    if (useCamelCase) {
      selectors.add(_useCamelCase);
    }
    if (selectors.isEmpty) {
      return _default;
    }
    return selectors.join(',');
  }

  @override
  String toString() => '@ByDebugId("$_debugId")';
}

/// Finds element by ID.
class ById implements CssFinder {
  final String _id;

  const ById(this._id);

  @override
  String get cssSelector => '#$_id';

  @override
  String toString() => '@ById("$_id")';
}

/// Finds elements by tag name.
class ByTagName implements CssFinder {
  final String _tagName;

  const ByTagName(this._tagName);

  @override
  String get cssSelector => _tagName;

  @override
  String toString() => '@ByTagName("$_tagName")';
}

/// Finds elements based on the global context.
class Global implements ContextFinder {
  final CssFinder _finder;

  const Global(this._finder);

  @override
  List<PageLoaderElement> findElements(PageLoaderElement context) {
    return context.utils.root.getElementsByCss(_finder.cssSelector);
  }
}

/// Given a finder select the first element.
class First implements ContextFinder {
  final CssFinder _finder;

  const First(this._finder);

  @override
  List<PageLoaderElement> findElements(PageLoaderElement context) {
    final results = context.getElementsByCss(_finder.cssSelector);
    return results.isEmpty ? [] : [results.first];
  }
}

/// Checker annotations. See [Checker] for usage details.

/// Checks the tag for a page object.
///
/// Typically used at the class level to check that a page object, when used,
/// is used in the intended context.
class CheckTag implements Checker {
  final String _expectedTagName;

  const CheckTag(this._expectedTagName);

  @override
  bool check(PageLoaderElement element) => element.name == _expectedTagName;

  @override
  String toString() => '@CheckTag("$_expectedTagName")';
}

/// Checks that a tag is one of the tag names provided.
///
/// Useful when a page object can be shared between multiple components because
/// their interactions are the same. For example a button and a FAB button are
/// different components, but their interactions are the same.
class CheckTags implements Checker {
  final List<String> _tagNames;

  const CheckTags(this._tagNames);

  @override
  bool check(PageLoaderElement element) => _tagNames.contains(element.name);

  @override
  String toString() => '@CheckTags("$_tagNames")';
}

/// Combines @ByTagName and @CheckTag. For use only on class declarations.
///
/// This is only really useful if you plan to create the page object directly,
/// e.g. from a test. Otherwise you'll be chaining Finders, which is at best
/// a performance hit and at worse a cause of tricky bugs.
@Deprecated("Use '@CheckTag' instead. '@EnsureTag' is only kept to make "
    "migration easier. Will be removed in a future version.")
class EnsureTag implements Checker, ContextFinder {
  final String _expectedTagName;

  const EnsureTag(this._expectedTagName);

  @override
  bool check(PageLoaderElement element) => element.name == _expectedTagName;

  @override
  List<PageLoaderElement> findElements(PageLoaderElement context) {
    if (context.name == _expectedTagName) {
      return [context];
    }
    return context.getElementsByCss(_expectedTagName);
  }

  @override
  String toString() => '@EnsureTag("$_expectedTagName")';
}

/// Filter annotations. See [Filter] for usage details.
class DisplayedOnly extends Filter {
  const DisplayedOnly();

  @override
  bool keep(PageLoaderElement element) => element.displayed;

  @override
  String toString() => '@DisplayedOnly()';
}

/// Similar to [DisplayedOnly], but adjustable to filter non-displayed.
///
/// `IsDisplayed()` and `IsDisplayed(true)` is identical to
/// [DisplayedOnly].
class IsDisplayed extends Filter {
  final bool _displayed;

  const IsDisplayed([this._displayed = true]);

  @override
  bool keep(PageLoaderElement element) => element.displayed == _displayed;

  @override
  String toString() => '@IsDisplayed($_displayed)';
}

/// Keeps only [PageLoaderElement]s that correspond to the given tag.
class IsTag extends Filter {
  final String _name;

  const IsTag(this._name);

  @override
  bool keep(PageLoaderElement element) => element.name == _name;

  @override
  String toString() => '@IsTag("$_name")';
}

/// Keeps only [PageLoaderElement]s that have the given attribute with the
/// given value.
class WithAttribute extends Filter {
  final String name;
  final String value;

  const WithAttribute(this.name, this.value);

  @override
  bool keep(PageLoaderElement element) => element.attributes[name] == value;

  @override
  String toString() => '@WithAttribute("$name", "$value")';
}

/// Keeps only [PageLoaderElement]s with the given class.
class WithClass extends Filter {
  final String _class;

  const WithClass(this._class);

  @override
  bool keep(PageLoaderElement element) => element.classes.contains(_class);

  @override
  String toString() => '@WithClass("$_class")';
}

/// Keeps only [PageLoaderElement]s with the given inner text.
class WithInnerText extends Filter {
  final String _text;

  const WithInnerText(this._text);

  @override
  bool keep(PageLoaderElement element) => element.innerText.contains(_text);

  @override
  String toString() => '@WithInnerText("$_text")';
}

/// Keeps only [PageLoaderElement]s that have the given property with the
/// given value.
class WithProperty extends Filter {
  final String _property;
  final String _value;

  const WithProperty(this._property, this._value);

  @override
  bool keep(PageLoaderElement element) =>
      element.properties[_property] == _value;

  @override
  String toString() => '@WithProperty($_property, $_value)';
}

/// Keeps only [PageLoaderElement]s with the given visible text.
class WithVisibleText extends Filter {
  final String _text;

  const WithVisibleText(this._text);

  @override
  bool keep(PageLoaderElement element) => element.visibleText.contains(_text);

  @override
  String toString() => '@WithVisibleText("$_text")';
}
