#!/bin/bash
# Test runner script for Round Robin Ada tests

echo "========================================"
echo "  Round Robin Test Suite Runner"
echo "========================================"
echo ""

# Check if gnatmake is available
if ! command -v gnatmake &> /dev/null; then
    echo "ERROR: gnatmake (GNAT Ada compiler) is not installed."
    echo "Please install GNAT Ada compiler to run the tests."
    exit 1
fi

# Create object directory if it doesn't exist
mkdir -p tests/obj

# Clean previous builds
echo "Cleaning previous builds..."
rm -rf tests/obj/*

# Compile the test suite
echo "Compiling test suite..."
cd tests
gnatmake -P run_tests.gpr -f 2>&1

if [ $? -ne 0 ]; then
    echo ""
    echo "ERROR: Compilation failed. Please check the error messages above."
    exit 1
fi

echo ""
echo "Running tests..."
echo "========================================"
./obj/run_tests

# Capture exit code
EXIT_CODE=$?

echo ""
echo "========================================"
if [ $EXIT_CODE -eq 0 ]; then
    echo "All tests passed successfully!"
else
    echo "Some tests failed. Exit code: $EXIT_CODE"
fi
echo "========================================"

exit $EXIT_CODE
