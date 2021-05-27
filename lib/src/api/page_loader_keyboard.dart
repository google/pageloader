// Copyright 2018 Google Inc. All rights reserved.
// Licensed under the Apache License, Version 2.0 (the "License"),
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

library pageloader.api.page_loader_keyboard;

/// Keyboard object used to group keyboard events that should be
/// executed consecutively.
///
/// Example: Ctrl + c
/// PageLoaderKeyboard()
///   ..typeSpecialKey(PageLoaderSpecialKey.control, keyUp: false)
///   ..typeKey('c')
///   ..typeSpecialKey(PageLoaderSpecialKey.control, keyDown: false);
class PageLoaderKeyboard {
  // All combinations of 'keydown', 'keypress', and 'keyup' events.
  final events = <_Key>[];

  // List of unique buttons being pressed without 'keyX' event combinations.
  // This is used in webdriver keyboard.
  final uniqueEvents = <_Key>[];

  var _altMod = false;
  var _ctrlMod = false;
  var _shiftMod = false;
  var _metaMod = false;

  static const _shiftValues = [
    '~',
    '!',
    '@',
    '#',
    r'$',
    '%',
    '^',
    '&',
    '*',
    '(',
    ')',
    '_',
    '+',
    '<',
    '>',
    '?',
    ':',
    '"',
    '{',
    '}',
    '|'
  ];

  static bool isShiftValue(String key) =>
      _shiftValues.contains(key) ||
      ('A'.codeUnitAt(0) <= key.codeUnitAt(0) &&
          key.codeUnitAt(0) <= 'Z'.codeUnitAt(0));

  void _addEvent(
      PageLoaderSpecialKey specialKey, String key, KeyboardEventType type) {
    events.add(
        _Key(specialKey, key, type, _altMod, _ctrlMod, _metaMod, _shiftMod));
  }

  void _addUniqueEvent(PageLoaderSpecialKey specialKey, String key) {
    // using keyPress as placeholder
    uniqueEvents.add(_Key(specialKey, key, KeyboardEventType.keyPress, _altMod,
        _ctrlMod, _metaMod, _shiftMod));
  }

  /// Adds to sequence: ('keydown', 'keypress', 'keyup') events on [key].
  ///
  /// [key] must be a single-length String of the character sent.
  ///
  /// [keyDown] and [keyUp] determines whether those events should be sent.
  /// 'keypress' is automatically sent if [keyDown] is true.
  ///
  /// Throws error if the [key] sent violates the state of whether shift
  /// is being held down or not. For example: if 'keydown' on shift is
  /// already in sequence without sending a 'keyup' and [key] of '1' is sent,
  /// throws an error. Error is also thrown in the opposite case.
  void typeKey(String key, {bool keyDown = true, bool keyUp = true}) {
    // Throw if not exactly of length 1.
    if (key.length != 1) {
      throw ArgumentError("'typeKey' requires a key of exactly length 1");
    }

    // Check for consistency of [key] and status of [_shiftMod].
    if (_shiftMod && !isShiftValue(key)) {
      throw ArgumentError(
          "Cannot type a non-shift value '$key' while modded with shift. "
          "Execute at least 'typeSpecialKey(PageLoaderSpecialKey.shift)' with "
          "'keyUp' enabled before typing in '$key'.");
    } else if (!_shiftMod && isShiftValue(key)) {
      throw ArgumentError(
          "Cannot type a shift value '$key' before modded with shift. "
          "Execute at least 'typeSpecialKey(PageLoaderSpecialKey.shift)' with "
          "'keyDown' enabled before typing in '$key'.");
    }

    if (keyDown) {
      _addEvent(null, key, KeyboardEventType.keyDown);
      _addEvent(null, key, KeyboardEventType.keyPress);
    }
    if (keyUp) {
      _addEvent(null, key, KeyboardEventType.keyUp);
    }
    _addUniqueEvent(null, key);
  }

  /// Adds to sequence: ('keydown', 'keyup') events on [key]. If the special
  /// key is enter, also adds 'keypress'.
  ///
  /// [keyDown] and [keyUp] determines whether those events should be sent.
  void typeSpecialKey(PageLoaderSpecialKey key,
      {bool keyDown = true, bool keyUp = true}) {
    final keyString = _specialKeyToKeyProperty[key];
    if (keyDown) {
      switch (key) {
        case PageLoaderSpecialKey.alt:
          _altMod = true;
          break;
        case PageLoaderSpecialKey.control:
          _ctrlMod = true;
          break;
        case PageLoaderSpecialKey.meta:
          _metaMod = true;
          break;
        case PageLoaderSpecialKey.shift:
          _shiftMod = true;
          break;
        default:
          break;
      }
      _addEvent(key, keyString, KeyboardEventType.keyDown);

      // 'enter' still sends a keypress.
      if (key == PageLoaderSpecialKey.enter) {
        _addEvent(key, keyString, KeyboardEventType.keyPress);
      }
    }
    if (keyUp) {
      switch (key) {
        case PageLoaderSpecialKey.alt:
          _altMod = false;
          break;
        case PageLoaderSpecialKey.control:
          _ctrlMod = false;
          break;
        case PageLoaderSpecialKey.meta:
          _metaMod = false;
          break;
        case PageLoaderSpecialKey.shift:
          _shiftMod = false;
          break;
        default:
          break;
      }
      _addEvent(key, keyString, KeyboardEventType.keyUp);
    }
    _addUniqueEvent(key, keyString);
  }
}

/// Wrapper for individual key event within [PageLoaderKeyboard].
class _Key {
  final PageLoaderSpecialKey specialKey;
  final String key;
  final KeyboardEventType type;

  final bool altMod;
  final bool ctrlMod;
  final bool shiftMod;
  final bool metaMod;

  _Key(this.specialKey, this.key, this.type, this.altMod, this.ctrlMod,
      this.metaMod, this.shiftMod);

  bool get isSpecial => specialKey != null;
}

/// Special key that may be sent on an element.
///
/// These are keys that do not have an explicit String representation
/// and do not send 'keypress' events.
enum PageLoaderSpecialKey {
  backSpace,
  tab,
  enter,
  shift,
  control,
  alt,
  pause,
  escape,
  pageUp,
  pageDown,
  end,
  home,
  left,
  up,
  right,
  down,
  insert,
  delete,
  f1,
  f2,
  f3,
  f4,
  f5,
  f6,
  f7,
  f8,
  f9,
  f10,
  f11,
  f12,
  meta,
}

// Mapping of special keys to its key string value.
// Based on: https://www.w3.org/TR/uievents-key/#key-string
const _specialKeyToKeyProperty = {
  PageLoaderSpecialKey.backSpace: 'Backspace',
  PageLoaderSpecialKey.tab: 'Tab',
  PageLoaderSpecialKey.enter: 'Enter',
  PageLoaderSpecialKey.shift: 'Shift',
  PageLoaderSpecialKey.control: 'Control',
  PageLoaderSpecialKey.alt: 'Alt',
  PageLoaderSpecialKey.pause: 'Pause',
  PageLoaderSpecialKey.escape: 'Escape',
  PageLoaderSpecialKey.pageUp: 'PageUp',
  PageLoaderSpecialKey.pageDown: 'PageDown',
  PageLoaderSpecialKey.end: 'End',
  PageLoaderSpecialKey.home: 'Home',
  PageLoaderSpecialKey.left: 'ArrowLeft',
  PageLoaderSpecialKey.up: 'ArrowUp',
  PageLoaderSpecialKey.right: 'ArrowRight',
  PageLoaderSpecialKey.down: 'ArrowDown',
  PageLoaderSpecialKey.insert: 'Insert',
  PageLoaderSpecialKey.delete: 'Delete',
  PageLoaderSpecialKey.f1: 'F1',
  PageLoaderSpecialKey.f2: 'F2',
  PageLoaderSpecialKey.f3: 'F3',
  PageLoaderSpecialKey.f4: 'F4',
  PageLoaderSpecialKey.f5: 'F5',
  PageLoaderSpecialKey.f6: 'F6',
  PageLoaderSpecialKey.f7: 'F7',
  PageLoaderSpecialKey.f8: 'F8',
  PageLoaderSpecialKey.f9: 'F9',
  PageLoaderSpecialKey.f10: 'F10',
  PageLoaderSpecialKey.f11: 'F11',
  PageLoaderSpecialKey.f12: 'F12',
  PageLoaderSpecialKey.meta: 'Meta',
};

/// Keyboard event type.
enum KeyboardEventType {
  keyDown,
  keyPress,
  keyUp,
}
