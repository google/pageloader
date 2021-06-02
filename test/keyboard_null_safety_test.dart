// Copyright 2018 Google Inc. All rights reserved.
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
import 'package:test/test.dart';

void main() {
  late PageLoaderKeyboard kb;

  setUp(() {
    kb = PageLoaderKeyboard();
  });

  group('default typeKey', () {
    setUp(() {
      kb.typeKey('a');
    });

    test('contains all three events, in order', () {
      final events = kb.events;
      expect(events, hasLength(3));
      expect(events[0].type, equals(KeyboardEventType.keyDown));
      expect(events[1].type, equals(KeyboardEventType.keyPress));
      expect(events[2].type, equals(KeyboardEventType.keyUp));
    });

    test('contains proper key value in all three', () {
      final eventsWithA = kb.events.where((e) => e.key == 'a');
      expect(eventsWithA, hasLength(3));
    });

    test('mods are initially false', () {
      final eventsWithFalseMods = kb.events
          .where((e) => !e.altMod && !e.ctrlMod && !e.metaMod && !e.shiftMod);
      expect(eventsWithFalseMods, hasLength(3));
    });
  });

  group('default typeSpecialKey', () {
    setUp(() {
      kb.typeSpecialKey(PageLoaderSpecialKey.f1);
    });

    test('contains all two events, in order', () {
      final events = kb.events;
      expect(events, hasLength(2));
      expect(events[0].type, equals(KeyboardEventType.keyDown));
      expect(events[1].type, equals(KeyboardEventType.keyUp));
    });

    test('contains proper key value in all two', () {
      final eventsWithA =
          kb.events.where((e) => e.specialKey == PageLoaderSpecialKey.f1);
      expect(eventsWithA, hasLength(2));
    });

    test('mods are initially false', () {
      final eventsWithFalseMods = kb.events
          .where((e) => !e.altMod && !e.ctrlMod && !e.metaMod && !e.shiftMod);
      expect(eventsWithFalseMods, hasLength(2));
    });
  });

  test('enter sends keypress', () {
    kb.typeSpecialKey(PageLoaderSpecialKey.enter);
    final events = kb.events;
    expect(events, hasLength(3));
    expect(events[1].type, equals(KeyboardEventType.keyPress));
  });

  group('default typeSpecialKey releases mod on', () {
    test('alt', () {
      kb
        ..typeSpecialKey(PageLoaderSpecialKey.alt)
        ..typeKey('a');
      final events = kb.events;
      expect(events, hasLength(5));
      expect(events[0].altMod, isTrue);
      expect(events[1].altMod, isFalse);
      expect(events.sublist(2).where((e) => !e.isSpecial && !e.altMod),
          hasLength(3));
    });

    test('control', () {
      kb
        ..typeSpecialKey(PageLoaderSpecialKey.control)
        ..typeKey('a');
      final events = kb.events;
      expect(events, hasLength(5));
      expect(events[0].ctrlMod, isTrue);
      expect(events[1].ctrlMod, isFalse);
      expect(events.sublist(2).where((e) => !e.isSpecial && !e.ctrlMod),
          hasLength(3));
    });

    test('meta', () {
      kb
        ..typeSpecialKey(PageLoaderSpecialKey.meta)
        ..typeKey('a');
      final events = kb.events;
      expect(events, hasLength(5));
      expect(events[0].metaMod, isTrue);
      expect(events[1].metaMod, isFalse);
      expect(events.sublist(2).where((e) => !e.isSpecial && !e.metaMod),
          hasLength(3));
    });

    test('shift', () {
      kb
        ..typeSpecialKey(PageLoaderSpecialKey.shift)
        ..typeKey('a');
      final events = kb.events;
      expect(events, hasLength(5));
      expect(events[0].shiftMod, isTrue);
      expect(events[1].shiftMod, isFalse);
      expect(events.sublist(2).where((e) => !e.isSpecial && !e.shiftMod),
          hasLength(3));
    });
  });

  group('no keyUp typeSpecialKey does not release mod', () {
    test('alt', () {
      kb
        ..typeSpecialKey(PageLoaderSpecialKey.alt, keyUp: false)
        ..typeKey('a');
      final events = kb.events;
      expect(events, hasLength(4));
      expect(events[0].altMod, isTrue);
      expect(events.sublist(2).where((e) => !e.isSpecial && e.altMod),
          hasLength(2));
    });

    test('control', () {
      kb
        ..typeSpecialKey(PageLoaderSpecialKey.control, keyUp: false)
        ..typeKey('a');
      final events = kb.events;
      expect(events, hasLength(4));
      expect(events[0].ctrlMod, isTrue);
      expect(events.sublist(2).where((e) => !e.isSpecial && e.ctrlMod),
          hasLength(2));
    });

    test('meta', () {
      kb
        ..typeSpecialKey(PageLoaderSpecialKey.meta, keyUp: false)
        ..typeKey('a');
      final events = kb.events;
      expect(events, hasLength(4));
      expect(events[0].metaMod, isTrue);
      expect(events.sublist(2).where((e) => !e.isSpecial && e.metaMod),
          hasLength(2));
    });

    test('shift', () {
      kb
        ..typeSpecialKey(PageLoaderSpecialKey.shift, keyUp: false)
        ..typeKey('A'); // Has to be capital since shift is turned on
      final events = kb.events;
      expect(events, hasLength(4));
      expect(events[0].shiftMod, isTrue);
      expect(events.sublist(2).where((e) => !e.isSpecial && e.shiftMod),
          hasLength(2));
    });
  });

  group('error is thrown when', () {
    test('non-single length character passed on typeKey', () {
      const error = "'typeKey' requires a key of exactly length 1";
      try {
        kb.typeKey('');
        fail('Expected to throw error on zero length key in typeKey');
      } catch (e) {
        expect(e.toString(), contains(error));
      }
      try {
        kb.typeKey('foo');
        fail('Expected to throw error on three length key in typeKey');
      } catch (e) {
        expect(e.toString(), contains(error));
      }
    });

    test('non-shift character typed while shift key is down', () {
      kb.typeSpecialKey(PageLoaderSpecialKey.shift, keyUp: false);
      try {
        kb.typeKey('a');
        fail('Expected to throw error when non-shift key is pressed '
            'before shift is released');
      } catch (e) {
        expect(
            e.toString(),
            contains(
                "Cannot type a non-shift value 'a' while modded with shift. "
                "Execute at least 'typeSpecialKey(PageLoaderSpecialKey.shift)' "
                "with 'keyUp' enabled before typing in 'a'."));
      }
    });

    test('shift character typed before shift keydown', () {
      try {
        kb.typeKey('!');
        fail('Expected to throw error on shifted key before shift is pressed');
      } catch (e) {
        expect(
            e.toString(),
            contains("Cannot type a shift value '!' before modded with shift. "
                "Execute at least 'typeSpecialKey(PageLoaderSpecialKey.shift)' "
                "with 'keyDown' enabled before typing in '!'."));
      }
    });
  });

  test('all mods work', () {
    // key downs
    kb
      ..typeSpecialKey(PageLoaderSpecialKey.alt, keyUp: false)
      ..typeSpecialKey(PageLoaderSpecialKey.control, keyUp: false)
      ..typeSpecialKey(PageLoaderSpecialKey.meta, keyUp: false)
      ..typeSpecialKey(PageLoaderSpecialKey.shift, keyUp: false);

    // key ups
    kb
      ..typeSpecialKey(PageLoaderSpecialKey.alt, keyDown: false)
      ..typeSpecialKey(PageLoaderSpecialKey.control, keyDown: false)
      ..typeSpecialKey(PageLoaderSpecialKey.meta, keyDown: false)
      ..typeSpecialKey(PageLoaderSpecialKey.shift, keyDown: false);

    final events = kb.events;
    expect(events, hasLength(8));

    // alt mod
    expect(events.map((e) => e.altMod),
        equals([true, true, true, true, false, false, false, false]));

    // ctrl mod
    expect(events.map((e) => e.ctrlMod),
        equals([false, true, true, true, true, false, false, false]));

    // meta mod
    expect(events.map((e) => e.metaMod),
        equals([false, false, true, true, true, true, false, false]));

    // shift mod
    expect(events.map((e) => e.shiftMod),
        equals([false, false, false, true, true, true, true, false]));
  });
}
