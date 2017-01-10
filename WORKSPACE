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

workspace(name = "com_github_google_pageloader")

http_archive(
    name = "io_bazel_rules_dart",
    sha256 = "e75d14c603e09031d1185df62f4fa10cc1d6fbcb0d9d7e624eb9c0c70cf3afd3",
    strip_prefix = "rules_dart-a7c1b24897da18d5e0ccd094ff1bad252f8b8dfc",
    url = "https://github.com/DrMarcII/rules_dart/archive/a7c1b24897da18d5e0ccd094ff1bad252f8b8dfc.tar.gz",
)

load("@io_bazel_rules_dart//dart/build_rules:repositories.bzl", "dart_repositories")

dart_repositories()

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "0c0ec7b9c7935883cbfb2df48fbf524e857859a5c05ae1b24d5442956e6bb5e8",
    strip_prefix = "rules_go-0.2.0",
    url = "https://github.com/bazelbuild/rules_go/archive/0.2.0.tar.gz",
)

load("@io_bazel_rules_go//go:def.bzl", "go_repositories")

go_repositories()

http_archive(
    name = "io_bazel_rules_webtesting",
    sha256 = "1c0d36f71e265dd7541ced44cbf68c293f5b76ac78cff215a2c76dcce22b4d00",
    strip_prefix = "rules_webtesting-f27ab1ce1bf42b3ef0fb4ca15b19507e27c28df9",
    url = "https://github.com/bazelbuild/rules_webtesting/archive/f27ab1ce1bf42b3ef0fb4ca15b19507e27c28df9.tar.gz",
)

load("@io_bazel_rules_webtesting//web:repositories.bzl", "web_test_repositories")

web_test_repositories()

http_archive(
    name = "com_github_google_webdriver_dart",
    sha256 = "f22598116700a6d3506f200ce5449437d804b91d0c1a805f2c39c29a88051432",
    strip_prefix = "webdriver.dart-0bd8c4674cda1b0e959098955274769d881ce5fd",
    url = "https://github.com/DrMarcII/webdriver.dart/archive/0bd8c4674cda1b0e959098955274769d881ce5fd.tar.gz",
)

load("@com_github_google_webdriver_dart//:repositories.bzl", "webdriver_dart_repositories")

webdriver_dart_repositories(
    omit_org_dartlang_pub_path = True,
    omit_org_dartlang_pub_stack_trace = True,
)

load("//:repositories.bzl", "pageloader_repositories")

pageloader_repositories()

http_file(
    name = "org_chromium_chromedriver",
    sha256 = "d011749e76305b5591b5500897939b33fac460d705d9815b8c03c53b0e1ecc7c",
    url = " http://chromedriver.storage.googleapis.com/2.25/chromedriver_linux64.zip",
)

http_file(
    name = "org_chromium_chromium",
    sha256 = "e3c99954d6acce013174053534b72f47f67f18a0d75f79c794daaa8dd2ae8aaf",
    url = "https://commondatastorage.googleapis.com/chromium-browser-snapshots/Linux_x64/423768/chrome-linux.zip",
)
