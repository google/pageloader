set -e

if [ ! -f pubspec.yaml ]; then
    echo "Error: No pubspec.yml in working directory."
    exit
fi

cp ../../LICENSE LICENSE
cp ../../README.md README.md
pub get
pub publish
