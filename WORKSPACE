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

# TODO(DrMarcII) Update when https://github.com/dart-lang/rules_dart/pull/69 is merged.
http_archive(
    name = "io_bazel_rules_dart",
    sha256 = "c5a60e0d977e595bd24e60ce569c2d1f7edea2379f9eaa6a471700d0971ec16c",
    strip_prefix = "rules_dart-b8ab2c9001eab9955711a3c46775cb8445ae308b",
    url = "https://github.com/DrMarcII/rules_dart/archive/b8ab2c9001eab9955711a3c46775cb8445ae308b.tar.gz",
)

load("@io_bazel_rules_dart//dart/build_rules:repositories.bzl", "dart_repositories")

dart_repositories()

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "890e055a9956daa85287ed309e8efaa9d5336b2bc5a71ad3676c220c99015a9d",
    strip_prefix = "rules_go-0.3.2",
    url = "https://github.com/bazelbuild/rules_go/archive/0.3.2.tar.gz",
)

load("@io_bazel_rules_go//go:def.bzl", "go_repositories")

go_repositories()

http_archive(
    name = "io_bazel_rules_webtesting",
    sha256 = "898c0565afe493706ca87c39528a5084ddfeef88ffb7878d0ca117cb4d9ec802",
    strip_prefix = "rules_webtesting-0.1.2",
    url = "https://github.com/bazelbuild/rules_webtesting/archive/0.1.2.tar.gz",
)

load("@io_bazel_rules_webtesting//web:repositories.bzl", "web_test_repositories")

web_test_repositories()

http_archive(
    name = "com_github_google_webdriver_dart",
    sha256 = "675aa61528e86136386939faa8b0a626c8a58db01917f438e4d8b7b24d5b3f5c",
    strip_prefix = "webdriver.dart-1.2.2",
    url = "https://github.com/google/webdriver.dart/archive/v1.2.2.tar.gz",
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
