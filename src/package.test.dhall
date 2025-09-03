{-|
# Test Suite - Main Module

This module aggregates all test suites for the typeclass instances provided
by the library. It serves as the entry point for running comprehensive tests
across all implemented instances.

## Test Organization

Tests are organized by instance type, with each instance type having its own
comprehensive test suite covering various scenarios and edge cases.

## Available Test Suites

### Instance Tests
- **`Instances`** - All tests for typeclass instances (Natural, List, NonEmpty)

## Usage

```dhall
-- Run all tests by evaluating this module
let allTests = ./package.test.dhall

-- Access specific test suites
let instanceTests = allTests.Instances
let naturalTests = instanceTests.Natural
let listTests = instanceTests.List
```

## Test Philosophy

The tests follow these principles:
- **Comprehensive coverage**: Test normal cases, edge cases, and boundary conditions
- **Law verification**: Ensure typeclass instances satisfy their mathematical laws
- **Example-driven**: Provide clear examples of expected behavior
- **Type safety**: All tests are statically verified by Dhall's type system

## Running Tests

Since this is Dhall, tests are run by type-checking and evaluating the expressions.
All tests are assertion-based using Dhall's `assert` keyword:

```dhall
assert : someExpression === expectedResult
```

If any assertion fails, Dhall will report a type error indicating which test failed.
-}
{ Instances = ./Instances/package.test.dhall }
