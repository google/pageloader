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

import 'package:test/test.dart';

import 'examples/correct/class_checks.dart';
import 'examples/correct/empty.dart';
import 'examples/correct/finders.dart';
import 'examples/correct/generics.dart';
import 'examples/correct/iterables.dart';
import 'examples/correct/list.dart';
import 'examples/correct/mouse.dart';
import 'examples/correct/multiple_in_file.dart';
import 'examples/correct/nested.dart';
import 'examples/correct/parameters.dart';
import 'examples/correct/root.dart';
import 'examples/correct/unannotated.dart';
import 'generation_test_setup/dummy_page_loader_element.dart';

void main() {
  final context = () => new DummyPageLoaderElement();

  group('non-mixin', () {
    test('class checks work', () {
      final classChecks = new ClassChecks.create(context());
      expect(classChecks.myRoot.toString(), '@CheckTag("some-tag")');
    });

    test('@EnsureTag checks work', () {
      final ensureTagChecks = new EnsureTagChecks.create(context());
      expect(ensureTagChecks.myRoot.toString(),
          '@EnsureTag("some-other-tag")  @EnsureTag("some-other-tag")');
    });

    test('empty class works', () {
      new Empty.create(context());
    });

    test('finders work', () {
      final finders = new Finders.create(context());
      expect(finders.element.toString(), '@ByCss("some-class")');
      expect(finders.secret.toString(), '@ByCss("secret")');
      expect(finders.filtered.toString(),
          '@ByCss("some-other-class") @WithAttribute("also-with", "this-attribute")');
    });

    test('iterators work', () {
      final inner = new InnerObject.create(context());
      expect(inner.innerIterable.toString(), '@ByCss("nested-iterable")');
      final iterables = new Iterables.create(context());
      expect(iterables.basics.toString(), '@ByCss("basic")');
      expect(iterables.nested.toString(), '@ByCss("nested")');
    });

    test('list works', () async {
      final list = new Lists.create(context());
      expect(await list.basics, hasLength(1));
      expect((await list.basics)[0].toString(), '@ByCss("basic")');
      expect(await list.nested, hasLength(1));
      expect((await list.nested)[0].toString(), contains('\$InnerListObject'));
    });

    test('list works synchronously', () async {
      final list = new Lists.create(context());
      expect(list.basicsSync, hasLength(1));
      expect((list.basicsSync)[0].toString(), '@ByCss("basic")');
      expect(list.nestedSync, hasLength(1));
      expect((list.nestedSync)[0].toString(), contains('\$InnerListObject'));
    });

    test('listeners works', () async {
      final root = context();
      final listener = new DummyListener();
      root.addListeners([listener]);
      final nested = new Nested.create(root);
      nested.findersElement.element.toString();
      expect(listener.values, hasLength(2));
      expect(listener.values[0], 'Nested.findersElement');
      expect(listener.values[1], 'Finders.element');
    });

    test('mouse works', () {
      final mouse = new MouseObject.create(context());
      expect(mouse.mouse.toString(), 'DummyMouse');
    });

    test('multiple generated page objects in single file works', () {
      final a = new A.create(context());
      final b = new B.create(context());
      final c = new C.create(context());

      expect(a.b.base.toString(), startsWith('@ByCss("b-in-a-class")'));
      expect(c.b.base.toString(), startsWith('@ByCss("b-in-c-class")'));

      expect(b.base.toString(), '@ByCss("base-class")');
      expect(a.b.base.toString(), endsWith('@ByCss("base-class")'));
      expect(c.b.base.toString(), endsWith('@ByCss("base-class")'));
    });

    test('nested singled works', () {
      final nested = new Nested.create(context());
      final elementString = nested.findersElement.element.toString();
      expect(elementString, startsWith('@ByCss("some-nested-class")'));
      expect(elementString, endsWith('@ByCss("some-class")'));
    });

    test('optional parameters work', () {
      final parameters = new Parameters.create(context());
      expect(parameters.testOptionalNamedParam(first: '1'), '1b');
      expect(parameters.testOptionalNamedParam(second: '2'), 'a2');
      expect(parameters.testMixedOptionalNamedParam('x', first: '1'), 'x1b');
      expect(parameters.testMixedOptionalNamedParam('x', second: '2'), 'xa2');
      expect(parameters.testOptionalPositionalParam('1'), '1b');
      expect(parameters.testOptionalPositionalParam('1', '2'), '12');
      expect(parameters.testMixedOptionalPositionalParam('x', '1'), 'x1b');
      expect(parameters.testMixedOptionalPositionalParam('x', '1', '2'), 'x12');
    });

    test('root works', () {
      final root = new Root.create(context());
      expect(root.myRoot.toString(), '');

      final parentRoot = new ParentRoot.create(context());
      expect(parentRoot.root.myRoot.toString(), '@ById("root-id")');
    });

    test('unannotated functions work', () {
      final unannotated = new Unannotated.create(context());

      expect(unannotated.oneParameter('test'), 'private_test');
      expect(unannotated.twoParameters(1, 2), 3);
      expect(unannotated.isFieldSet, false);
      unannotated.myField = true;
      expect(unannotated.isFieldSet, true);
    });

    test('generic classes and functions work', () {
      final vanillaAsCanBe = new Generics<int>.create(context());
      expect(
          vanillaAsCanBe.typeDefParameter(42, (int x) => x.toString()), '42');
    });

    test('parameterized getters in classes work', () {
      final rootPo = new RootPo<String>.create(context());
      expect(rootPo.generics.typeDefParameter(' 42 ', (String x) => x.trim()),
          '42');
    });

    test('parameterized getter lists in classes work', () {
      final rootPo = new RootPo<String>.create(context());
      expect(rootPo.genericsList, new isInstanceOf<List<Generics<String>>>());
    });

    test('generic methods work for singles', () {
      final generics = new Generics<int>.create(context());
      expect(generics.exampleMethod(5), 5);
    });

    test('generic methods work for single with generic lists', () {
      final generics = new Generics<List<int>>.create(context());
      expect(generics.exampleMethod([5]), [5]);
    });

    test('generic methods work for lists of parameters', () {
      final generics = new GenericPair<int, String>.create(context());
      expect(generics.exampleMethodMap(5, '6'), containsPair(5, '6'));
    });

    test('generic methods work for ridiculously complex generics', () {
      final generics =
          new GenericPair<List<int>, Map<String, String>>.create(context());
      final key = [5];
      final value = {'a': 'b', 'c': 'd'};
      expect(generics.exampleMethodMap(key, value), containsPair(key, value));
    });
  });

  group('mixin', () {
    test('class checks work', () {
      final classChecks = new ClassChecksUsingMixin.create(context());
      expect(classChecks.myRoot.toString(), '@CheckTag("some-tag")');
    });

    test('@EnsureTag checks work', () {
      final ensureTagChecks = new EnsureTagChecksUsingMixin.create(context());
      expect(ensureTagChecks.myRoot.toString(),
          '@EnsureTag("some-other-tag")  @EnsureTag("some-other-tag")');
    });

    test('finders work', () {
      final finders = new FindersUsingMixin.create(context());
      expect(finders.element.toString(), '@ByCss("some-class")');
      expect(finders.secret.toString(), '@ByCss("secret")');
      expect(finders.filtered.toString(),
          '@ByCss("some-other-class") @WithAttribute("also-with", "this-attribute")');
    });

    test('iterators work', () {
      final inner = new InnerObjectUsingMixin.create(context());
      expect(inner.innerIterable.toString(), '@ByCss("nested-iterable")');
      final iterables = new IterablesUsingMixin.create(context());
      expect(iterables.basics.toString(), '@ByCss("basic")');
      expect(iterables.nested.toString(), '@ByCss("nested")');
    });

    test('list works', () async {
      final list = new ListsUsingMixin.create(context());
      expect(await list.basics, hasLength(1));
      expect((await list.basics)[0].toString(), '@ByCss("basic")');
      expect(await list.nested, hasLength(1));
      expect((await list.nested)[0].toString(), contains('\$InnerListObject'));
    });

    test('list works synchronously', () async {
      final list = new ListsUsingMixin.create(context());
      expect(list.basicsSync, hasLength(1));
      expect((list.basicsSync)[0].toString(), '@ByCss("basic")');
      expect(list.nestedSync, hasLength(1));
      expect((list.nestedSync)[0].toString(), contains('\$InnerListObject'));
    });

    test('listeners works', () async {
      final root = context();
      final listener = new DummyListener();
      root.addListeners([listener]);
      final nested = new NestedUsingMixin.create(root);
      nested.findersElement.element.toString();
      expect(listener.values, hasLength(2));
      expect(listener.values[0], 'NestedMixin.findersElement');
      expect(listener.values[1], 'FindersMixin.element');
    });

    test('mouse works', () {
      final mouse = new MouseObjectUsingMixin.create(context());
      expect(mouse.mouse.toString(), 'DummyMouse');
    });

    test('nested singled works', () {
      final nested = new NestedUsingMixin.create(context());
      final elementString = nested.findersElement.element.toString();
      expect(elementString, startsWith('@ByCss("some-nested-class")'));
      expect(elementString, endsWith('@ByCss("some-class")'));
    });

    test('optional parameters work', () {
      final parameters = new ParametersUsingMixin.create(context());
      expect(parameters.testOptionalNamedParam(first: '1'), '1b');
      expect(parameters.testOptionalNamedParam(second: '2'), 'a2');
      expect(parameters.testMixedOptionalNamedParam('x', first: '1'), 'x1b');
      expect(parameters.testMixedOptionalNamedParam('x', second: '2'), 'xa2');
      expect(parameters.testOptionalPositionalParam('1'), '1b');
      expect(parameters.testOptionalPositionalParam('1', '2'), '12');
      expect(parameters.testMixedOptionalPositionalParam('x', '1'), 'x1b');
      expect(parameters.testMixedOptionalPositionalParam('x', '1', '2'), 'x12');
    });

    test('root works', () {
      final root = new RootUsingMixin.create(context());
      expect(root.myRoot.toString(), '');

      final parentRoot = new ParentRootUsingMixin.create(context());
      expect(parentRoot.root.myRoot.toString(), '@ById("root-id")');
    });

    test('unannotated functions work', () {
      final unannotated = new UnannotatedUsingMixin.create(context());

      expect(unannotated.oneParameter('test'), 'private_test');
      expect(unannotated.twoParameters(1, 2), 3);
      expect(unannotated.isFieldSet, false);
      unannotated.myField = true;
      expect(unannotated.isFieldSet, true);
    });

    test('generic classes and functions work', () {
      final vanillaAsCanBe = new GenericsUsingMixin<int>.create(context());
      expect(
          vanillaAsCanBe.typeDefParameter(42, (int x) => x.toString()), '42');
    });

    test('parameterized getters in classes work', () {
      final rootPo = new RootPoUsingMixin<String>.create(context());
      expect(rootPo.generics.typeDefParameter(' 42 ', (String x) => x.trim()),
          '42');
    });

    test('parameterized getter lists in classes work', () {
      final rootPo = new RootPoUsingMixin<String>.create(context());
      expect(rootPo.genericsList, new isInstanceOf<List<Generics<String>>>());
    });

    test('generic methods work for singles', () {
      final generics = new GenericsUsingMixin<int>.create(context());
      expect(generics.exampleMethod(5), 5);
    });

    test('generic methods work for single with generic lists', () {
      final generics = new GenericsUsingMixin<List<int>>.create(context());
      expect(generics.exampleMethod([5]), [5]);
    });

    test('generic methods work for lists of parameters', () {
      final generics = new GenericPairUsingMixin<int, String>.create(context());
      expect(generics.exampleMethodMap(5, '6'), containsPair(5, '6'));
    });

    test('generic methods work for ridiculously complex generics', () {
      final generics =
          new GenericPairUsingMixin<List<int>, Map<String, String>>.create(
              context());
      final key = [5];
      final value = {'a': 'b', 'c': 'd'};
      expect(generics.exampleMethodMap(key, value), containsPair(key, value));
    });
  });
}
