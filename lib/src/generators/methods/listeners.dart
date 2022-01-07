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

/// Generation support for listeners.
library pageloader.listeners;

import 'core.dart';

final String listeners = '__listeners__';

String generateStartMethodListeners(String pageObjectName, String methodName) =>
    _generateListeners(pageObjectName, methodName, 'startPageObjectMethod');

String generateEndMethodListeners(String pageObjectName, String methodName) =>
    _generateListeners(pageObjectName, methodName, 'endPageObjectMethod');

String _generateListeners(
        String pageObjectName, String methodName, String listenerMethod) =>
    '''
  for (final __listener in $root.listeners) {
    __listener.$listenerMethod('$pageObjectName', '$methodName');
  }
  ''';
