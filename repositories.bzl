# Copyright 2016 Google Inc. All Rights Reserved.
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
"""Configure required repositories for PageLoader."""


def pageloader_repositories(omit_org_dartlang_pub_path=False,
                            omit_org_dartlang_pub_stack_trace=False):
  """Configure required repositories for PageLoader."""

  if not omit_org_dartlang_pub_path:
    native.new_http_archive(
        name="org_dartlang_pub_path",
        build_file=str(Label("//build_files:path.BUILD")),
        sha256="39413112ccce676d862608b51516bd45aee750e6865596267fc1500f3a7e0595",
        url="https://storage.googleapis.com/pub.dartlang.org/packages/path-1.4.1.tar.gz"
    )

  if not omit_org_dartlang_pub_stack_trace:
    native.new_http_archive(
        name="org_dartlang_pub_stack_trace",
        build_file=str(Label("//build_files:stack_trace.BUILD")),
        sha256="b8ea106aa932e2ba97fc29562caa76bd71c60f9d688ba03ca1466559f632af9d",
        url="https://storage.googleapis.com/pub.dartlang.org/packages/stack_trace-1.7.0.tar.gz"
    )
