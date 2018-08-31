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

import 'package:analyzer/analyzer.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/file_system/file_system.dart';
import 'package:analyzer/file_system/memory_file_system.dart';
import 'package:analyzer/src/dart/analysis/byte_store.dart';
import 'package:analyzer/src/dart/analysis/driver.dart';
import 'package:analyzer/src/dart/analysis/file_state.dart';
import 'package:analyzer/src/dart/analysis/performance_logger.dart';
import 'package:analyzer/src/generated/engine.dart';
import 'package:analyzer/src/generated/resolver.dart';
import 'package:analyzer/src/generated/source.dart';
import 'package:path/path.dart' as pather;

import '../mocks/annotation_interfaces.dart';
import '../mocks/annotations.dart';
import '../mocks/sdk.dart';

/// Declare pageloader annotated method.
///
/// [preamble] should be used for custom annotations.
Future<MethodDeclaration> getMethodDeclaration(
    String methodDeclaration, String methodName,
    {String preamble: ''}) async {
  final classToParse = '''
import 'dart:async';
import '/test/root/path/annotations.dart';
import '/test/root/path/annotation_interfaces.dart';

$preamble

class _SomePageObject_ { $methodDeclaration }

@CheckTag('demo-checked')
class DemoCheckedPO {}
''';
  final driver = TestDriver();
  final unit = await driver.resultForFile('test_mock.dart', classToParse);
  final finder = MethodFinder(methodName);
  unit.accept(finder);

  return finder.method;
}

class MethodFinder extends GeneralizingAstVisitor<void> {
  final String _methodName;
  MethodDeclaration _method;

  MethodDeclaration get method => _method;

  MethodFinder(this._methodName);

  @override
  void visitMethodDeclaration(MethodDeclaration node) {
    if (node.name.toSource() == _methodName) {
      _method = node;
    }
  }
}

/// Analyzer Driver for scanning elements/asts on memory-based files.
class TestDriver {
  CompilationUnit _compilationUnit;
  CompilationUnitElement compilationUnitElement;
  AnalysisDriver driver;
  AnalysisSession session;

  /// Root path on all scoped files.
  final String root = '/test/root/path';

  final ResourceProvider resourceProvider = MemoryResourceProvider();

  CompilationUnit get compilationUnit => _compilationUnit;

  Future<TypeProvider> get typeProvider => session.typeProvider;

  TestDriver() {
    final byteStore = MemoryByteStore();
    final sdk = MockSdk(resourceProvider: resourceProvider);
    final resolvers = [
      DartUriResolver(sdk),
      ResourceUriResolver(resourceProvider),
    ];

    final logger = PerformanceLog(StringBuffer());
    final scheduler = AnalysisDriverScheduler(logger)..start();
    final allResolvers = <UriResolver>[DartUriResolver(sdk)]..addAll(resolvers);
    final sourceFactory = SourceFactory(allResolvers);

    driver = AnalysisDriver(
      scheduler,
      logger,
      resourceProvider,
      byteStore,
      FileContentOverlay(),
      null, // ContextRoot
      sourceFactory,
      AnalysisOptionsImpl()..strongMode = true,
    );
    session = driver.currentSession;

    loadSources();
  }

  /// Load mock annotations.
  void loadSources() {
    newSource('annotation_interfaces.dart', mockAnnotationInterfaces);
    newSource('annotations.dart', mockAnnotations);
  }

  /// Loads given file and file contents. Analyzes then returns its
  /// CompilationUnit.
  Future<CompilationUnit> resultForFile(String path, String contents) async {
    newSource(path, contents);
    session = driver.currentSession;
    return (await session.getResolvedAst(pather.join(root, path))).unit;
  }

  /// Adds a new source and contents to the driver's scope.
  void newSource(String path, [String content = '']) {
    if (path.startsWith('/')) {
      throw 'Added file path must be relative.';
    }
    if (!path.endsWith('.dart')) {
      throw 'Added file must be .dart file.';
    }
    final absPath = pather.join(root, path);
    (resourceProvider as MemoryResourceProvider).newFile(absPath, content);
    driver.addFile(pather.join(root, path));
  }
}
