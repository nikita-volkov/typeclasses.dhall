{-|
# Instance Test Suite

This module contains comprehensive test suites for all typeclass instances
implemented in the library. Each instance type has its own detailed test suite.

## Test Coverage

### Natural Number Tests
- **`Natural.equality`** - Natural number equality tests
- **`Natural.ordering`** - Natural number ordering tests

### List Tests
- **`List.equality`** - List equality tests (lexicographic)
- **`List.ordering`** - List ordering tests (lexicographic)

### NonEmpty List Tests
- **`NonEmpty.equality`** - Non-empty list equality tests
- **`NonEmpty.ordering`** - Non-empty list ordering tests

## Test Categories

Each test suite covers:

### Basic Functionality
- **Normal cases**: Standard usage scenarios
- **Edge cases**: Empty lists, single elements, etc.
- **Boundary conditions**: Maximum/minimum values, length limits

### Mathematical Laws
- **Equality laws**: Reflexivity, symmetry, transitivity
- **Ordering laws**: Totality, reflexivity, antisymmetry, transitivity

### Implementation Correctness
- **Consistency**: Results match expected mathematical behavior
- **Performance**: Edge cases that might cause performance issues
- **Type safety**: Proper handling of all type parameters

## Usage

```dhall
-- Run all instance tests
let allInstanceTests = ./Instances/package.test.dhall

-- Access specific test suites
let naturalTests = allInstanceTests.Natural
let listTests = allInstanceTests.List
let nonEmptyTests = allInstanceTests.NonEmpty
```

## Assertion-Based Testing

All tests use Dhall's built-in `assert` mechanism:
- Tests pass if expressions evaluate successfully
- Tests fail with type errors if assertions are false
- All tests are verified at compile-time
-}
{ Natural = ./Natural/package.test.dhall
, List = ./List/package.test.dhall
, NonEmpty = ./NonEmpty/package.test.dhall
}
