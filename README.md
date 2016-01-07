PageLoader
==========

[![Build Status](https://travis-ci.org/google/pageloader.svg?branch=master)](https://travis-ci.org/google/pageloader)
[![pub package](https://img.shields.io/pub/v/pageloader.svg)](https://pub.dartlang.org/packages/pageloader)

A framework for creating page objects for in-browser tests or
WebDriver tests.

PageLoader for Dart comes in two flavours: async and sync.

Async PageLoader for Dart
-------------------------
Async PageLoader for Dart is the **recommended** version going forward. It is designed to work with [webdriver.dart](https://github.com/google/webdriver.dart). 

Sync PageLoader for Dart
------------------------
The sync version is **deprecated** and will eventually be **removed** from this repository.
Consider switching to the async version.

Sync Pageloader was designed to work with the now deprecated [Dart Sync WebDriver](https://github.com/google/dart-sync-webdriver).

When using Sync PageLoader with Dart Sync WebDriver, you must build the native extension for
https://github.com/google/dart-sync-socket
This can be done by running the following after running pub get or upgrade:
```
  # ./packages/sync_socket/../tool/build.sh
```
