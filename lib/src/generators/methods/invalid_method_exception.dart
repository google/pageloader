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

/// Thrown when a method defined in a page object is invalid in some way.
class InvalidMethodException implements Exception {
  final String _message;
  final String _methodSource;

  InvalidMethodException(this._methodSource, this._message);

  String get message => _message;
  String get methodSource => _methodSource;
}
