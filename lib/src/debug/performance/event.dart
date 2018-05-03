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

import 'dart:convert';

import 'json_constants.dart' as constants;

abstract class JsonSerializable {
  String toJson();
}

abstract class Event implements JsonSerializable {
  Map<String, Object> toMap();
}

/// Trace Event, a subset of the implementation of Trace Event Format.
///
/// https://docs.google.com/document/d/1CvAClvFfyA5R-PhYUmn5OOQtYMH4h6I0nSsKchNAySU
class TraceEvent implements JsonSerializable {
  List<Event> traceEvents;

  @override
  String toJson() {
    final events = {
      constants.traceEvents: traceEvents.map((e) => e.toMap()).toList()
    };
    return json.encode(events);
  }
}

enum DurationEventPhase {
  begin,
  end,
}

/// An event that has start and end times.
class DurationEvent implements Event {
  /// The phase of this event, either Begin or End.
  DurationEventPhase phase;

  /// The name of the Event.
  String name;

  /// Process ID.
  String pid;

  /// Thread ID.
  String tid;

  /// Any arguments to this event.
  List<String> args;

  /// The tracing clock timestamp.
  DateTime ts;

  DurationEvent();

  @override
  Map<String, Object> toMap() {
    final map = <String, Object>{
      constants.phase: phase == DurationEventPhase.begin
          ? constants.phaseBegin
          : constants.phaseEnd
    };

    if (name != null) {
      map[constants.name] = name;
    }
    if (pid != null) {
      map[constants.pid] = pid;
    }
    if (tid != null) {
      map[constants.tid] = tid;
    }
    if (args != null) {
      map[constants.args] = args;
    }
    if (ts != null) {
      map[constants.tracingTimestamp] = ts.microsecondsSinceEpoch;
    }
    return map;
  }

  @override
  String toJson() => json.encode(toMap());
}
