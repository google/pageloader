// Copyright 2014 Google Inc. All rights reserved.
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

library pageloader.test.html_test_setup;

import 'dart:async';

import 'package:test/test.dart';
import 'package:pageloader/html.dart';

import '../src/common.dart' as plt;
import '../src/html_pageloader.dart' as html_test;
import '../src/shared.dart' as shared;

void runTests(pageLoaderFactory) {
  setUp(() {
    shared.loaderUtil = pageLoaderFactory();
  });

  plt.runTests();
  html_test.runTests();
}

class HtmlLoader extends shared.Loader {
  final HtmlPageLoader loader;
  HtmlLoader(this.loader);

  Future<T> getInstance<T>(Type type, [dynamic context]) =>
      loader.getInstance(type);
}

Future syncFn(Future fn()) async {
  var value = await fn();
  await new Future.delayed(new Duration(milliseconds: 200));
  return value;
}
