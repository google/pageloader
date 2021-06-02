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

library pageloader.invalid_method_exception;

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';

/// Thrown when a method defined in a page object is invalid in some way.
class InvalidMethodException implements Exception {
  final String _message;
  final AstNode? _methodNode;

  InvalidMethodException(this._methodNode, this._message);

  String get message => _message;
  String get methodSource => _nodeMessage(_methodNode!);

  /// Generates a detailed message on the [node] throwing the error
  /// that includes file and location.
  String _nodeMessage(AstNode node) {
    final compUnitElement = _getCompilationUnitElement(node)!;
    final uri = compUnitElement.source.uri;

    final exactLineInfo = compUnitElement.lineInfo!.getLocation(node.offset);
    return '$uri $exactLineInfo\t\t ${node.toSource()}';
  }

  /// Returns the [CompilationUnitElement] of [node].
  CompilationUnitElement? _getCompilationUnitElement(AstNode node) {
    AstNode? _node = node;
    while (_node is! CompilationUnit) {
      _node = _node!.parent;
    }
    return _node.declaredElement;
  }
}
