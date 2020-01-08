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
import 'package:test/test.dart';

part 'generics.g.dart';

typedef GetNewContext = PageLoaderElement Function();

void runTests(GetNewContext contextGenerator) {
  group('generics', () {
    test('works for functions', () async {
      final generics = Generics<int>.create(contextGenerator());
      expect(generics.typeDefParameter(42, (int x) => x.toString()), '42');
    });

    test('works for parameterized getters', () {
      final rootPo = RootPo<String>.create(contextGenerator());
      expect(rootPo.generics.typeDefParameter(' 42 ', (String x) => x.trim()),
          '42');
    });

    test('words for parameterized getter lists', () {
      final rootPo = RootPo<String>.create(contextGenerator());
      expect(rootPo.genericsList, hasLength(4));
      expect(
          rootPo.genericsList[0]
              .typeDefParameter(' 42 ', (String x) => x.trim()),
          '42');
    });
  });
}

typedef MyGenericTypeDef<T> = String Function(T item);

@PageObject()
abstract class Generics<T> {
  Generics();
  factory Generics.create(PageLoaderElement context) = $Generics<T>.create;

  String typeDefParameter(T thing, MyGenericTypeDef<T> typeDef) {
    return typeDef(thing);
  }
}

@PageObject()
abstract class RootPo<T> {
  RootPo();
  factory RootPo.create(PageLoaderElement context) = $RootPo<T>.create;

  @ById('button-1')
  Generics<T> get generics;

  @ByTagName('td')
  List<Generics<T>> get genericsList;
}
