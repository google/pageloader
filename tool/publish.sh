#!/bin/bash

set -e

if [ ! -f pubspec.yaml ]; then
    echo "Error: No pubspec.yml in working directory."
    exit
fi

pub get
pub publish
