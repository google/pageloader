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
import 'package:pageloader/testing.dart';
import 'package:test/test.dart';

import 'generation_test_setup/dummy_page_loader_element.dart'
    show DummyPageLoaderElement, DummyPageLoaderAttributes;

void main() {
  test('exists', () {
    final context = new DummyPageLoaderElement(exists: true);
    final po = new DummyPO(context);

    expect(context, exists);
    expect(po, exists);
  });

  test('notExists', () {
    final context = new DummyPageLoaderElement(exists: false);
    final po = new DummyPO(context);

    expect(context, notExists);
    expect(po, notExists);
  });

  test('hasClass', () {
    final context = new DummyPageLoaderElement(classes: ['foo']);
    final po = new DummyPO(context);

    expect(context, hasClass('foo'));
    expect(po, hasClass('foo'));
  });

  test('isDisplayed', () {
    final context = new DummyPageLoaderElement(displayed: true);
    final po = new DummyPO(context);

    expect(context, isDisplayed);
    expect(po, isDisplayed);
  });

  test('isNotDisplayed', () {
    final context = new DummyPageLoaderElement(displayed: false);
    final po = new DummyPO(context);

    expect(context, isNotDisplayed);
    expect(po, isNotDisplayed);
  });

  test('isHidden', () {
    final context1 = new DummyPageLoaderElement();
    (context1.computedStyle as DummyPageLoaderAttributes)['visibility'] =
        'hidden';
    final context2 = new DummyPageLoaderElement();
    (context2.computedStyle as DummyPageLoaderAttributes)['visibility'] =
        'collapse';

    final po1 = new DummyPO(context1);
    final po2 = new DummyPO(context2);

    expect(context1, isHidden);
    expect(context2, isHidden);
    expect(po1, isHidden);
    expect(po2, isHidden);
  });

  test('isNotHidden', () {
    final context = new DummyPageLoaderElement();
    final po = new DummyPO(context);

    expect(context, isNotHidden);
    expect(po, isNotHidden);
  });

  test('isFocused', () {
    final context = new DummyPageLoaderElement(focused: true);
    final po = new DummyPO(context);

    expect(context, isFocused);
    expect(po, isFocused);
  });

  test('isNotFocused', () {
    final context = new DummyPageLoaderElement(focused: false);
    final po = new DummyPO(context);

    expect(context, isNotFocused);
    expect(po, isNotFocused);
  });
}

class DummyPO {
  // ignore: non_constant_identifier_names
  PageLoaderElement __root__;

  PageLoaderElement get $root => __root__;

  DummyPO(this.__root__);
}
