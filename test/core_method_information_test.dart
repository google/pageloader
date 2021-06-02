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

import 'package:pageloader/src/generators/methods/core_method_information.dart';
import 'package:test/test.dart';

import 'src/source_support.dart' as support;

void main() {
  group('core method information extractor works for', () {
    test('normal, non-PL3 methods', () async {
      final method = await support.getMethodDeclaration(
          'String myMethod() {}', 'myMethod');
      final info = collectCoreMethodInformation(method);

      expect(info.name, 'myMethod');
      expect(info.isGetter, false);
      expect(info.isAbstract, false);
      expect(info.pageObjectType, 'String');
      expect(info.pageObjectTemplate.isPresent, false);
      expect(info.isRoot, false);
      expect(info.isNullElement, false);
      expect(info.isFuture, false);
      expect(info.isList, false);
      expect(info.finder.isPresent, false);
      expect(info.filters, isEmpty);
      expect(info.checkers, isEmpty);
    });

    test('single finder', () async {
      final method = await support.getMethodDeclaration(
          '@ByTagName("myid") PageObject get myMethod;', 'myMethod');
      final info = collectCoreMethodInformation(method);

      expect(info.name, 'myMethod');
      expect(info.isGetter, true);
      expect(info.isAbstract, true);
      expect(info.pageObjectType, 'PageObject');
      expect(info.pageObjectTemplate.isPresent, false);
      expect(info.isRoot, false);
      expect(info.isNullElement, false);
      expect(info.isFuture, false);
      expect(info.isList, false);
      expect(info.finder.isPresent, true);
      expect(info.finder.value, 'ByTagName("myid")');
      expect(info.filters, isEmpty);
      expect(info.checkers, isEmpty);
    });

    test('single finder with checkers', () async {
      final method = await support.getMethodDeclaration(
          '@ByTagName("myid") @CheckTag("myid") PageObject get myMethod;',
          'myMethod');
      final info = collectCoreMethodInformation(method);

      expect(info.name, 'myMethod');
      expect(info.isGetter, true);
      expect(info.isAbstract, true);
      expect(info.pageObjectType, 'PageObject');
      expect(info.pageObjectTemplate.isPresent, false);
      expect(info.isRoot, false);
      expect(info.isNullElement, false);
      expect(info.isFuture, false);
      expect(info.isList, false);
      expect(info.finder.isPresent, true);
      expect(info.finder.value, 'ByTagName("myid")');
      expect(info.filters, isEmpty);
      expect(info.checkers, hasLength(1));
    });

    test('single finder with filter', () async {
      final method = await support.getMethodDeclaration(
          '@ByTagName("myid") @WithAttribute("att") PageObject get myMethod;',
          'myMethod');
      final info = collectCoreMethodInformation(method);

      expect(info.name, 'myMethod');
      expect(info.isGetter, true);
      expect(info.isAbstract, true);
      expect(info.pageObjectType, 'PageObject');
      expect(info.pageObjectTemplate.isPresent, false);
      expect(info.isRoot, false);
      expect(info.isNullElement, false);
      expect(info.isFuture, false);
      expect(info.isList, false);
      expect(info.finder.isPresent, true);
      expect(info.finder.value, 'ByTagName("myid")');
      expect(info.filters, hasLength(1));
      expect(info.checkers, isEmpty);
    });

    test('single future', () async {
      final method = await support.getMethodDeclaration(
          '@ByTagName("myid") Future<PageObject> get myMethod;', 'myMethod');
      final info = collectCoreMethodInformation(method);

      expect(info.name, 'myMethod');
      expect(info.isGetter, true);
      expect(info.isAbstract, true);
      expect(info.pageObjectType, 'PageObject');
      expect(info.pageObjectTemplate.isPresent, false);
      expect(info.isRoot, false);
      expect(info.isNullElement, false);
      expect(info.isFuture, true);
      expect(info.isList, false);
      expect(info.finder.isPresent, true);
      expect(info.finder.value, 'ByTagName("myid")');
      expect(info.filters, isEmpty);
      expect(info.checkers, isEmpty);
    });

    test('future list', () async {
      final method = await support.getMethodDeclaration(
          '@ByTagName("myid") Future<List<PageObject>> get myMethod;',
          'myMethod');
      final info = collectCoreMethodInformation(method);

      expect(info.name, 'myMethod');
      expect(info.isGetter, true);
      expect(info.isAbstract, true);
      expect(info.pageObjectType, 'PageObject');
      expect(info.pageObjectTemplate.isPresent, false);
      expect(info.isRoot, false);
      expect(info.isNullElement, false);
      expect(info.isFuture, true);
      expect(info.isList, true);
      expect(info.finder.isPresent, true);
      expect(info.finder.value, 'ByTagName("myid")');
      expect(info.filters, isEmpty);
      expect(info.checkers, isEmpty);
    });

    test('list', () async {
      final method = await support.getMethodDeclaration(
          '@ByTagName("myid") List<PageObject> get myMethod;', 'myMethod');
      final info = collectCoreMethodInformation(method);

      expect(info.name, 'myMethod');
      expect(info.isGetter, true);
      expect(info.isAbstract, true);
      expect(info.pageObjectType, 'PageObject');
      expect(info.pageObjectTemplate.isPresent, false);
      expect(info.isRoot, false);
      expect(info.isNullElement, false);
      expect(info.isFuture, false);
      expect(info.isList, true);
      expect(info.finder.isPresent, true);
      expect(info.finder.value, 'ByTagName("myid")');
      expect(info.filters, isEmpty);
      expect(info.checkers, isEmpty);
    });

    test('root', () async {
      final method = await support.getMethodDeclaration(
          '@root PageObject get myMethod;', 'myMethod');
      final info = collectCoreMethodInformation(method);

      expect(info.name, 'myMethod');
      expect(info.isGetter, true);
      expect(info.isAbstract, true);
      expect(info.pageObjectType, 'PageObject');
      expect(info.pageObjectTemplate.isPresent, false);
      expect(info.isRoot, true);
      expect(info.isNullElement, false);
      expect(info.isFuture, false);
      expect(info.isList, false);
      expect(info.finder.isPresent, false);
      expect(info.filters, isEmpty);
      expect(info.checkers, isEmpty);
    });

    test('nullElement', () async {
      final method = await support.getMethodDeclaration(
          '@nullElement PageObject get nullMethod;', 'nullMethod');
      final info = collectCoreMethodInformation(method);

      expect(info.name, 'nullMethod');
      expect(info.isGetter, true);
      expect(info.isAbstract, true);
      expect(info.pageObjectType, 'PageObject');
      expect(info.pageObjectTemplate.isPresent, false);
      expect(info.isRoot, false);
      expect(info.isNullElement, true);
      expect(info.isFuture, false);
      expect(info.isList, false);
      expect(info.finder.isPresent, false);
      expect(info.filters, isEmpty);
      expect(info.checkers, isEmpty);
    });

    test('generic objects', () async {
      final method = await support.getMethodDeclaration(
          '@root Generic<PageObject> get myMethod;', 'myMethod');
      final info = collectCoreMethodInformation(method);

      expect(info.name, 'myMethod');
      expect(info.isGetter, true);
      expect(info.isAbstract, true);
      expect(info.pageObjectType, 'Generic');
      expect(info.pageObjectTemplate.isPresent, true);
      expect(info.pageObjectTemplate.value, 'PageObject');
      expect(info.isRoot, true);
      expect(info.isNullElement, false);
      expect(info.isFuture, false);
      expect(info.isList, false);
      expect(info.finder.isPresent, false);
      expect(info.filters, isEmpty);
      expect(info.checkers, isEmpty);
    });

    test('future generic objects', () async {
      final method = await support.getMethodDeclaration(
          '@root Future<Generic<PageObject>> get myMethod;', 'myMethod');
      final info = collectCoreMethodInformation(method);

      expect(info.name, 'myMethod');
      expect(info.isGetter, true);
      expect(info.isAbstract, true);
      expect(info.pageObjectType, 'Generic');
      expect(info.pageObjectTemplate.isPresent, true);
      expect(info.pageObjectTemplate.value, 'PageObject');
      expect(info.isRoot, true);
      expect(info.isNullElement, false);
      expect(info.isFuture, true);
      expect(info.isList, false);
      expect(info.finder.isPresent, false);
      expect(info.filters, isEmpty);
      expect(info.checkers, isEmpty);
    });
  });

  group('core method information extractor works for custom annotations', () {
    final cssFinderPreamble = '''
class MyAnnotation implements CssFinder {
  final String _tagName;
  
  const MyAnnotation(this._tagName);
  
  @override
  String get cssSelector => _tagName;
  
  @override
  String toString() => '@MyAnnotation("\$_tagName")';
}
''';
    test('single finder', () async {
      final method = await support.getMethodDeclaration(
          '@MyAnnotation("myid") PageObject get myMethod;', 'myMethod',
          preamble: cssFinderPreamble);
      final info = collectCoreMethodInformation(method);

      expect(info.name, 'myMethod');
      expect(info.isGetter, true);
      expect(info.isAbstract, true);
      expect(info.pageObjectType, 'PageObject');
      expect(info.pageObjectTemplate.isPresent, false);
      expect(info.isRoot, false);
      expect(info.isNullElement, false);
      expect(info.isFuture, false);
      expect(info.isList, false);
      expect(info.finder.isPresent, true);
      expect(info.finder.value, 'MyAnnotation("myid")');
      expect(info.filters, isEmpty);
      expect(info.checkers, isEmpty);
    });

    test('single finder with checkers', () async {
      final preamble = '''
class MyAnnotation implements CssFinder, Checker {
  final String _tagName;
  
  const MyAnnotation(this._tagName); 
  
  @override
  String get cssSelector => _tagName;
 
  @override
  bool check(PageLoaderElement element) => element.name == _tagName;
  
  @override
  String toString() => '@MyAnnotation("\$_tagName")';
}
''';
      final method = await support.getMethodDeclaration(
          '@MyAnnotation("myid") PageObject get myMethod;', 'myMethod',
          preamble: preamble);
      final info = collectCoreMethodInformation(method);

      expect(info.name, 'myMethod');
      expect(info.isGetter, true);
      expect(info.isAbstract, true);
      expect(info.pageObjectType, 'PageObject');
      expect(info.pageObjectTemplate.isPresent, false);
      expect(info.isRoot, false);
      expect(info.isNullElement, false);
      expect(info.isFuture, false);
      expect(info.isList, false);
      expect(info.finder.isPresent, true);
      expect(info.finder.value, 'MyAnnotation("myid")');
      expect(info.filters, isEmpty);
      expect(info.checkers, hasLength(1));
    });

    test('single finder with filter', () async {
      final preamble = '''
class MyAnnotation implements CssFinder, Filter {
  final String _tagName;
  final String name;
  final String value;
  
  const MyAnnotation(this._tagName, this.name, this.value);
  
  @override
  String get cssSelector => _tagName;
  
  @override
  bool keep(PageLoaderElement element) => element.attributes[name] == value;
 
  @override
  bool check(PageLoaderElement element) => element.name == _tagName;
  
  @override
  String toString() => '@MyAnnotation("\$_tagName", "\$name", "\$value")';
}
''';
      final method = await support.getMethodDeclaration(
          '@MyAnnotation("myid", "att", "") PageObject get myMethod;',
          'myMethod',
          preamble: preamble);
      final info = collectCoreMethodInformation(method);

      expect(info.name, 'myMethod');
      expect(info.isGetter, true);
      expect(info.isAbstract, true);
      expect(info.pageObjectType, 'PageObject');
      expect(info.pageObjectTemplate.isPresent, false);
      expect(info.isRoot, false);
      expect(info.isNullElement, false);
      expect(info.isFuture, false);
      expect(info.isList, false);
      expect(info.finder.isPresent, true);
      expect(info.finder.value, 'MyAnnotation("myid", "att", "")');
      expect(info.filters, hasLength(1));
      expect(info.checkers, isEmpty);
    });

    test('single future', () async {
      final method = await support.getMethodDeclaration(
          '@MyAnnotation("myid") Future<PageObject> get myMethod;', 'myMethod',
          preamble: cssFinderPreamble);
      final info = collectCoreMethodInformation(method);

      expect(info.name, 'myMethod');
      expect(info.isGetter, true);
      expect(info.isAbstract, true);
      expect(info.pageObjectType, 'PageObject');
      expect(info.pageObjectTemplate.isPresent, false);
      expect(info.isRoot, false);
      expect(info.isNullElement, false);
      expect(info.isFuture, true);
      expect(info.isList, false);
      expect(info.finder.isPresent, true);
      expect(info.finder.value, 'MyAnnotation("myid")');
      expect(info.filters, isEmpty);
      expect(info.checkers, isEmpty);
    });

    test('future list', () async {
      final method = await support.getMethodDeclaration(
          '@MyAnnotation("myid") Future<List<PageObject>> get myMethod;',
          'myMethod',
          preamble: cssFinderPreamble);
      final info = collectCoreMethodInformation(method);

      expect(info.name, 'myMethod');
      expect(info.isGetter, true);
      expect(info.isAbstract, true);
      expect(info.pageObjectType, 'PageObject');
      expect(info.pageObjectTemplate.isPresent, false);
      expect(info.isRoot, false);
      expect(info.isNullElement, false);
      expect(info.isFuture, true);
      expect(info.isList, true);
      expect(info.finder.isPresent, true);
      expect(info.finder.value, 'MyAnnotation("myid")');
      expect(info.filters, isEmpty);
      expect(info.checkers, isEmpty);
    });

    test('list', () async {
      final method = await support.getMethodDeclaration(
          '@MyAnnotation("myid") List<PageObject> get myMethod;', 'myMethod',
          preamble: cssFinderPreamble);
      final info = collectCoreMethodInformation(method);

      expect(info.name, 'myMethod');
      expect(info.isGetter, true);
      expect(info.isAbstract, true);
      expect(info.pageObjectType, 'PageObject');
      expect(info.pageObjectTemplate.isPresent, false);
      expect(info.isRoot, false);
      expect(info.isNullElement, false);
      expect(info.isFuture, false);
      expect(info.isList, true);
      expect(info.finder.isPresent, true);
      expect(info.finder.value, 'MyAnnotation("myid")');
      expect(info.filters, isEmpty);
      expect(info.checkers, isEmpty);
    });
  });
}
