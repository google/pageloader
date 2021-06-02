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

library pageloader.page_object;

/// This annotation is required by the pageloader generator.

/// Class level annotation, present on all page objects. If this is not present
/// no generation will take place.
/// The optional [code] parameter is used in the generated [findChain()] method,
/// which helps WebDriver Test Creator to generate proper code without walking
/// down the tree further.
/// If that is not provided, it will go as deep as it can
/// and append the corresponding code from [defaultCode] based on [action].
class PageObject {
  static const defaultCode = {
    'default': '',
    'value': 'innerText',
    'click': 'click',
    'type': 'type'
  };

  /// Code to generate in representation of page object and any element inside.
  /// Used by WebDriver Test Creator (go/webdriver-test-creator).
  ///
  /// The key can be an action, like 'click', 'value' or 'type', or it can be
  /// any code that may be generated without the config.
  /// The first case means it should generate that piece of code instead of
  /// inspecting any further for the given action.
  /// The second case is more powerful, it will find the chain as usual,
  /// and the generated code will be replaced accordingly.
  ///
  /// One example for case 1, typing in a [MaterialInputPO] named [moneyInput]
  /// should produce [await moneyInput.type()] (or
  /// [await moneyInput.clearAndType()]) instead of
  /// [await moneyInput.input.type()] etc. So it should have something like
  /// [@PageObject(code: {'type': 'clearAndType'})]
  ///
  /// One example for case 2, clicking on the submit and cancel button on a
  /// dialog, if the buttons themselves are hidden. So the default code would be
  /// like [await dialog._submit.click()], but it should be
  /// [await dialog.submit()]. So it can be specified as
  ///
  /// @PageObject(code: {
  ///     '_submit.click': 'submit',
  ///     '_cancel.click': 'cancel'
  /// })
  final Map<String?, String?>? code;

  const PageObject({this.code});

  @override
  String toString() => '@PageObject(code: $code)';
}
