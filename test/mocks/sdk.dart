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

import 'package:analyzer/file_system/file_system.dart' as resource;
import 'package:analyzer/file_system/memory_file_system.dart' as resource;
import 'package:analyzer/src/context/cache.dart';
import 'package:analyzer/src/context/context.dart';
import 'package:analyzer/src/generated/engine.dart' show AnalysisEngine;
import 'package:analyzer/src/generated/sdk.dart';
import 'package:analyzer/src/generated/source.dart';
import 'package:analyzer/src/summary/idl.dart' show PackageBundle;
import 'package:analyzer/src/summary/summary_file_builder.dart';

const String librariesContent = r'''
const Map<String, LibraryInfo> libraries = {
  "async": LibraryInfo("async/async.dart"),
  "collection": LibraryInfo("collection/collection.dart"),
  "convert": LibraryInfo("convert/convert.dart"),
  "core": LibraryInfo("core/core.dart"),
  "html": LibraryInfo(
    "html/dartium/html_dartium.dart",
    dart2jsPath: "html/dart2js/html_dart2js.dart"),
  "math": LibraryInfo("math/math.dart"),
  "_foreign_helper": LibraryInfo("_internal/js_runtime/lib/foreign_helper.dart"),
};
''';

const String sdkRoot = '/sdk';

const _MockSdkLibrary _LIB_ASYNC =
    _MockSdkLibrary('dart:async', '$sdkRoot/lib/async/async.dart', '''
library dart.async;

import 'dart:math';

part 'stream.dart';

class Future<T> {
  factory Future(computation()) => null;
  factory Future.delayed(Duration duration, [T computation()]) => null;
  factory Future.value([FutureOr<T> result]) => null;

  static Future<List<T>> wait<T>(
      Iterable<Future<T>> futures) => null;
  Future<R> then<R>(FutureOr<R> onValue(T value)) => null;

  Future<T> whenComplete(action());
}

class FutureOr<T> {}

abstract class Completer<T> {
  factory Completer() => null;
  factory Completer.sync() => null;
  Future<T> get future;
  void complete([value]);
  void completeError(Object error, [StackTrace stackTrace]);
  bool get isCompleted;
}
''', <String, String>{
  '$sdkRoot/lib/async/stream.dart': r'''
part of dart.async;
abstract class Stream<T> {
  Future<T> get first;
  StreamSubscription<T> listen(void onData(T event),
                               { Function onError,
                                 void onDone(),
                                 bool cancelOnError});
  Stream();
  factory Stream.fromIterable(Iterable<T> data);
}

abstract class StreamSubscription<T> {
  Future cancel();
  void onData(void handleData(T data));
  void onError(Function handleError);
  void onDone(void handleDone());
  void pause([Future resumeSignal]);
  void resume();
  bool get isPaused;
  Future<E> asFuture<E>([E futureValue]);
}

abstract class StreamTransformer<S, T> {}
'''
});

const _MockSdkLibrary _LIB_COLLECTION = _MockSdkLibrary(
    'dart:collection', '$sdkRoot/lib/collection/collection.dart', '''
library dart.collection;

abstract class HashMap<K, V> implements Map<K, V> {}
''');

const _MockSdkLibrary _LIB_CONVERT =
    _MockSdkLibrary('dart:convert', '$sdkRoot/lib/convert/convert.dart', '''
library dart.convert;

import 'dart:async';

abstract class Converter<S, T> implements StreamTransformer {}
class JsonDecoder extends Converter<String, Object> {}
''');

const _MockSdkLibrary _LIB_CORE =
    _MockSdkLibrary('dart:core', '$sdkRoot/lib/core/core.dart', '''
library dart.core;

import 'dart:async';

class Object {
  const Object();
  bool operator ==(other) => identical(this, other);
  String toString() => 'a string';
  int get hashCode => 0;
  Type get runtimeType => null;
  dynamic noSuchMethod(Invocation invocation) => null;
}

class Function {}
class StackTrace {}

class Symbol {
  const factory Symbol(String name) {
    return null;
  }
}

class Type {}

abstract class Comparable<T> {
  int compareTo(T other);
}

abstract class Pattern {}
abstract class String implements Comparable<String>, Pattern {
  external factory String.fromCharCodes(Iterable<int> charCodes,
                                        [int start = 0, int end]);
  String operator +(String other) => null;
  bool get isEmpty => false;
  bool get isNotEmpty => false;
  int get length => 0;
  String substring(int len) => null;
  String toLowerCase();
  String toUpperCase();
  List<int> get codeUnits;
}
abstract class RegExp implements Pattern {
  external factory RegExp(String source);
}

class bool extends Object {
  external const factory bool.fromEnvironment(String name,
                                              {bool defaultValue: false});
}

abstract class Uri {
  factory Uri(
      {String scheme,
      String userInfo,
      String host,
      int port,
      String path,
      Iterable<String> pathSegments,
      String query,
      Map<String, dynamic /*String|Iterable<String>*/ > queryParameters,
      String fragment}) = _Uri;
      
  Uri replace(
    {String scheme,
    String userInfo,
    String host,
    int port,
    String path,
    Iterable<String> pathSegments,
    String query,
    Map<String, dynamic /*String|Iterable<String>*/ > queryParameters,
    String fragment});
}

class _Uri implements Uri {
  factory _Uri(
      {String scheme,
      String userInfo,
      String host,
      int port,
      String path,
      Iterable<String> pathSegments,
      String query,
      Map<String, dynamic /*String|Iterable<String>*/ > queryParameters,
      String fragment}) {}
      
  Uri replace(
      {String scheme,
      String userInfo,
      String host,
      int port,
      String path,
      Iterable<String> pathSegments,
      String query,
      Map<String, dynamic /*String|Iterable<String>*/ > queryParameters,
      String fragment}) {}
}


abstract class Invocation {}

abstract class num implements Comparable<num> {
  bool operator ==(Object other);
  bool operator <(num other);
  bool operator <=(num other);
  bool operator >(num other);
  bool operator >=(num other);
  num operator +(num other);
  num operator -(num other);
  num operator *(num other);
  double operator /(num other);
  int operator ^(int other);
  int operator |(int other);
  int operator <<(int other);
  int operator >>(int other);
  int operator ~/(num other);
  num operator %(num other);
  int operator ~();
  num operator -();
  int toInt();
  double toDouble();
  num abs();
  int round();
}
abstract class int extends num {
  external const factory int.fromEnvironment(String name, {int defaultValue});

  bool get isNegative;
  bool get isEven => false;

  int operator &(int other);
  int operator |(int other);
  int operator ^(int other);
  int operator ~();
  int operator <<(int shiftAmount);
  int operator >>(int shiftAmount);

  int operator -();

  external static int parse(String source,
                            { int radix,
                              int onError(String source) });

  String toString();
}

abstract class double extends num {
  static const double NAN = 0.0 / 0.0;
  static const double INFINITY = 1.0 / 0.0;
  static const double NEGATIVE_INFINITY = -INFINITY;
  static const double MIN_POSITIVE = 5e-324;
  static const double MAX_FINITE = 1.7976931348623157e+308;

  double remainder(num other);
  double operator +(num other);
  double operator -(num other);
  double operator *(num other);
  double operator %(num other);
  double operator /(num other);
  int operator ~/(num other);
  double operator -();
  double abs();
  double get sign;
  int round();
  int floor();
  int ceil();
  int truncate();
  double roundToDouble();
  double floorToDouble();
  double ceilToDouble();
  double truncateToDouble();
  external static double parse(String source,
                               [double onError(String source)]);
}

class DateTime extends Object {}

class Null extends Object {
  factory Null._uninstantiable() => null;
}

class Deprecated extends Object {
  final String expires;
  const Deprecated(this.expires);
}
const Object deprecated = Deprecated("next release");

class Iterator<E> {
  bool moveNext();
  E get current;
}

abstract class Iterable<E> {
  Iterator<E> get iterator;
  bool get isEmpty;
  E get first;

  Iterable<R> map<R>(R f(E e));

  R fold<R>(R initialValue,
      R combine(R previousValue, E element)) => null;

  Iterable<T> expand<T>(Iterable<T> f(E element));

  Iterable<E> where(bool test(E element));

  void forEach(void f(E element));

  List<E> toList();
}

class List<E> implements Iterable<E> {
  List();
  void add(E value) {}
  void addAll(Iterable<E> iterable) {}
  E operator [](int index) => null;
  void operator []=(int index, E value) {}
  Iterator<E> get iterator => null;
  void clear() {}

  bool get isEmpty => false;
  E get first => null;
  E get last => null;

}

class Map<K, V> extends Object {
  V operator [](K key) => null;
  void operator []=(K key, V value) {}
  Iterable<K> get keys => null;
  int get length;
  Iterable<V> get values;
}

class Duration implements Comparable<Duration> {}

external bool identical(Object a, Object b);

void print(Object object) {}

class _Proxy { const _Proxy(); }
const Object proxy = _Proxy();

class _Override { const _Override(); }
const Object override = _Override();

class _CompileTimeError {
  final String _errorMsg;
  _CompileTimeError(this._errorMsg);
}

class _ConstantExpressionError {
  const _ConstantExpressionError();
}
''');

const _MockSdkLibrary _LIB_FOREIGN_HELPER = _MockSdkLibrary(
    'dart:_foreign_helper',
    '$sdkRoot/lib/_foreign_helper/_foreign_helper.dart', '''
library dart._foreign_helper;

JS(String typeDescription, String codeTemplate,
  [arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11])
{}
''');

const _MockSdkLibrary _LIB_HTML_DART2JS = _MockSdkLibrary(
    'dart:html', '$sdkRoot/lib/html/dart2js/html_dart2js.dart', '''
library dart.html;
class HtmlElement {}
''');

const _MockSdkLibrary _LIB_HTML_DARTIUM = _MockSdkLibrary(
    'dart:html', '$sdkRoot/lib/html/dartium/html_dartium.dart', '''
library dart.dom.html;

final HtmlDocument document;

abstract class Element {}

abstract class HtmlDocument {
  Element query(String relativeSelectors) => null;
}

abstract class HtmlElement extends Element {}

abstract class AnchorElement extends HtmlElement {}
abstract class BodyElement extends HtmlElement {}
abstract class ButtonElement extends HtmlElement {}
abstract class DivElement extends HtmlElement {}
abstract class InputElement extends HtmlElement {}
abstract class SelectElement extends HtmlElement {}


abstract class CanvasElement extends HtmlElement {
  Object getContext(String contextId, [Map attributes]);
  CanvasRenderingContext2D get context2D;
}

abstract class class CanvasRenderingContext2D {}

Element query(String relativeSelectors) => null;
''');

const _MockSdkLibrary _LIB_INTERCEPTORS = _MockSdkLibrary('dart:_interceptors',
    '$sdkRoot/lib/_internal/js_runtime/lib/interceptors.dart', '''
library dart._interceptors;
''');

const _MockSdkLibrary _LIB_MATH =
    _MockSdkLibrary('dart:math', '$sdkRoot/lib/math/math.dart', '''
library dart.math;

const double E = 2.718281828459045;
const double PI = 3.1415926535897932;
const double LN10 =  2.302585092994046;

T min<T extends num>(T a, T b) => null;
T max<T extends num>(T a, T b) => null;

external double cos(num radians);
external double sin(num radians);
external double sqrt(num radians);
class Random {
  bool nextBool() => true;
  double nextDouble() => 2.0;
  int nextInt() => 1;
}
''');

const List<SdkLibrary> _LIBRARIES = [
  _LIB_CORE,
  _LIB_ASYNC,
  _LIB_COLLECTION,
  _LIB_CONVERT,
  _LIB_FOREIGN_HELPER,
  _LIB_MATH,
  _LIB_HTML_DART2JS,
  _LIB_HTML_DARTIUM,
  _LIB_INTERCEPTORS,
];

class MockSdk implements DartSdk {
  static const Map<String, String> FULL_URI_MAP = {
    "dart:core": "$sdkRoot/lib/core/core.dart",
    "dart:html": "$sdkRoot/lib/html/dartium/html_dartium.dart",
    "dart:async": "$sdkRoot/lib/async/async.dart",
    "dart:async/stream.dart": "$sdkRoot/lib/async/stream.dart",
    "dart:collection": "$sdkRoot/lib/collection/collection.dart",
    "dart:convert": "$sdkRoot/lib/convert/convert.dart",
    "dart:_foreign_helper": "$sdkRoot/lib/_foreign_helper/_foreign_helper.dart",
    "dart:_interceptors":
        "$sdkRoot/lib/_internal/js_runtime/lib/interceptors.dart",
    "dart:math": "$sdkRoot/lib/math/math.dart"
  };

  static const Map<String, String> NO_ASYNC_URI_MAP = {
    "dart:core": "$sdkRoot/lib/core/core.dart",
  };

  final resource.MemoryResourceProvider provider;

  final Map<String, String> uriMap;

  /// The [AnalysisContextImpl] which is used for all of the sources.
  AnalysisContextImpl _analysisContext;

  @override
  final List<SdkLibrary> sdkLibraries;

  /// The cached linked bundle of the SDK.
  PackageBundle _bundle;

  MockSdk(
      {bool generateSummaryFiles: false,
      bool dartAsync: true,
      resource.MemoryResourceProvider resourceProvider})
      : provider = resourceProvider ?? resource.MemoryResourceProvider(),
        sdkLibraries = dartAsync ? _LIBRARIES : [_LIB_CORE],
        uriMap = dartAsync ? FULL_URI_MAP : NO_ASYNC_URI_MAP {
    for (_MockSdkLibrary library in sdkLibraries) {
      provider.newFile(provider.convertPath(library.path), library.content);
      library.parts.forEach((String path, String content) {
        provider.newFile(provider.convertPath(path), content);
      });
    }
    provider.newFile(
        provider.convertPath(
            '$sdkRoot/lib/_internal/sdk_library_metadata/lib/libraries.dart'),
        librariesContent);
    if (generateSummaryFiles) {
      final bytes = _computeLinkedBundleBytes();
      provider.newFileWithBytes(
          provider.convertPath('/lib/_internal/spec.sum'), bytes);
      provider.newFileWithBytes(
          provider.convertPath('/lib/_internal/strong.sum'), bytes);
    }
  }

  @override
  AnalysisContextImpl get context {
    if (_analysisContext == null) {
      _analysisContext = _SdkAnalysisContext(this);
      final factory = SourceFactory([DartUriResolver(this)]);
      _analysisContext.sourceFactory = factory;
    }
    return _analysisContext;
  }

  @override
  String get sdkVersion => throw UnimplementedError();

  @override
  List<String> get uris =>
      sdkLibraries.map((SdkLibrary library) => library.shortName).toList();

  @override
  Source fromFileUri(Uri uri) {
    final filePath = provider.pathContext.fromUri(uri);
    if (!filePath.startsWith(provider.convertPath('$sdkRoot/lib/'))) {
      return null;
    }
    for (SdkLibrary library in sdkLibraries) {
      final libraryPath = provider.convertPath(library.path);
      if (filePath == libraryPath) {
        try {
          final file = provider.getResource(filePath) as resource.File;
          final dartUri = Uri.parse(library.shortName);
          return file.createSource(dartUri);
        } catch (exception) {
          return null;
        }
      }
      final libraryRootPath = provider.pathContext.dirname(libraryPath) +
          provider.pathContext.separator;
      if (filePath.startsWith(libraryRootPath)) {
        final pathInLibrary = filePath.substring(libraryRootPath.length);
        final uriStr = '${library.shortName}/$pathInLibrary';
        try {
          final file = provider.getResource(filePath) as resource.File;
          final dartUri = Uri.parse(uriStr);
          return file.createSource(dartUri);
        } catch (exception) {
          return null;
        }
      }
    }
    return null;
  }

  @override
  PackageBundle getLinkedBundle() {
    if (_bundle == null) {
      final summaryFile =
          provider.getFile(provider.convertPath('/lib/_internal/spec.sum'));
      List<int> bytes;
      if (summaryFile.exists) {
        bytes = summaryFile.readAsBytesSync();
      } else {
        bytes = _computeLinkedBundleBytes();
      }
      _bundle = PackageBundle.fromBuffer(bytes);
    }
    return _bundle;
  }

  @override
  SdkLibrary getSdkLibrary(String dartUri) {
    for (SdkLibrary library in _LIBRARIES) {
      if (library.shortName == dartUri) {
        return library;
      }
    }
    return null;
  }

  @override
  Source mapDartUri(String dartUri) {
    final path = uriMap[dartUri];
    if (path != null) {
      final file =
          provider.getResource(provider.convertPath(path)) as resource.File;
      final uri = Uri(scheme: 'dart', path: dartUri.substring('dart:'.length));
      return file.createSource(uri);
    }
    // If we reach here then we tried to use a dartUri that's not in the
    // table above.
    return null;
  }

  /// This method is used to apply patches to [MockSdk].  It may be called only
  /// before analysis, i.e. before the analysis context was created.
  void updateUriFile(String uri, String updateContent(String content)) {
    assert(_analysisContext == null);
    String path = FULL_URI_MAP[uri];
    assert(path != null);
    path = provider.convertPath(path);
    final content = provider.getFile(path).readAsStringSync();
    final newContent = updateContent(content);
    provider.updateFile(path, newContent);
  }

  /// Compute the bytes of the linked bundle associated with this SDK.
  List<int> _computeLinkedBundleBytes() {
    final librarySources = sdkLibraries
        .map((SdkLibrary library) => mapDartUri(library.shortName))
        .toList();
    return SummaryBuilder(librarySources, context).build();
  }
}

class _MockSdkLibrary implements SdkLibrary {
  @override
  final String shortName;

  @override
  final String path;

  final String content;
  final Map<String, String> parts;

  const _MockSdkLibrary(this.shortName, this.path, this.content,
      [this.parts = const <String, String>{}]);

  @override
  String get category => throw UnimplementedError();

  @override
  bool get isDart2JsLibrary => throw UnimplementedError();

  @override
  bool get isDocumented => throw UnimplementedError();

  @override
  bool get isImplementation => throw UnimplementedError();

  @override
  bool get isInternal => shortName.startsWith('dart:_');

  @override
  bool get isShared => throw UnimplementedError();

  @override
  bool get isVmLibrary => throw UnimplementedError();
}

/// An [AnalysisContextImpl] that only contains sources for a Dart SDK.
class _SdkAnalysisContext extends AnalysisContextImpl {
  final DartSdk sdk;

  _SdkAnalysisContext(this.sdk);

  @override
  AnalysisCache createCacheFromSourceFactory(SourceFactory factory) {
    if (factory == null) {
      return super.createCacheFromSourceFactory(factory);
    }
    return AnalysisCache(
        <CachePartition>[AnalysisEngine.instance.partitionManager.forSdk(sdk)]);
  }
}
