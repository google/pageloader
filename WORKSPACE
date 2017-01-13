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
    sha256 = "45abe3e3fb908f7792bc747b380aa5fdf8f9e66a4f86623ed68acbe1042b1e7e",
    strip_prefix = "rules_dart-11bca9e70b42470a909782e6369194af38898551",
    url = "https://github.com/dart-lang/rules_dart/archive/11bca9e70b42470a909782e6369194af38898551.tar.gz",
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
    sha256 = "ff0def632de4f8713494c87528f4a621b819d464da6334a8d96f8be0eec8798a",
    strip_prefix = "rules_webtesting-6d2398e3ad1f210ae1cf70ae6c50ea7621857d16",
    url = "https://github.com/bazelbuild/rules_webtesting/archive/6d2398e3ad1f210ae1cf70ae6c50ea7621857d16.tar.gz",
)

load("@io_bazel_rules_webtesting//web:repositories.bzl", "web_test_repositories")

web_test_repositories()

http_archive(
    name = "com_github_google_webdriver_dart",
    sha256 = "c593ffdccf5da84f6091e78392b6d08b8068574720c29a105057db22af760d29",
    strip_prefix = "webdriver.dart-dc5c129ce550c58fca0d498e51c38edf7e378255",
    url = "https://github.com/google/webdriver.dart/archive/dc5c129ce550c58fca0d498e51c38edf7e378255.tar.gz",
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
