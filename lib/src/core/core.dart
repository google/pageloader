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

import 'package:pageloader/pageloader.dart';

/// Functionality shared in multiple PageLoader subclasses.

/// Applies a list of filters and checks to a set of elements.
///
/// Returns filtered elements and throws exceptions if any checks fail.
List<PageLoaderElement> applyFiltersAndChecks(List<PageLoaderElement> elements,
    List<Filter> filters, List<Checker> checkers) {
  // This doesn't work functionally due to asyncs.
  final filteredElements = <PageLoaderElement>[];
  for (final e in elements) {
    var keep = true;
    for (final filter in filters) {
      keep = keep && filter.keep(e);
    }
    if (keep) {
      filteredElements.add(e);
    }
  }

  for (final element in filteredElements) {
    for (final check in checkers) {
      if (!check.check(element)) {
        throw PageLoaderException.withContext(
            'Failed check: ${check.toString()}', element);
      }
    }
  }

  return filteredElements;
}

/// Method to retry.
typedef T MethodToRetry<T>();

/// Method for clearing the cache.
typedef void ClearCacheMethod();

/// Returns true if the exception indicates a stale element was found.
typedef bool IsStaleException(Object exception);

/// Retries [method] if an exception is thrown and [isStaleException] is true
/// for said exception.
T staleElementWrapper<T>(MethodToRetry<T> method, ClearCacheMethod clear,
    IsStaleException isStaleException) {
  try {
    return method();
  } catch (e) {
    if (isStaleException(e)) {
      clear();
      return method();
    }

    rethrow;
  }
}
