/*
 * Copyright 2014 Google Inc. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
library pageloader.annotations;

import 'interfaces.dart';

import 'dart:collection';

class ById implements Finder {
  final String id;

  const ById(this.id);

  @override
  List<PageLoaderElement> findElements(PageLoaderElement context) =>
      context.getElementsByCss('#$id');

  @override
  String toString() => '@ById("$id")';
}

class ByTagName implements Finder {
  final String tagName;

  const ByTagName(this.tagName);

  @override
  List<PageLoaderElement> findElements(PageLoaderElement context) =>
      context.getElementsByCss(tagName);

  @override
  String toString() => '@ByTagName("$tagName")';
}

class ByCss implements Finder {
  final String locator;

  const ByCss(this.locator);

  @override
  List<PageLoaderElement> findElements(PageLoaderElement context) =>
      context.getElementsByCss(locator);

  @override
  String toString() => '@ByCss("$locator")';
}

class ByClass implements Finder {
  final String className;

  const ByClass(this.className);

  @override
  List<PageLoaderElement> findElements(PageLoaderElement context) =>
      context.getElementsByCss('.$className');

  String toString() => '@ByClass("$className")';
}

/// Finds elements with the given tag name. Unlike [ByTagName],
/// this will also find the current Root if it is the given tag.
class EnsureTag implements Finder {
  final String tagName;

  const EnsureTag(this.tagName);

  @override
  List<PageLoaderElement> findElements(PageLoaderElement context) {
    Union union = new Union([Root, new ByTagName(this.tagName)]);
    List<PageLoaderElement> elements = union.findElements(context);
    IsTag isTagName = new IsTag(this.tagName);
    return isTagName.filter(elements);
  }

  @override
  String toString() => '@EnsureTag("$tagName")';
}

class InShadowDom implements Finder {
  final Finder finder;

  const InShadowDom([this.finder]);

  @override
  List<PageLoaderElement> findElements(PageLoaderElement context) {
    if (finder == null) {
      return new UnmodifiableListView<PageLoaderElement>([context.shadowRoot]);
    } else {
      return finder.findElements(context.shadowRoot);
    }
  }

  @override
  String toString() => '@InShadowDom(${finder == null ? '' : finder})';
}

class Returns {
  final Type type;

  const Returns(this.type);

  String toString() => '@Returns($type)';
}

class ReturnsList extends Returns {
  const ReturnsList(Type type) : super(type);
}

/// Filters element based on visibility.
class WithState extends ElementFilter implements HasFilterFinderOptions {
  final bool _displayed;

  const WithState._(this._displayed);

  /// Match any element as long as it present in the DOM.
  const WithState.present() : this._(null);

  /// Match only elements that are visible (the default behavior in most cases).
  const WithState.visible() : this._(true);

  /// Match only element that are present but invisible.
  const WithState.invisible() : this._(false);

  @override
  List<FilterFinderOption> get options =>
      const [FilterFinderOption.DISABLE_IMPLICIT_DISPLAY_FILTERING];

  @override
  bool keep(PageLoaderElement element) {
    if (_displayed != null) {
      return element.displayed == _displayed;
    }
    return true;
  }

  @override
  String toString() {
    switch (_displayed) {
      case true:
        return '@WithState.visible';
      case false:
        return '@WithState.invisible';
      default:
        return '@WithState.present';
    }
  }
}

/// Normally if an element is not found, an exception is thrown.  This makes
///  it difficult to test for the absence of something in the DOM.  To allow an
///  element to be absent from the DOM, annotate it with this.
const Optional = const _Optional();

class _Optional {
  const _Optional();

  @override
  String toString() => '@Optional';
}

/// Matches the root [PageLoaderElement] being used for constructing the
/// current page object.
const Root = const _Root();

class _Root implements Finder, HasFilterFinderOptions {
  const _Root();

  @override
  List<PageLoaderElement> findElements(PageLoaderElement context) {
    return new UnmodifiableListView<PageLoaderElement>([context]);
  }

  @override
  List<FilterFinderOption> get options =>
      const [FilterFinderOption.DISABLE_IMPLICIT_DISPLAY_FILTERING];

  @override
  String toString() => '@Root';
}

/// Keeps only [PageLoaderElement]s that have the given attribute with the
/// given value.
class WithAttribute extends ElementFilter {
  final String name;
  final String value;

  const WithAttribute(this.name, this.value);

  @override
  bool keep(PageLoaderElement element) => element.attributes[name] == value;

  String toString() => '@WithAttribute($name, $value)';
}

/// Keeps only [PageLoaderElement]s that correspond to the given tag.
class IsTag extends ElementFilter {
  final String tagName;

  const IsTag(this.tagName);

  @override
  bool keep(PageLoaderElement element) => element.name == tagName;

  String toString() => '@IsTag("$tagName")';
}

/// Keeps only [PageLoaderElement]s with the given class.
class WithClass extends ElementFilter {
  final String name;

  const WithClass(this.name);

  @override
  bool keep(PageLoaderElement element) => element.classes.contains(name);

  String toString() => '@WithClass($name)';
}

/// Keeps only [PageLoaderElement]s with the given inner text.
class WithInnerText extends ElementFilter {
  final String text;

  const WithInnerText(this.text);

  @override
  bool keep(PageLoaderElement element) => element.innerText.contains(text);

  String toString() => '@WithInnerText($text)';
}

/// Keeps only [PageLoaderElement]s with the given visible text.
class WithVisibleText extends ElementFilter {
  final String text;

  const WithVisibleText(this.text);

  @override
  bool keep(PageLoaderElement element) => element.visibleText.contains(text);

  String toString() => '@WithVisibleText($text)';
}

/// Return the union of the elements found by all of the passed in Finders.
/// Elements will be returned based on the order of the Finders that found them.
/// If an element would be found by more than one Finder in the provided list,
/// then the element will be in the result based on its the first Finder in the
/// in the Finders list that found it.
class Union implements Finder, HasFilterFinderOptions {
  final List<Finder> _finders;
  final bool _displayedFiltering;

  const Union(this._finders, [this._displayedFiltering = true]);

  @override
  List<PageLoaderElement> findElements(PageLoaderElement context) {
    var elements = new Set<PageLoaderElement>();

    for (var finder in _finders) {
      elements.addAll(finder.findElements(context));
    }

    return new UnmodifiableListView<PageLoaderElement>(elements);
  }

  @override
  List<FilterFinderOption> get options {
    if (_displayedFiltering) {
      return const [];
    } else {
      return const [FilterFinderOption.DISABLE_IMPLICIT_DISPLAY_FILTERING];
    }
  }

  @override
  String toString() => '@Union($_finders, $_displayedFiltering)';
}

/// Return the elements located by a series of finders and filters running in
/// sequence. For example, @ByChained(finderA, finderB, filterX) will find all
/// elements that match B inside an element that matches A and then filter by X.
class Chain implements Finder {
  final List _annotations;

  const Chain(this._annotations);

  @override
  List<PageLoaderElement> findElements(PageLoaderElement context) {
    var elements = [context];

    for (var annotation in _annotations) {
      var newElements = new Set<PageLoaderElement>();
      if (annotation is Filter) {
        newElements.addAll(annotation.filter(new List.from(elements)));
      } else if (annotation is Finder) {
        for (var element in elements) {
          newElements.addAll(annotation.findElements(element));
        }
      }
      elements = newElements;
    }

    return new UnmodifiableListView<PageLoaderElement>(elements);
  }

  @override
  String toString() => '@Chain($_annotations)';
}

/// Evaluates the nested annotation from the global context for the PageLoader
/// instance being used.
class Global implements Finder {
  final Finder annotation;

  const Global(this.annotation);

  @override
  List<PageLoaderElement> findElements(PageLoaderElement context) =>
      annotation.findElements(context.loader.globalContext);

  @override
  String toString() => '@Global($annotation)';
}
