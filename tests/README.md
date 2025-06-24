# CoupleScript Testing Documentation

## 📋 Test Coverage Overview

CoupleScript now includes a comprehensive testing framework designed to ensure the language works reliably across all platforms and use cases.

## 🗂️ Test Structure

```
tests/
├── test_framework.couple          # Core testing framework written in CoupleScript
├── unit/
│   └── language_features_test.couple    # Unit tests for language features
├── integration/
│   └── compiler_vm_test.couple          # Integration tests for compiler/VM
├── fixtures/
│   └── test_programs.couple             # Sample programs for testing
└── temp/                                # Temporary test files (auto-generated)
```

## 🧪 Test Categories

### 1. Unit Tests (`tests/unit/`)
- **Variable Operations**: Declaration, assignment, types
- **Arithmetic Operations**: Math calculations and operators
- **Conditional Statements**: `argue`/`makeup` logic
- **Function Operations**: Definition, calls, parameters
- **Data Structures**: `couple` (arrays) and `memory` (objects)
- **Loop Operations**: `anniversary` loops and iterations

### 2. Integration Tests (`tests/integration/`)
- **Compilation Pipeline**: End-to-end compilation process
- **Error Handling**: Syntax and runtime error detection
- **Standard Library**: Import system and module loading
- **VM Operations**: Virtual machine instruction execution
- **Performance Tests**: Stress testing and benchmarks

### 3. Cross-Platform Tests
- **Platform Compatibility**: Windows/Linux/macOS support
- **Build System**: Makefile and build script validation
- **Interpreter Availability**: Runtime environment checks

## 🚀 Running Tests

### CI/Build Validation Tests
```bash
# Basic CI tests (build validation only)
make test

# Quick local test (basic examples)
make test-quick
```

### Full Test Suite (Requires Working Interpreter)
```bash
# Comprehensive test suite (Linux/macOS)
make test-full
# or directly:
./run_tests.sh

# Windows comprehensive testing
run_tests.bat
```

### Specific Test Categories
```bash
# Unit tests only (when interpreter is ready)
make test-unit

# Integration tests only (when interpreter is ready)
make test-integration
```

## 🔧 Current Testing Status

### ✅ **Working in CI:**
- **Build Validation**: Ensures project builds successfully
- **Syntax Checking**: Validates CoupleScript file syntax
- **Structure Validation**: Confirms all required files exist
- **Documentation Check**: Verifies docs are present

### 🚧 **Requires Full Implementation:**
- **Runtime Testing**: Needs working VM interpreter
- **Error Handling**: Requires complete compiler error detection
- **Performance Testing**: Needs executable interpreter
- **Standard Library**: Awaits library implementation

The CI currently focuses on **build validation** and **project integrity** since the full interpreter is still in development.

## 📊 Test Framework Features

### Romantic Test Output
The testing framework uses CoupleScript's romantic theme:
- 💕 Test suite headers with love emojis
- ✅ Green checkmarks for passing tests
- ❌ Red X marks for failing tests
- 🧪 Test tube emoji for individual tests
- 🎉 Celebration messages for success

### Assertion Functions
```couplescript
# Available assertions in test_framework.couple
assert_equals(actual, expected)     # Value equality
assert_true(value)                  # Boolean true check
assert_false(value)                 # Boolean false check
assert_not_null(value)              # Non-null validation
```

### Performance Testing
```couplescript
# Benchmark function for performance tests
benchmark(name, test_function, iterations)
```

## 🔍 Test Coverage Areas

### ✅ Currently Tested
- [x] Basic variable operations
- [x] Arithmetic calculations
- [x] Simple conditionals
- [x] Function definitions and calls
- [x] Basic data structures
- [x] Loop constructs
- [x] Error detection (syntax errors)
- [x] Cross-platform compatibility
- [x] Build system validation

### 🚧 Needs Testing
- [ ] Complex nested conditionals
- [ ] Recursive function calls
- [ ] Standard library modules
- [ ] Import system functionality
- [ ] Memory management
- [ ] Garbage collection
- [ ] Runtime error handling
- [ ] Edge cases and stress tests
- [ ] Multi-file projects
- [ ] Large program compilation

### 🎯 Future Test Additions
- [ ] Property-based testing
- [ ] Fuzzing for compiler robustness
- [ ] Performance regression tests
- [ ] Memory leak detection
- [ ] Concurrency testing (if added)
- [ ] Standard library test suite
- [ ] Documentation example validation

## 📈 Test Metrics

The test runner provides detailed metrics:
- **Total Tests**: Number of test cases executed
- **Passed**: Successfully completed tests
- **Failed**: Tests that didn't meet expectations
- **Skipped**: Tests that couldn't run (missing files, etc.)
- **Success Rate**: Percentage of passing tests

## 🐛 Debugging Failed Tests

### Common Issues
1. **Build Problems**: Ensure `make all` or `build_windows.bat` completed successfully
2. **Missing Dependencies**: Check that NASM is installed and in PATH
3. **Platform Issues**: Some tests may be platform-specific
4. **Timeout Issues**: Performance tests may timeout on slower systems

### Debugging Tips
```bash
# Run individual test files manually
./couplescript examples/hello.couple
couplescript.bat examples\hello.couple

# Check build status
make clean && make all

# Verbose output for debugging
./run_tests.sh 2>&1 | tee test_output.log
```

## 🔧 Adding New Tests

### Creating Unit Tests
1. Add test functions to `tests/unit/language_features_test.couple`
2. Use the test framework assertion functions
3. Follow the romantic naming convention

### Creating Integration Tests
1. Add test scenarios to `tests/integration/compiler_vm_test.couple`
2. Test end-to-end functionality
3. Include error condition testing

### Adding Test Fixtures
1. Add sample programs to `tests/fixtures/test_programs.couple`
2. Include both valid and invalid examples
3. Document expected behavior

## 🎨 Test Framework Philosophy

The CoupleScript test framework embodies the language's romantic philosophy:
- **Tests should tell a story** - Each test is a small romantic narrative
- **Failures are learning opportunities** - Error messages are helpful and encouraging
- **Community-driven** - Easy for contributors to add new tests
- **Comprehensive but approachable** - Covers all features without being overwhelming

## 📝 Contributing to Tests

When contributing new features to CoupleScript:
1. **Write tests first** - Follow TDD principles
2. **Test both success and failure cases** - Ensure robust error handling
3. **Add performance tests for new features** - Maintain language efficiency
4. **Update this documentation** - Keep test docs current
5. **Use romantic terminology** - Maintain the language's charming character

Remember: Every great love story needs trust, and every great programming language needs comprehensive tests! 💕
