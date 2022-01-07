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

/// Generation for @Pointer annotations.
library pageloader.pointer_finder_method;

import 'package:built_value/built_value.dart';
import 'package:quiver/core.dart';

import 'core.dart';
import 'core_method_information.dart';
import 'invalid_method_exception.dart';
import 'listeners.dart';
import 'null_safety.dart';

part 'pointer_finder_method.g.dart';

/// Returns a [PointerFinderMethod] if a valid @Pointer getter is present, and
/// [absent()] otherwise.
Optional<PointerFinderMethod> collectPointerFinderGetter(
    NullSafety nullSafety, CoreMethodInformationBase methodInfo) {
  if (!methodInfo.isPointer) {
    return Optional.absent();
  }

  if (!methodInfo.isAbstract || !methodInfo.isGetter) {
    throw InvalidMethodException(methodInfo.node,
        '@Pointer annotation must be used with abstract getter');
  }
  if (methodInfo.finder.isPresent) {
    throw InvalidMethodException(
        methodInfo.node, 'cannot use Finder with Pointer annotation');
  }
  if (methodInfo.filters.isNotEmpty) {
    throw InvalidMethodException(
        methodInfo.node, 'cannot use Filter with Pointer annotation');
  }
  if (methodInfo.checkers.isNotEmpty) {
    throw InvalidMethodException(
        methodInfo.node, 'cannot use Checker with Pointer annotation');
  }

  return Optional.of(PointerFinderMethod((b) => b
    ..nullSafety = nullSafety.toBuilder()
    ..name = methodInfo.name));
}

/// Generation for @Pointer getters.
abstract class PointerFinderMethod
    implements Built<PointerFinderMethod, PointerFinderMethodBuilder> {
  NullSafety get nullSafety;
  String get name;

  String generate(String pageObjectName) =>
      'PageLoaderPointer get $name { ' +
      generateStartMethodListeners(pageObjectName, name) +
      '$pointer ??= $root.utils.pointer;' +
      'final returnMe = $pointer${nullSafety.notNull};' +
      generateEndMethodListeners(pageObjectName, name) +
      'return returnMe; }';

  factory PointerFinderMethod([Function(PointerFinderMethodBuilder) updates]) =
      _$PointerFinderMethod;
  PointerFinderMethod._();
}
