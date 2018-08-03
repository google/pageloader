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

import 'dart:async';
import 'dart:html';
import 'dart:math';

import 'package:pageloader/pageloader.dart';

import 'html_page_loader_element.dart';

HtmlMouse _globalMouse;
SyncFn _cachedSyncFn;

/// Returns the globally used [HtmlMouse] in Html based tests.
HtmlMouse globalMouse(SyncFn syncFn) {
  assert(syncFn != null);
  // [SyncFn] may change based on when this function is called.
  // If it does change, we need to create a new [HtmlMouse] since this
  // indicates the scope of the [HtmlMouse] is outdated.
  if (_cachedSyncFn == null || _cachedSyncFn != syncFn) {
    _cachedSyncFn = syncFn;
    _globalMouse = HtmlMouse(_cachedSyncFn);
  }
  return _globalMouse;
}

/// Support for mouse in in-browser context by dispatching [MouseEvent]s.
class HtmlMouse implements PageLoaderMouse {
  // Last known coordination and the [TrackedElement] at that point.
  var _cachedPoint = Point<int>(0, 0);
  TrackedElement _cachedElement;
  SyncFn syncFn;

  // Elements that are currently being tracked. This is reset whenever [moveTo]
  // is executed.
  var _trackedElements = <TrackedElement>[];
  var _elementToTrackedElement = <Element, TrackedElement>{};

  HtmlMouse(this.syncFn);

  @override
  Future down(MouseButton button, {PageLoaderElement eventTarget}) =>
      syncFn(() async {
        if (eventTarget != null) {
          await moveTo(eventTarget, null, null);
        }
        return _dispatchEvent('mousedown', eventTarget, button);
      });

  @override
  Future moveTo(HtmlPageLoaderElement element, int xOffset, int yOffset,
          {List<PageLoaderElement> dispatchTo = const <PageLoaderElement>[],
          int stepPixels,
          Duration duration = Duration.zero}) =>
      syncFn(() => _moveTo(element, xOffset, yOffset,
          dispatchTo: dispatchTo, stepPixels: stepPixels, duration: duration));

  @override
  Future up(MouseButton button, {PageLoaderElement eventTarget}) =>
      syncFn(() async {
        if (eventTarget != null) {
          await moveTo(eventTarget, null, null);
        }
        return _dispatchEvent('mouseup', eventTarget, button);
      });

  Future _moveTo(HtmlPageLoaderElement element, int xOffset, int yOffset,
      {List<PageLoaderElement> dispatchTo = const <PageLoaderElement>[],
      int stepPixels,
      Duration duration = Duration.zero}) async {
    if (stepPixels != null) {
      assert(stepPixels > 0);
    }

    // Client start point and end point.
    final startPoint = _cachedPoint;
    final rect = element.getBoundingClientRect();
    final center = _centerOfRect(rect);

    xOffset ??= center.x;
    yOffset ??= center.y;

    final endPoint =
        Point<int>((rect.left + xOffset).ceil(), (rect.top + yOffset).ceil());

    // Calculate steps needed for mouse move event.
    final distance = startPoint.distanceTo(endPoint).toInt();
    final steps = stepPixels == null ? 1 : max(distance ~/ stepPixels, 1);

    // Reset and re-calculate the [Element]s that need to be tracked.
    // Includes:
    //   [_cachedElement]
    //   [dispatchTo] as [TrackedElement]s
    //   All [Elements] as [TrackedElement] at the end point
    _trackedElements = <TrackedElement>[];
    _elementToTrackedElement = <Element, TrackedElement>{};
    if (_cachedElement != null) {
      _trackedElements.add(_cachedElement);
      _elementToTrackedElement[_cachedElement.element] = _cachedElement;
    }
    for (final dispatchTarget in dispatchTo) {
      _track((dispatchTarget as HtmlPageLoaderElement).context as Element,
          includeChildren: true);
    }
    final elementAtEnd = _track(
        document.elementFromPoint(_pageX(endPoint.x), _pageY(endPoint.y)) ??
            element.context as Element);

    // Send mouse events from start to end over [steps].
    for (int step = 0; step < steps; step++) {
      final lastStep = step == (steps - 1);
      final stepRatio = step / steps;

      final nextPoint = lastStep
          ? endPoint
          : _calculateNextPoint(stepRatio, startPoint, endPoint);

      await _sendMouseEvents(nextPoint, isLastStep: lastStep);
      if (duration != Duration.zero) {
        await _sleep(duration ~/ steps);
      }
    }

    // Finally, set the new [_cachedPoint] and [_cachedElement].
    _cachedPoint = endPoint;
    _cachedElement = elementAtEnd;
  }

  Point<int> _centerOfRect(Rectangle rect) {
    final x = (rect.width * 0.5).ceil();
    final y = (rect.height * 0.5).ceil();
    return Point(x, y);
  }

  /// Calculate the next point of the current step based on [stepRatio].
  Point<int> _calculateNextPoint(
      double stepRatio, Point<int> startPoint, Point<int> endPoint) {
    // To ensure correct casting, calculate manually.
    final x =
        (startPoint.x + (stepRatio * (endPoint.x - startPoint.x))).toInt();
    final y =
        (startPoint.y + (stepRatio * (endPoint.y - startPoint.y))).toInt();
    return Point<int>(x, y);
  }

  // Gets the current, top-most [Element] under mouse. If no element can be
  // found, returns the document's body [Element].
  Element get _currentElement =>
      document.elementFromPoint(
          _pageX(_cachedPoint.x), _pageY(_cachedPoint.y)) ??
      document.body;

  Future _dispatchEvent(String type, HtmlPageLoaderElement eventTarget,
      [MouseButton button = MouseButton.primary]) async {
    final event = MouseEvent(type,
        button: button.value,
        clientX: _cachedPoint.x,
        clientY: _cachedPoint.y,
        screenX: _screenX(_cachedPoint.x),
        screenY: _screenY(_cachedPoint.y));

    if (eventTarget != null) {
      await _microtask(() => eventTarget.dispatchEvent(event));
    } else {
      await _microtask(() => _currentElement.dispatchEvent(event));
    }
  }

  /// Sends the following events, as needed, to elements in
  /// [_trackedElements]:
  ///   mouseleave
  ///   mouseout
  ///   mouseenter
  ///   mousemove
  ///   mouseover
  Future<void> _sendMouseEvents(Point<int> nextPos, {bool isLastStep}) async {
    // Send 'mouseleave' and 'mouseout' events before 'mouseenter'.
    final elementsThatLeft = await _dispatchMouseLeaves(nextPos);
    await _dispatchMouseOuts(nextPos);

    // Send 'mouseenter' and 'mousemove'.
    final elementsThatEntered = await _dispatchMouseEnters(nextPos);
    await _dispatchMouseMoves(nextPos);

    // Send 'mouseover'.
    await _dispatchMouseOvers(nextPos);

    // Update the mouse locations on those that had 'mouseleave' or 'mouseleave'
    // sent to them.
    for (final element in elementsThatLeft) {
      element.mouseIsInside = false;
    }
    for (final element in elementsThatEntered) {
      element.mouseIsInside = true;
    }

    // If this is the last step, make sure new 'mousemove' is sent to the final
    // elements with the mouse over it.
    if (isLastStep) {
      await _dispatchMouseMoves(nextPos);
    }
  }

  /// Sends 'mouseenter' to elements in [_trackedElements] if needed.
  ///
  /// Returns a list of [TrackedElement] that had 'mouseenter' sent to them.
  Future<List<TrackedElement>> _dispatchMouseEnters(Point nextPos) async {
    final elementsThatEntered = <TrackedElement>[];
    for (final element in _trackedElements) {
      if (element.containsPoint(nextPos) && !element.mouseIsInside) {
        await element.dispatchMouseEnter(nextPos.x, nextPos.y);
        elementsThatEntered.add(element);
      }
    }
    return elementsThatEntered;
  }

  /// Sends 'mouseleave' to elements in [_trackedElements] if needed.
  ///
  /// Returns a list of [TrackedElement] that had 'mouseleave' sent to them.
  Future<List<TrackedElement>> _dispatchMouseLeaves(Point nextPos) async {
    final elementsThatLeft = <TrackedElement>[];
    for (final element in _trackedElements) {
      if (!element.containsPoint(nextPos) && element.mouseIsInside) {
        await element.dispatchMouseLeave(nextPos.x, nextPos.y);
        elementsThatLeft.add(element);
      }
    }
    return elementsThatLeft;
  }

  /// Sends 'mousemove' to elements in [_trackedElements] if needed.
  Future<void> _dispatchMouseMoves(Point nextPos) async {
    for (final element in _trackedElements) {
      if (element.mouseIsInside) {
        await element.dispatchMouseMove(nextPos.x, nextPos.y);
      }
    }
  }

  /// Sends 'mouseout' to elements in [_trackedElements] if needed.
  Future<void> _dispatchMouseOuts(Point nextPos) => _dispatchBubblingEvents(
      (TrackedElement element) => element._isLeaving(nextPos),
      (TrackedElement element) async =>
          await element.dispatchMouseOut(nextPos.x, nextPos.y));

  /// Sends 'mouseover' to elements in [_trackedElements] if needed.
  Future<void> _dispatchMouseOvers(Point nextPos) => _dispatchBubblingEvents(
      (TrackedElement element) => element._isEntering(nextPos),
      (TrackedElement element) async =>
          await element.dispatchMouseOver(nextPos.x, nextPos.y));

  /// Traverses each tree in the forest [_trackedElements] and calls
  /// [dispatcher] on the lowest element in the tree satisfying [test], exactly
  /// once.
  Future<void> _dispatchBubblingEvents(bool Function(TrackedElement) test,
      Future<void> Function(TrackedElement) dispatcher) async {
    final _checked = Set<TrackedElement>();
    Future<void> _dispatch(TrackedElement target) async {
      if (_checked.contains(target)) return;
      _checked.add(target);

      if (test(target)) {
        for (final child in target.element.children) {
          // It is possible that [child] was created after target was tracked.
          final trackedChild = _track(child);
          if (test(trackedChild)) {
            await _dispatch(trackedChild);
            return;
          }
        }
        await dispatcher(target);
      }
    }

    // We only need to iterate over the roots of the forest
    // [_trackedElements], and while elements may be added to by
    // [_dispatch], none of the new elements can be roots.
    final potentialRoots = List.from(_trackedElements);
    for (final element in potentialRoots) {
      await _dispatch(element);
    }
  }

  Future _sleep(Duration duration) => Future.delayed(duration);

  /// Given [element], either returns an already existing [TrackedElement] for
  /// it or creates a new [TrackedElement].
  TrackedElement _track(Element element, {bool includeChildren = false}) {
    final existing = _elementToTrackedElement[element];
    if (existing != null) return existing;
    final newTrackedElement = TrackedElement(element);
    _trackedElements.add(newTrackedElement);
    _elementToTrackedElement[element] = newTrackedElement;
    if (includeChildren) {
      for (final child in element.children) {
        _track(child);
      }
    }
    return newTrackedElement;
  }
}

/// execute [fn] as a separate microtask and return a [Future] that completes
/// normally when that [Future] completes (normally or with an error).
Future _microtask(fn()) => Future.microtask(fn).whenComplete(() {});

/// Wrapper class on [Element] to handle basic mouse tracking and sending
/// events.
class TrackedElement {
  final Element element;
  Rectangle bounds;
  bool mouseIsInside = false;

  TrackedElement(this.element);

  /// Returns true if point is inside element.
  bool containsPoint(Point p) {
    bounds ??= element.getBoundingClientRect();
    return bounds.containsPoint(p);
  }

  bool _isEntering(Point p) => containsPoint(p) && !mouseIsInside;

  bool _isLeaving(Point p) => !containsPoint(p) && mouseIsInside;

  /// Sends mouse enter event to element.
  Future dispatchMouseEnter(int x, int y) =>
      _microtask(() => element.dispatchEvent(MouseEvent('mouseenter',
          screenX: _screenX(x),
          screenY: _screenY(y),
          clientX: x,
          clientY: y,
          canBubble: false)));

  /// Sends mouse over event to element or the appropriate child.
  Future dispatchMouseOver(int x, int y) =>
      _microtask(() => element.dispatchEvent(MouseEvent('mouseover',
          screenX: _screenX(x),
          screenY: _screenY(y),
          clientX: x,
          clientY: y,
          canBubble: true)));

  /// Sends mouse leave event to element.
  Future dispatchMouseLeave(int x, int y) =>
      _microtask(() => element.dispatchEvent(MouseEvent('mouseleave',
          screenX: _screenX(x),
          screenY: _screenY(y),
          clientX: x,
          clientY: y,
          canBubble: false)));

  /// Sends mouse out event to element or the appropriate child.
  Future dispatchMouseOut(int x, int y) =>
      _microtask(() => element.dispatchEvent(MouseEvent('mouseout',
          screenX: _screenX(x),
          screenY: _screenY(y),
          clientX: x,
          clientY: y,
          canBubble: true)));

  /// Sends mouse leave event to element.
  Future dispatchMouseMove(int x, int y) =>
      _microtask(() => element.dispatchEvent(MouseEvent('mousemove',
          screenX: _screenX(x),
          screenY: _screenY(y),
          clientX: x,
          clientY: y,
          canBubble: true)));
}

/// Methods to calculate offsets.
int _pageX(int clientX) => window.pageXOffset + clientX;
int _pageY(int clientY) => window.pageYOffset + clientY;
int get _borderWidth => (window.outerWidth - window.innerWidth) ~/ 2;
int _screenX(int clientX) => window.screenLeft + _borderWidth + clientX;
int _screenY(int clientY) =>
    window.screenTop +
    window.outerHeight -
    window.innerHeight -
    _borderWidth +
    clientY;
