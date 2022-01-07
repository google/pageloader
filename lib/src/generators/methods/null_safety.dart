// Copyright 2020 Google Inc. All rights reserved.
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

import 'package:built_value/built_value.dart';

part 'null_safety.g.dart';

/// A helper for generating both legacy and Null Safe code.
///
/// Note that we use this to also change the legacy code by adding Null Safety
/// hints (in form of comments) to guide the migration tool to better infer
/// nullability.
abstract class NullSafety implements Built<NullSafety, NullSafetyBuilder> {
  /// Returns `true` if we're generating Null Safe code.
  bool get enabled;

  String get orNull => enabled ? '?' : '/*?*/';

  String get notNull => enabled ? '!' : '/*!*/';

  String get isLate => enabled ? 'late ' : '/*late*/';

  factory NullSafety([void Function(NullSafetyBuilder) updates]) = _$NullSafety;
  NullSafety._();
}
