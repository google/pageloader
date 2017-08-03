// Copyright 2014 Google Inc. All rights reserved.
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

library pageloader.test.basic;

import 'package:pageloader/objects.dart';
import 'package:test/test.dart';
import 'shared.dart';

void runTests() {
  group('sync smoke tests', () {
    test('globalContext sync functions work', () async {
      expect(loader.globalContext.nameSync, '__document__');
      expect(loader.globalContext.displayedSync, true);
      expect(loader.globalContext.innerTextSync, startsWith('test_page'));
      expect(loader.globalContext.visibleTextSync, startsWith('r1c1 r1c2'));
    });
  });
}

class PageForOptionalFunctionTest {
  @ByTagName('non-existant')
  @optional
  Lazy shouldBeNull;

  @ById('button-1')
  @optional
  Lazy shouldBeNonNull;
}

class SubclassPage extends PageForSimpleTest {}

class PageForClassAnnotationTest {
  @root
  Table table;
}

class PageForSettersTest {
  List<PageLoaderElement> _shouldHaveOneElement;
  var _loader;

  @inject
  set loader(PageLoader l) {
    this._loader = l;
  }

  PageLoader get loader => _loader;

  @ById('div')
  @disableDisplayedCheck
  set shouldHaveOneElement(List<PageLoaderElement> elements) {
    _shouldHaveOneElement = elements;
  }

  get shouldHaveOneElement => _shouldHaveOneElement;
}

class PageForSkipFieldsWithoutFinderTest {
  @ById('div')
  @disableDisplayedCheck
  List<PageLoaderElement> shouldHaveOneElement;

  List<PageLoaderElement> shouldBeNull;
}

class PageForOptionalElementTest {
  @ById('non-existent id')
  @optional
  PageLoaderElement doesntExist;
}

class MixinForMixinTest {
  @ById('div')
  @disableDisplayedCheck
  List<PageLoaderElement> shouldHaveOneElement;

  @ById('div')
  List<PageLoaderElement> shouldBeEmpty;

  @ById('div')
  @IsDisplayed()
  @disableDisplayedCheck
  List shouldAlsoBeEmpty;
}

class PageForAmbiguousTest {
  @ByTagName('input')
  PageLoaderElement element;
}

class PageForMixinTest extends PageForSimpleTest with MixinForMixinTest {}

class PageForPrivateConstructorTest extends PageForSimpleTest {
  PageForPrivateConstructorTest._();
}

class PageForPrivateFieldsTest {
  @ByTagName('table')
  Table _privateTable;

  Table get table => _privateTable;
}

class PageForLazyTest {
  @ByTagName('table')
  Lazy lazyElement;

  @ByTagName('table')
  Lazy<Table> lazyTable;

  @ByCss('table tr')
  Lazy<List> lazyRowElements;

  @ByCss('table tr')
  Lazy<List<Row>> lazyRows;
}

class PageForNbspTest {
  @ById('nbsp')
  PageLoaderElement span;
}

class PageForFocusTest {
  @ById('text')
  PageLoaderElement textfield;
}
