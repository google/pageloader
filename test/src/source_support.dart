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

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/file_system/memory_file_system.dart';
import 'package:analyzer/src/test_utilities/mock_sdk.dart';
import 'package:path/path.dart' as pather;

import '../mocks/annotation_interfaces.dart';
import '../mocks/annotations.dart';

/// Declare pageloader annotated method.
///
/// [preamble] should be used for custom annotations.
Future<MethodDeclaration> getMethodDeclaration(
    String methodDeclaration, String methodName,
    {String preamble = ''}) async {
  final classToParse = '''
import 'annotations.dart';
import 'annotation_interfaces.dart';

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
    if (node.name.name == _methodName) {
      _method = node;
    }
  }
}

/// Analyzer Driver for scanning elements/asts on memory-based files.
class TestDriver {
  AnalysisContextCollection collection;

  /// Root path on all scoped files.
  final String root = '/test/root/path';

  final MemoryResourceProvider resourceProvider = MemoryResourceProvider();

  TestDriver() {
    MockSdk(resourceProvider: resourceProvider);
    collection = AnalysisContextCollection(
      resourceProvider: resourceProvider,
      sdkPath: sdkRoot,
      includedPaths: [root],
    );

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
    var session = collection.contextFor(root).currentSession;
    var result = await session.getResolvedUnit2(pather.join(root, path));
    return (result as ResolvedUnitResult).unit;
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
    resourceProvider.newFile(absPath, content);
  }
}
