{-|
Reference to the Dhall Prelude library.

This module imports the standard Dhall Prelude library, which provides
essential functions and utilities used throughout the typeclasses library.

## Prelude Version
- **Version**: v23.1.0
- **SHA256**: Verified with integrity hash
- **Source**: https://prelude.dhall-lang.org/

## Usage in Typeclasses

The Prelude is used extensively throughout this library for:

### Core Functions
- `List.*` - List manipulation functions (map, fold, zip, etc.)
- `Natural.*` - Natural number operations (equal, lessThan, etc.)
- `Bool.*` - Boolean operations (and, or, not)
- `Optional.*` - Optional value handling

### Data Types
- `NonEmpty` - Non-empty list type definitions
- Type utilities and combinators

### Functional Programming Utilities
- Higher-order functions
- Function composition helpers
- Control flow utilities

## Import Strategy

This library imports the Prelude once at the root level and reuses it
throughout all modules to ensure consistency and avoid version conflicts.

## Version Stability

The SHA256 hash ensures that all users of this library get exactly the
same version of the Prelude, providing reproducible builds and preventing
version-related issues.
-}
https://prelude.dhall-lang.org/v23.1.0/package.dhall
  sha256:931cbfae9d746c4611b07633ab1e547637ab4ba138b16bf65ef1b9ad66a60b7f
