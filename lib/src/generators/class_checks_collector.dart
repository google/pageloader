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

import 'methods/core.dart' as core;

/// Identifies and generates class-level [Checker] declarations.

String _generateCheck(Annotation annotation) {
  if (annotation.arguments == null) throw 'bad';
  return '${annotation.name.toString()}'
      '(${annotation.arguments!.arguments.join(', ')})';
}

/// Generates a comma separated list of class check declarations for the given
/// [ClassDeclaration].
String generateClassChecks(ClassDeclaration declaration) {
  final checkList = <String>[];
  for (final annotation in declaration.metadata) {
    if (core.isPageloaderChecker(annotation)) {
      checkList.add(_generateCheck(annotation));
    }
  }
  return checkList.join(', ');
}
