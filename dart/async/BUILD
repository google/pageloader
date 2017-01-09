# Copyright 2017 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

package(default_testonly = 1)

licenses(["notice"])  # Apache (Google-authored with external contributions)

load("@io_bazel_rules_dart//dart/build_rules:core.bzl", "dart_library")
load("@io_bazel_rules_webtesting//web:dart.bzl", "dart_web_test_suite")

dart_library(
    name = "pageloader",
    srcs = glob(["lib/**"]),
    license_files = ["//:LICENSE"],
    pub_pkg_name = "pageloader",
    visibility = ["//visibility:public"],
    deps = [
        "@com_github_google_webdriver_dart//:webdriver",
        "@org_dartlang_pub_stack_trace//:stack_trace",
    ],
)

dart_web_test_suite(
    name = "webdriver_no_shadow_dom_test",
    srcs = ["test/webdriver_no_shadow_dom_test.dart"],
    browsers = ["//browsers:chromium-native"],
    local = True,
    deps = [
        ":test",
        "@org_dartlang_pub_test//:test",
    ],
)

dart_web_test_suite(
    name = "webdriver_test",
    srcs = ["test/webdriver_test.dart"],
    browsers = ["//browsers:chromium-native"],
    local = True,
    deps = [
        ":test",
        "@org_dartlang_pub_test//:test",
    ],
)

dart_library(
    name = "test",
    testonly = 1,
    srcs = glob(
        [
            "test/src/*.dart",
            "test/data/*.dart",
            "test/setup/*.dart",
        ],
        exclude = ["test/**/html*"],
    ),
    data = glob(["test/data/*.html"]),
    deps = [
        ":pageloader",
        "@com_github_google_webdriver_dart//:webdriver",
        "@io_bazel_rules_webtesting//dart",
        "@org_dartlang_pub_path//:path",
        "@org_dartlang_pub_test//:test",
    ],
)
