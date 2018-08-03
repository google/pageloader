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

const mockAnnotations = '''
library pageloader.annotations;

import '/test/root/path/annotation_interfaces.dart';

const root = _Root();

class _Root {
  const _Root();

  @override
  String toString() => '@root';
}

const Mouse = _Mouse();

class _Mouse {
  const _Mouse();

  @override
  String toString() => '@Mouse';
}

class CheckTag implements Checker {
  final String _expectedTagName;
  
  const CheckTag(this._expectedTagName);
  
  @override
  String toString() => '@CheckTag("\$_expectedTagName")';
}

class ByCheckTag implements Finder {
  const ByCheckTag();
}

class ByTagName implements CssFinder {
  final String _tagName;

  const ByTagName(this._tagName);

  @override
  String get cssSelector => _tagName;

  @override
  String toString() => '@ByTagName("\$_tagName")';
}

class WithAttribute extends Filter {
  final String name;
  final String value;

  const WithAttribute(this.name, this.value);

  @override
  String toString() => '@WithAttribute("\$name", "\$value")';
}
''';
