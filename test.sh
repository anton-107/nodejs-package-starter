#!/bin/bash

# Exit on any error
set -e

# Function to check if a file exists
check_file() {
    if [ ! -f "$1" ]; then
        echo "❌ Error: File $1 not found"
        exit 1
    else
        echo "✅ File $1 exists"
    fi
}

# Function to check if a directory exists
check_directory() {
    if [ ! -d "$1" ]; then
        echo "❌ Error: Directory $1 not found"
        exit 1
    else
        echo "✅ Directory $1 exists"
    fi
}

echo "🚀 Starting test of bootstrap script"

# Create test output directory
mkdir -p test-output
cd test-output

# Run the initialization script
echo "Running bootstrap-nodejs-package with project name: $TEST_PROJECT_NAME"
../bootstrap-nodejs-package "$TEST_PROJECT_NAME"

# Verify the project structure
cd "$TEST_PROJECT_NAME"

echo "📋 Verifying project structure..."

# Check directories
ls -al
check_directory "node_modules"
check_directory ".github/workflows"

# Check files
check_file "package.json"
check_file "tsconfig.json"
check_file "jest.config.cjs"
check_file ".gitignore"
check_file ".github/workflows/ci.yml"
check_file "eslint.config.mjs"

# Verify npm packages are installed
echo "📦 Verifying npm packages..."
if ! npm list typescript > /dev/null 2>&1; then
    echo "❌ Error: TypeScript not installed"
    exit 1
fi

# Try to build the project
echo "🔨 Testing build..."
if ! npm run build > /dev/null 2>&1; then
    echo "❌ Error: Build failed"
    exit 1
fi

echo "✅ Build successful"

# Try to run tests (even though there are none yet)
echo "🧪 Testing test command..."
if ! npm test > /dev/null 2>&1; then
    echo "❌ Error: Test command failed"
    exit 1
fi

echo "✅ Test command successful"

echo "🎉 All tests passed successfully!"