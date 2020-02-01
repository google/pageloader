PageLoader
==========

[![Build Status](https://travis-ci.org/google/pageloader.svg?branch=master)](https://travis-ci.org/google/pageloader)

A framework for creating page objects for in-browser tests or Webdriver tests.

For a beginner's guide, refer to our [quickstart guide](quickstart_guide.md).

For in-depth explanation of PageLoader's anatomy and features, refer
to our [anatomy section](anatomy.md).

Refer to our [best practices section](best_practices.md) to master using PageLoader.

Starting with version 3.0.0, PageLoader is changed significantly from version 2.X.X.
Refer to our [what changed section](what_changed.md) for more information.

How do I trigger the generation step?
=====================================
`pub run build_runner build`

If you are starting with a fresh checkout or deleted your `.dart_tool` directory,
pass the flag: `--delete-conflicting-outputs`.

| WARNING: Your PageObject Dart files must be within `test/...` subdirectory |
| --- |
