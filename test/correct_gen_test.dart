// @dart = 2.9

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

@TestOn('vm')
@Tags(['core'])

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
  final context = () => DummyPageLoaderElement();

  group('non-mixin', () {
    test('class checks work', () {
      final classChecks = ClassChecks.create(context());
      expect(classChecks.myRoot.toString(), '@CheckTag("some-tag")');
    });

    test('@EnsureTag checks work', () {
      final ensureTagChecks = EnsureTagChecks.create(context());
      expect(ensureTagChecks.myRoot.toString(),
          '@EnsureTag("some-other-tag")  @EnsureTag("some-other-tag")');
    });

    test('empty class works', () {
      Empty.create(context());
    });

    test('finders work', () {
      final finders = Finders.create(context());
      expect(finders.element.toString(), '@ByCss("some-class")');
      expect(finders.secret.toString(), '@ByCss("secret")');
      expect(finders.filtered.toString(),
          '@ByCss("some-other-class") @WithAttribute("also-with", "this-attribute")');
      expect(finders.checkTagPO.toString(),
          '@ByTagName("check-tag-po")  @CheckTag("check-tag-po")');
    });

    test('iterators work', () {
      final inner = InnerObject.create(context());
      expect(inner.innerIterable.toString(), '@ByCss("nested-iterable")');
      expect(inner.innerCheckTagPO.toString(), '@ByTagName("check-tag-po")');
      final iterables = Iterables.create(context());
      expect(iterables.basics.toString(), '@ByCss("basic")');
      expect(iterables.nested.toString(), '@ByCss("nested")');
      expect(iterables.checkTagPO.toString(), '@ByTagName("check-tag-po")');
    });

    test('list works', () async {
      final list = Lists.create(context());
      expect(await list.basics, hasLength(1));
      expect((await list.basics)[0].toString(), '@ByCss("basic")');
      expect(await list.nested, hasLength(1));
      expect((await list.nested)[0].toString(), contains('\$InnerListObject'));
      expect(await list.checkTagPO, hasLength(1));
      expect((await list.checkTagPO)[0].toString(),
          '@ByTagName("check-tag-po")  @CheckTag("check-tag-po")');
    });

    test('list works synchronously', () async {
      final list = Lists.create(context());
      expect(list.basicsSync, hasLength(1));
      expect(list.basicsSync[0].toString(), '@ByCss("basic")');
      expect(list.nestedSync, hasLength(1));
      expect(list.nestedSync[0].toString(), contains('\$InnerListObject'));
      expect(list.checkTagPOSync, hasLength(1));
      expect(list.checkTagPOSync[0].toString(),
          '@ByTagName("check-tag-po")  @CheckTag("check-tag-po")');
    });

    test('listeners works', () async {
      final root = context();
      final listener = DummyListener();
      root.addListeners([listener]);
      final nested = Nested.create(root);
      nested.findersElement.element.toString();
      expect(listener.values, hasLength(2));
      expect(listener.values[0], 'Nested.findersElement');
      expect(listener.values[1], 'Finders.element');
    });

    test('mouse works', () {
      final mouse = MouseObject.create(context());
      expect(mouse.mouse.toString(), 'DummyMouse');
    });

    test('multiple generated page objects in single file works', () {
      final a = A.create(context());
      final b = B.create(context());
      final c = C.create(context());

      expect(a.b.base.toString(), startsWith('@ByCss("b-in-a-class")'));
      expect(c.b.base.toString(), startsWith('@ByCss("b-in-c-class")'));

      expect(b.base.toString(), '@ByCss("base-class")');
      expect(a.b.base.toString(), endsWith('@ByCss("base-class")'));
      expect(c.b.base.toString(), endsWith('@ByCss("base-class")'));
    });

    test('nested singled works', () {
      final nested = Nested.create(context());
      final elementString = nested.findersElement.element.toString();
      expect(elementString, startsWith('@ByCss("some-nested-class")'));
      expect(elementString, endsWith('@ByCss("some-class")'));
    });

    test('optional parameters work', () {
      final parameters = Parameters.create(context());
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
      final root = Root.create(context());
      expect(root.myRoot.toString(), '');

      final parentRoot = ParentRoot.create(context());
      expect(parentRoot.root.myRoot.toString(), '@ById("root-id")');
    });

    test('unannotated functions work', () {
      final unannotated = Unannotated.create(context());

      expect(unannotated.oneParameter('test'), 'private_test');
      expect(unannotated.twoParameters(1, 2), 3);
      expect(unannotated.isFieldSet, false);
      unannotated.myField = true;
      expect(unannotated.isFieldSet, true);

      // Should not throw runtime Type error:
      unannotated.generateTypedList<String>();
    });

    test('generic classes and functions work', () {
      final vanillaAsCanBe = Generics<int>.create(context());
      expect(
          vanillaAsCanBe.typeDefParameter(42, (int x) => x.toString()), '42');
    });

    test('parameterized getters in classes work', () {
      final rootPo = RootPo<String>.create(context());
      expect(rootPo.generics.typeDefParameter(' 42 ', (String x) => x.trim()),
          '42');
      expect(
          rootPo.checkedGenerics
              .typeDefParameter(' 42 ', (String x) => x.trim()),
          '42');
    });

    test('parameterized getter lists in classes work', () {
      final rootPo = RootPo<String>.create(context());
      expect(rootPo.genericsList, TypeMatcher<List<Generics<String>>>());
      expect(rootPo.checkedGenericsList,
          TypeMatcher<List<CheckedGenerics<String>>>());
    });

    test('generic methods work for singles', () {
      final generics = Generics<int>.create(context());
      expect(generics.exampleMethod(5), 5);
    });

    test('generic methods work for single with generic lists', () {
      final generics = Generics<List<int>>.create(context());
      expect(generics.exampleMethod([5]), [5]);
    });

    test('generic methods work for lists of parameters', () {
      final generics = GenericPair<int, String>.create(context());
      expect(generics.exampleMethodMap(5, '6'), containsPair(5, '6'));
    });

    test('generic methods work for ridiculously complex generics', () {
      final generics =
          GenericPair<List<int>, Map<String, String>>.create(context());
      final key = [5];
      final value = {'a': 'b', 'c': 'd'};
      expect(generics.exampleMethodMap(key, value), containsPair(key, value));
    });
  });

  group('mixin', () {
    test('class checks work', () {
      final classChecks = ClassChecksUsingMixin.create(context());
      expect(classChecks.myRoot.toString(), '@CheckTag("some-tag")');
    });

    test('@EnsureTag checks work', () {
      final ensureTagChecks = EnsureTagChecksUsingMixin.create(context());
      expect(ensureTagChecks.myRoot.toString(),
          '@EnsureTag("some-other-tag")  @EnsureTag("some-other-tag")');
    });

    test('finders work', () {
      final finders = FindersUsingMixin.create(context());
      expect(finders.element.toString(), '@ByCss("some-class")');
      expect(finders.secret.toString(), '@ByCss("secret")');
      expect(finders.filtered.toString(),
          '@ByCss("some-other-class") @WithAttribute("also-with", "this-attribute")');
      expect(finders.checkTagPO.toString(),
          '@ByTagName("check-tag-po")  @CheckTag("check-tag-po")');
    });

    test('iterators work', () {
      final inner = InnerObjectUsingMixin.create(context());
      expect(inner.innerIterable.toString(), '@ByCss("nested-iterable")');
      expect(inner.innerCheckTagPO.toString(), '@ByTagName("check-tag-po")');
      final iterables = IterablesUsingMixin.create(context());
      expect(iterables.basics.toString(), '@ByCss("basic")');
      expect(iterables.nested.toString(), '@ByCss("nested")');
      expect(iterables.checkTagPO.toString(), '@ByTagName("check-tag-po")');
    });

    test('list works', () async {
      final list = ListsUsingMixin.create(context());
      expect(await list.basics, hasLength(1));
      expect((await list.basics)[0].toString(), '@ByCss("basic")');
      expect(await list.nested, hasLength(1));
      expect((await list.nested)[0].toString(), contains('\$InnerListObject'));
      expect(await list.checkTagPO, hasLength(1));
      expect((await list.checkTagPO)[0].toString(),
          '@ByTagName("check-tag-po")  @CheckTag("check-tag-po")');
    });

    test('list works synchronously', () async {
      final list = ListsUsingMixin.create(context());
      expect(list.basicsSync, hasLength(1));
      expect(list.basicsSync[0].toString(), '@ByCss("basic")');
      expect(list.nestedSync, hasLength(1));
      expect(list.nestedSync[0].toString(), contains('\$InnerListObject'));
      expect(list.checkTagPOSync, hasLength(1));
      expect(list.checkTagPOSync[0].toString(),
          '@ByTagName("check-tag-po")  @CheckTag("check-tag-po")');
    });

    test('listeners works', () async {
      final root = context();
      final listener = DummyListener();
      root.addListeners([listener]);
      final nested = NestedUsingMixin.create(root);
      nested.findersElement.element.toString();
      expect(listener.values, hasLength(2));
      expect(listener.values[0], 'NestedMixin.findersElement');
      expect(listener.values[1], 'FindersMixin.element');
    });

    test('mouse works', () {
      final mouse = MouseObjectUsingMixin.create(context());
      expect(mouse.mouse.toString(), 'DummyMouse');
    });

    test('nested singled works', () {
      final nested = NestedUsingMixin.create(context());
      final elementString = nested.findersElement.element.toString();
      expect(elementString, startsWith('@ByCss("some-nested-class")'));
      expect(elementString, endsWith('@ByCss("some-class")'));
    });

    test('optional parameters work', () {
      final parameters = ParametersUsingMixin.create(context());
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
      final root = RootUsingMixin.create(context());
      expect(root.myRoot.toString(), '');

      final parentRoot = ParentRootUsingMixin.create(context());
      expect(parentRoot.root.myRoot.toString(), '@ById("root-id")');
    });

    test('unannotated functions work', () {
      final unannotated = UnannotatedUsingMixin.create(context());

      expect(unannotated.oneParameter('test'), 'private_test');
      expect(unannotated.twoParameters(1, 2), 3);
      expect(unannotated.isFieldSet, false);
      unannotated.myField = true;
      expect(unannotated.isFieldSet, true);

      // Should not throw runtime Type error:
      unannotated.generateTypedList<String>();
    });

    test('generic classes and functions work', () {
      final vanillaAsCanBe = GenericsUsingMixin<int>.create(context());
      expect(
          vanillaAsCanBe.typeDefParameter(42, (int x) => x.toString()), '42');
    });

    test('parameterized getters in classes work', () {
      final rootPo = RootPoUsingMixin<String>.create(context());
      expect(rootPo.generics.typeDefParameter(' 42 ', (String x) => x.trim()),
          '42');
      expect(
          rootPo.checkedGenerics
              .typeDefParameter(' 42 ', (String x) => x.trim()),
          '42');
    });

    test('parameterized getter lists in classes work', () {
      final rootPo = RootPoUsingMixin<String>.create(context());
      expect(rootPo.genericsList, TypeMatcher<List<Generics<String>>>());
      expect(rootPo.checkedGenericsList,
          TypeMatcher<List<CheckedGenerics<String>>>());
    });

    test('generic methods work for singles', () {
      final generics = GenericsUsingMixin<int>.create(context());
      expect(generics.exampleMethod(5), 5);
    });

    test('generic methods work for single with generic lists', () {
      final generics = GenericsUsingMixin<List<int>>.create(context());
      expect(generics.exampleMethod([5]), [5]);
    });

    test('generic methods work for lists of parameters', () {
      final generics = GenericPairUsingMixin<int, String>.create(context());
      expect(generics.exampleMethodMap(5, '6'), containsPair(5, '6'));
    });

    test('generic methods work for ridiculously complex generics', () {
      final generics =
          GenericPairUsingMixin<List<int>, Map<String, String>>.create(
              context());
      final key = [5];
      final value = {'a': 'b', 'c': 'd'};
      expect(generics.exampleMethodMap(key, value), containsPair(key, value));
    });
  });
}
