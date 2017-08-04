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

library pageloader.test.error;

import 'package:pageloader/objects.dart';
import 'package:test/test.dart';
import 'shared.dart';

runTests() {
  group('error tests', () {
    test('exception on finals', () {
      expect(loaderUtil.getInstance(PageForExceptionOnFinalsTest), throws);
    });

    test('no matching element', () {
      expect(loaderUtil.getInstance(PageForNoMatchingElementTest), throws);
    });

    test('no matching class element', () {
      expect(loaderUtil.getInstance(PageForNoMatchingClassElementTest), throws);
    });

    test('multiple matching element', () {
      expect(loaderUtil.getInstance(PageForMultipleMatchingElementTest), throws);
    });

    test('multiple matching class element', () {
      expect(
          loaderUtil.getInstance(PageForMultipleMatchingClassElementTest), throws);
    });

    test('multiple finders', () {
      expect(loaderUtil.getInstance(PageForMultipleFinderTest), throws);
    });

    test('multiple class finders', () {
      expect(loaderUtil.getInstance(PageForMultipleClassFinderTest), throws);
    });

    test('filter without finder', () {
      expect(loaderUtil.getInstance(PageForFilterWithoutFinderTest), throws);
    });

    test('invalid constructor', () {
      expect(loaderUtil.getInstance(PageForInvalidConstructorTest), throws);
    });

    test('ambiguous element test', () {
      expect(loaderUtil.getInstance(PageForAmbiguousTest), throws);
    });

    test('private setters', () {
      expect(loaderUtil.getInstance(PageForPrivateSettersTest), throws);
    });

    test('static field', () {
      expect(loaderUtil.getInstance(PageForStaticFieldsTest), throws);
    });

    test('static setter', () {
      expect(loaderUtil.getInstance(PageForStaticSettersTest), throws);
    });
  });

  group('check exception stack traces', () {
    test('ensure stack trace from getInstance includes test', () async {
      try {
        await loaderUtil.getInstance(PageForNoMatchingElementTest);
        fail('expected exception');
      } on PageLoaderException catch (e, s) {
        expect(s.toString(), contains('errors.dart'));
        expect(s.toString(), contains('runTests'));
      }
    }, onPlatform: {'js': new Skip('stack traces are not accurate in js')});
  });
}

class PageForBadClickTest {
  @ByTagName('button')
  PageLoaderElement button;
}

class PageForExceptionOnFinalsTest {
  @ById('help')
  final PageLoaderElement el = null;
}

class PageForNoMatchingElementTest {
  @ById('non-existent id')
  PageLoaderElement doesntExist;
}

@ById('non-existent id')
class PageForNoMatchingClassElementTest {
  @root
  PageLoaderElement doesntExist;
}

class PageForMultipleMatchingElementTest {
  @ByTagName('td')
  PageLoaderElement doesntExist;
}

@ByTagName('td')
class PageForMultipleMatchingClassElementTest {
  @root
  PageLoaderElement doesntExist;
}

@ById('non-existent id')
@ByTagName('a-name')
class PageForMultipleClassFinderTest {
  @root
  PageLoaderElement multipleFinder;
}

class PageForAmbiguousTest {
  @ByTagName('input')
  PageLoaderElement element;
}

class PageForPrivateSettersTest {
  Table table;

  @ByTagName('table')
  set _table(Table t) => table = t;

  // added to make analyzer happy
  void setTable(Table t) {
    _table = t;
  }
}

class PageForMultipleFinderTest {
  @ById('non-existent id')
  @ByTagName('a-name')
  PageLoaderElement multipleFinder;
}

class PageForFilterWithoutFinderTest {
  @IsTag('a-name')
  PageLoaderElement filterWithoutFinder;
}

class PageForInvalidConstructorTest {
  PageForInvalidConstructorTest(String someArg);

  @ById('div')
  @disableDisplayedCheck
  List<PageLoaderElement> shouldHaveOneElement;
}

class PageForStaticFieldsTest extends PageForSimpleTest {
  @ByTagName("table")
  static PageLoaderElement dontSet;
}

class PageForStaticSettersTest extends PageForSimpleTest {
  static var _dontSet;

  @ByTagName("table")
  static set dontSet(PageLoaderElement el) {
    _dontSet = el;
  }

  static get dontSet => _dontSet;
}
