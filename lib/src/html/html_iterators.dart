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

import 'dart:async';
import 'dart:html';

import 'package:pageloader/pageloader.dart';

import 'html_page_loader_element.dart';

/// Iterator for [HtmlPageLoaderElement]s.
class HtmlPageElementIterator extends Iterator<HtmlPageLoaderElement> {
  final SyncFn _syncFn;

  final List<Element> _elements;
  int _current = -1;

  HtmlPageElementIterator(this._syncFn, this._elements);

  @override
  bool moveNext() => ++_current < _elements.length;

  @override
  HtmlPageLoaderElement get current {
    if (_current == -1) {
      return null;
    }
    return HtmlPageLoaderElement.createFromElement(_elements[_current],
        externalSyncFn: _syncFn);
  }
}

/// Iterable for [HtmlPageElementIterable]s.
///
/// Note every call to the iterables has the potential to refresh the set of
/// elements, but the returned [HtmlPageElementIterator] is based on the
/// set of elements found when the iterator was created.
class HtmlPageElementIterable extends PageElementIterable {
  final HtmlPageLoaderElement _drivingElement;

  HtmlPageElementIterable(this._drivingElement);

  @override
  Future<PageLoaderElement> get first async =>
      HtmlPageLoaderElement.createFromElement(_drivingElement.elements[0],
          externalSyncFn: _drivingElement.syncFn);

  @override
  Future<Iterator<PageLoaderElement>> get iterator async {
    return HtmlPageElementIterator(
        _drivingElement.syncFn, _drivingElement.elements);
  }

  @override
  Future<int> get length async {
    return _drivingElement.elements.length;
  }
}
