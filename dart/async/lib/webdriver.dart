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

/// PageLoader WebDriver provides the necessary bindings to support using
/// PageLoader in WebDriver-based tests.
library pageloader.webdriver;

import 'dart:async';
import 'dart:math';

import 'package:webdriver/async_core.dart' as async_wd;
import 'package:webdriver/sync_core.dart' as sync_wd;

import 'src/core.dart';
import 'src/interfaces.dart';

export 'src/interfaces.dart';

part 'webdriver_async.dart';
part 'webdriver_sync.dart';

class WebDriverPageLoader extends BasePageLoader {
  async_wd.WebDriver get driver => asyncDriver ?? syncDriver.asyncDriver;
  final async_wd.WebDriver asyncDriver;
  final sync_wd.WebDriver syncDriver;

  WebDriverPageLoaderElement _globalContext;
  var _mouse;

  @override
  PageLoaderMouse get mouse => _mouse;

  WebDriverPageLoader(async_wd.SearchContext globalContext,
      {bool useShadowDom: true,
      SyncedExecutionFn executeSyncedFn: noOpExecuteSyncedFn})
      : this.asyncDriver = globalContext.driver,
        this.syncDriver = null,
        super(useShadowDom: useShadowDom, executeSyncedFn: executeSyncedFn) {
    this._mouse = new _WebDriverMouseAsync(this);
    this._globalContext =
        new _BaseWebDriverPageLoaderElementAsync(globalContext, this);
  }

  WebDriverPageLoader.sync(sync_wd.SearchContext globalContext,
      {bool useShadowDom: true,
      SyncedExecutionFn executeSyncedFn: noOpExecuteSyncedFn})
      : this.syncDriver = globalContext.driver,
        this.asyncDriver = null,
        super(useShadowDom: useShadowDom, executeSyncedFn: executeSyncedFn) {
    this._mouse = new _WebDriverMouseAsync(this); // Not synchronous, but OK.
    this._globalContext =
        new _BaseWebDriverPageLoaderElementSync(globalContext, this);
  }

  @override
  WebDriverPageLoaderElement get globalContext => _globalContext;

  @override
  Future<T> getInstance<T>(Type type, [dynamic context]) async =>
      getInstanceInternal(type, _getContext(context));

  @override
  T getInstanceSync<T>(Type type, [dynamic context]) =>
      getInstanceInternalSync(type, _getContext(context));

  WebDriverPageLoaderElement _getContext(dynamic context) {
    if (context != null) {
      if (context is async_wd.SearchContext) {
        context = new _BaseWebDriverPageLoaderElementAsync(context, this);
      } else if (context is! _BaseWebDriverPageLoaderElementAsync) {
        throw new PageLoaderException('Invalid context: $context');
      }
    }
    return context;
  }
}

/// Base class for WebDriver [PageLoaderElements]s. Defines a context.
abstract class WebDriverPageLoaderElement implements PageLoaderElement {
  async_wd.SearchContext get context;

  @override
  WebDriverPageLoader get loader;
}

class _EmptyAttributes implements PageLoaderAttributes {
  const _EmptyAttributes();

  @override
  Future<String> operator [](String name) async => null;

  @override
  String getAttribute(String name) => null;
}
