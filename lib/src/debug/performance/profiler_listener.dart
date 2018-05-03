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

import 'timer_duration.dart';

/// The listener that starts running timers on start and end of each pageobject
/// invocation.
class ProfilerListener implements PageLoaderListener {
  final CollectingTimerFactory _timerFactory;
  final Map<String, List<CollectingTimer>> _runningTimers = {};

  ProfilerListener(this._timerFactory);

  @override
  void startPageObjectMethod(String pageObjectName, String methodName) {
    final timerName = '$pageObjectName.$methodName';
    final timer = _timerFactory.create(timerName);
    (_runningTimers[timerName] ??= <CollectingTimer>[]).add(timer);
    timer.start();
  }

  @override
  void endPageObjectMethod(String pageObjectName, String methodName) {
    final timerName = '$pageObjectName.$methodName';
    final timer = _runningTimers[timerName].removeLast();
    timer.stop();
  }
}
