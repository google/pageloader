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

/// Iterables specific for Pageloader.
///
/// These iterables are intended to function roughly like normal Dart
/// [Iterable]s, but return [Future]s for calls that may result in async
/// behavior (e.g., interacting with WebDriver).

library pageloader.api.iterable_interfaces;

import 'dart:async';

import 'page_loader_element_interface.dart';

/// Function for constructing a page object.
typedef E PageObjectConstructor<E>(PageLoaderElement e);

/// Iterable for collections of page objects and [PageLoaderElement]s.
///
/// This is a wrapper to construct page objects based on an underlying
/// [PageElementIterable]. The implementations of [PageElementIterable]
/// provided by Pageloader result in the page being refreshed with the current
/// state of the DOM.
///
/// If the page is not stable, there is no guarantee that consecutive calls will
/// return consistent results. For example, it is possible consecutive calls to
/// 'length' will return different results.
class PageObjectIterable<E> {
  PageElementIterable _elementIterable;
  PageObjectConstructor<E> _pageObjectConstructor;

  PageObjectIterable(this._elementIterable, this._pageObjectConstructor);

  /// Gets the current first element from the [PageElementIterable].
  Future<E> get first async =>
      _pageObjectConstructor(await _elementIterable.first);

  /// Creates a [PageObjectIterator] based on the underlying
  /// [PageElementIterable].
  Future<Iterator<E>> get iterator async => PageObjectIterator<E>(
      await _elementIterable.iterator, _pageObjectConstructor);

  /// Gets the current length of the underlying [PageElementIterable].
  Future<int> get length => _elementIterable.length;

  @override
  String toString() => _elementIterable.toString();
}

/// Iterator for page objects.
///
/// Essentially wraps an iterator of [PageLoaderElement]s.
class PageObjectIterator<E> extends Iterator<E> {
  PageObjectConstructor<E> _pageObjectConstructor;

  Iterator<PageLoaderElement> _iterator;

  PageObjectIterator(this._iterator, this._pageObjectConstructor);

  @override
  bool moveNext() => _iterator.moveNext();

  @override
  E get current => this._pageObjectConstructor(_iterator.current);
}

/// Interface for iterables of [PageLoaderElement]s.
///
/// Every return here is expected to reflect the current state of the DOM.
abstract class PageElementIterable {
  /// Gets the first element in the iterable.
  Future<PageLoaderElement> get first;

  /// Creates a [PageObjectIterator].
  Future<Iterator<PageLoaderElement>> get iterator;

  /// Gets the current number of the [PageLoaderElement]s.
  Future<int> get length;
}
