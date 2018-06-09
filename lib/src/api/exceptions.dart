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

library pageloader.api.exceptions;

import 'page_loader_element_interface.dart';

class FoundZeroElementsInSingleException extends PageLoaderException {
  const FoundZeroElementsInSingleException(PageLoaderElement element)
      : super.withContext('Found 0 elements in _single', element);
}

class FoundMultipleElementsInSingleException extends PageLoaderException {
  const FoundMultipleElementsInSingleException(PageLoaderElement element)
      : super.withContext('Found multiple elements in _single', element);
}

class PageLoaderException {
  final String message;
  final PageLoaderElement element;

  const PageLoaderException(this.message) : element = null;

  const PageLoaderException.withContext(this.message, this.element);

  @override
  String toString() => 'PageLoaderException: $message'
      ' \n\n  ---Context: \n\n${element?.toString()}';
}
