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

import 'event.dart';

final _defaultTimerConfiguration = CollectingTimerConfiguration();

typedef void Collector(List<DurationEvent> events);

/// A factory that creates [CollectingTimer], collects the events and serializes
/// them on demand.
class CollectingTimerFactory {
  final List<DurationEvent> _collectedEvents = [];

  CollectingTimer create(String timerName,
      {CollectingTimerConfiguration timerConfiguration}) {
    final configuration = CollectingTimerConfiguration.from(
        timerConfiguration ?? _defaultTimerConfiguration)
      ..timerName = timerName;
    return CollectingTimer(_collect, configuration);
  }

  TraceEvent serialize() => TraceEvent()..traceEvents = _collectedEvents;

  void _collect(List<DurationEvent> events) {
    _collectedEvents.addAll(events);
  }
}

/// The configuration of the timers.
///
/// By default uses the same pid and thread id since page objects execute in
/// the same execution context.
class CollectingTimerConfiguration {
  String timerName;
  String pid = 'base';
  String tid = 'base';

  CollectingTimerConfiguration();

  factory CollectingTimerConfiguration.from(
      CollectingTimerConfiguration other) {
    return CollectingTimerConfiguration()
      ..timerName = other.timerName
      ..pid = other.pid
      ..tid = other.tid;
  }
}

/// The timer per start/stop event collected.
///
/// On [stop], the event is collected back to the main factory.
class CollectingTimer {
  final CollectingTimerConfiguration configuration;
  final Stopwatch _stopwatch = Stopwatch();
  final Collector _collector;
  bool _isRunning = false;
  DateTime _startDuration;

  CollectingTimer(this._collector, this.configuration);

  void start() {
    assert(!_isRunning);
    _isRunning = true;
    _startDuration = DateTime.now();
    _stopwatch.reset();
    _stopwatch.start();
  }

  void stop() {
    assert(_isRunning);
    _isRunning = false;
    _stopwatch.stop();

    final startEvent = DurationEvent()
      ..name = configuration.timerName
      ..pid = configuration.pid
      ..tid = configuration.tid
      ..phase = DurationEventPhase.begin
      ..ts = _startDuration;

    final endEvent = DurationEvent()
      ..name = configuration.timerName
      ..pid = configuration.pid
      ..tid = configuration.tid
      ..phase = DurationEventPhase.end
      ..ts = _startDuration
          .add(Duration(microseconds: _stopwatch.elapsedMicroseconds));

    _collector([startEvent, endEvent]);
  }
}
