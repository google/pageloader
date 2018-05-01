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

import 'package:pageloader3/debug.dart';
import 'package:pageloader3/pageloader.dart';
import 'package:pageloader3/src/debug/performance/profiler_listener.dart';
import 'package:pageloader3/src/debug/performance/timer_duration.dart';
import 'package:test/test.dart';

import 'shared_page_objects.dart';

typedef PageLoaderElement GetNewContext();

void runTests(GetNewContext contextGenerator) {
  PageLoaderElement root;

  group('debug', () {
    setUp(() async {
      root = contextGenerator();
    });

    test('trace listener', () async {
      var printedLines = <String>[];
      root.addListeners(
          [new TraceListener(printLine: (String s) => printedLines.add(s))]);

      final page = new PageForSimpleTest.create(root);
      expect(page.table.table.exists, true); // Do something.
      printedLines = printedLines.map((s) => s.trim()).toList(); // Drop the whitespace.
      expect(
          printedLines.toString(),
          stringContainsInOrder(
              ['-- PageForSimpleTest.table', '-- Table.table']));
    });

    test('profiler listener', () async {
      final timerFactory = new CollectingTimerFactory();
      root.addListeners([new ProfilerListener(timerFactory)]);

      final page = new PageForSimpleTest.create(root);

      await page.table.table.click();
      await page.table.doSlowAction(); // Do something.

      final json = timerFactory.serialize().toJson();

      // Cannot assert exactly what is on the exported JSON, since it may
      // differ between runs. So at least match that there are beginning and
      // end events.
      expect(
          json,
          stringContainsInOrder([
            'traceEvents',
            '"ph":"B"',
            '"name":"PageForSimpleTest',
            '"ph":"E"',
            '"name":"PageForSimpleTest',
          ]));
    });
  });
}
