#!/usr/bin/env bash
set -e

echo "Fetching impeller-cmake git submodules..."
git submodule update --init --recursive
echo "Done fetching impeller-cmake git submodules."
echo

ROOT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}"); pwd -P)

echo "Fetching shaderc dependencies..."
pushd $ROOT_DIR/third_party/shaderc > /dev/null
  ./utils/git-sync-deps
popd > /dev/null
echo "Done fetching shaderc dependencies."

echo "Fetching skia dependencies..."
pushd $ROOT_DIR/third_party/skia > /dev/null
  python3 ./tools/git-sync-deps
  ./bin/fetch-ninja
popd
