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

part 'constructors.g.dart';

typedef GetNewContext = PageLoaderElement? Function();

void runTests(GetNewContext contextGenerator) {
  group('lookup constructor', () {
    BasePO base;
    late BCustomTagPO bTag;

    setUp(() {
      base = BasePO.create(contextGenerator());
      bTag = base.bTagPO;
    });

    test('works with PLE', () async {
      final cTag = bTag.cTagFromPLE;
      expect(cTag.innerText, equals('C tag inner text'));
    });

    test('works with utils', () async {
      final cTag = bTag.cTagFromUtils;
      expect(cTag.innerText, equals('C tag inner text'));
    });

    test('on PO without CheckTag should fail', () async {
      try {
        bTag.noLookupPO;
        fail('Expected to throw error on lookup usage without CheckTag');
      } catch (e) {
        expect(
            e.toString(),
            contains("'lookup' constructor for class NoLookupPO"
                ' is not generated and can only be used on Page Object classes'
                ' that have @CheckTag annotation.'));
      }
    });
  });

  group('generated fields', () {
    test('tagName exists', () {
      expect($BCustomTagPO.tagName, equals('b-custom-tag'));
    });

    test('tagName throws error', () {
      try {
        $NoLookupPO.tagName;
        fail('Expected to throw error on tagName usage without CheckTag');
      } catch (e) {
        expect(
            e.toString(),
            contains('\"tagName\" '
                'is not defined by Page Object \"NoLookupPO\". Requires @CheckTag '
                'annotation in order for \"tagName\" to be generated.'));
      }
    });
  });
}

@PageObject()
abstract class BasePO {
  BasePO();
  factory BasePO.create(PageLoaderElement? context) = $BasePO.create;

  @ByTagName(BCustomTagPO.tagName)
  BCustomTagPO get bTagPO;
}

@PageObject()
@CheckTag(BCustomTagPO.tagName)
abstract class BCustomTagPO {
  BCustomTagPO();
  factory BCustomTagPO.create(PageLoaderElement context) = $BCustomTagPO.create;

  static const tagName = 'b-custom-tag';

  @root
  PageLoaderElement? get _root;

  PageLoaderElement? get rootElement => _root;

  PageUtils? get _utils => _root!.utils;

  CCustomTagPO get cTagFromPLE => CCustomTagPO.lookup(_root!);
  CCustomTagPO get cTagFromUtils => CCustomTagPO.lookup(_utils!);

  NoLookupPO get noLookupPO => NoLookupPO.lookup(_root);
}

@PageObject()
@CheckTag(CCustomTagPO.tagName)
abstract class CCustomTagPO {
  CCustomTagPO();
  factory CCustomTagPO.create(PageLoaderElement context) = $CCustomTagPO.create;
  factory CCustomTagPO.lookup(PageLoaderSource source) = $CCustomTagPO.lookup;

  static const tagName = 'c-custom-tag';

  @root
  PageLoaderElement? get _root;

  String? get innerText => _root!.innerText;
}

@PageObject()
abstract class NoLookupPO {
  NoLookupPO();
  factory NoLookupPO.create(PageLoaderElement context) = $NoLookupPO.create;
  factory NoLookupPO.lookup(PageLoaderSource? source) = $NoLookupPO.lookup;
}
