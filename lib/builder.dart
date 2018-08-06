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

/// Configuration for using `package:build`-compatible build systems.
///
/// See:
/// * [build_runner](https://pub.dartlang.org/packages/build_runner)
///
/// This library is **not** intended to be imported by typical end-users unless
/// you are creating a custom compilation pipeline. See documentation for
/// details, and `build.yaml` for how these builders are configured by default.
library pageloader.builder;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/generators/pageobject_generator.dart';

/// Supports `package:build_runner` creation and configuration of `pageloader`.
///
/// Not meant to be invoked by hand-authored code.
Builder pageloaderBuilder(BuilderOptions options) {
  // Paranoid copy of options.config - don't assume it's mutable or needed
  // elsewhere.
  final optionsMap = Map<String, dynamic>.from(options.config);

  final builder =
      SharedPartBuilder([const PageObjectGenerator()], 'pageloader');

  if (optionsMap.isNotEmpty) {
    if (log == null) {
      throw StateError('Upgrade `build_runner` to at least 0.8.2.');
    } else {
      log.warning('These options were ignored: `$optionsMap`.');
    }
  }
  return builder;
}
