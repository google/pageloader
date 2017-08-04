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

@TestOn('browser')
library pageloader.test.html_no_shadow_dom;

import 'dart:async';
import 'dart:html' show Element;

import 'package:pageloader/html.dart';

import 'package:test/test.dart';

import 'data/html_setup.dart' as html_setup;
import 'setup/html_test_setup.dart' show runTests, syncFn;
import 'src/shared.dart' as shared;


void main() {
  runTests(pageloaderFactory);
}

PageLoader pageloaderFactory() {
  var div = html_setup.setUp();
  return new HtmlPageLoader(div, executeSyncedFn: syncFn);
}

class HtmlLoader extends shared.Loader {
  final HtmlPageLoader loader;
  HtmlLoader(this.loader);

  Future<T> getInstance<T>(Type type, [dynamic context])  =>
      loader.getInstance(type);
}

HtmlLoader pageLoaderFactory()  =>
  new HtmlLoader(new HtmlPageLoader(html_setup.setUp(), executeSyncedFn: syncFn));


