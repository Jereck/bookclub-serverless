#!/bin/bash

set -e

LAMBDA_ROOT="./lambdas"
BUILD_DIR="./build"

# Clean build dir
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"

echo "Zipping Python Lambda functions..."

find "$LAMBDA_ROOT" -type f -name "*.py" | while read -r file; do
  # Extract folder and function name
  dir_path=$(dirname "$file")
  file_name=$(basename "$file")
  function_name="${file_name%.*}"  # Strip .py

  # Create zip in build dir
  zip_path="$BUILD_DIR/${function_name}.zip"

  echo " - Zipping $function_name → $zip_path"

  (cd "$dir_path" && zip -r "$OLDPWD/$zip_path" "$file_name" > /dev/null)
done

echo "Done. Zips available in $BUILD_DIR"
