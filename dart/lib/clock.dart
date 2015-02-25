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

library pageloader.clock;

/// Interface used to abstract away waiting mechanisms.
abstract class Clock {
  void sleep(Duration interval);
  DateTime get now;
}

/// Fake Clock implementation that starts at a fixed time, and increments the
/// time when (and only when) [sleep] is called.
class FakeClock implements Clock {
  static final DateTime DEFAULT_START_TIME = new DateTime(2014);

  DateTime _now;

  FakeClock([DateTime start])
      : this._now = start == null ? DEFAULT_START_TIME : start;

  @override
  void sleep(Duration interval) {
    _now = _now.add(interval);
  }

  @override
  DateTime get now => _now;
}
