{-|
# Order Handler Utilities Module

This module provides utilities for creating and working with handlers for `Order` values.
Handlers are used with Dhall's `merge` operation to pattern match on `Order` constructors.

## Exports

### Type Definition
- **`Type`** - The handler type for pattern matching on `Order`

### Utility Functions
- **`default`** - Create a handler that returns the same value for all cases

## Handler Pattern

Handlers provide a type-safe way to pattern match on `Order` values:

```dhall
-- Handler maps each Order case to a specific result
let handler = { Less = 1, Equal = 0, Greater = -1 }
let orderValue = Order.Greater
let result = merge handler orderValue  -- -1
```

## Default Handler Utility

The `default` function creates handlers where all cases return the same value:

```dhall
let Handler = ./Handler/package.dhall

-- All cases return "unknown"
let unknownHandler = Handler.default Text "unknown"

-- Customize specific cases
let customHandler = unknownHandler // { Equal = "same" }
```

## Type Safety Benefits

- **Exhaustiveness**: Must handle all three `Order` cases
- **Type consistency**: All cases must return the same type
- **Compile-time verification**: Missing cases caught during type checking

## Common Patterns

```dhall
-- Boolean conversion
let isEqual = { Less = False, Equal = True, Greater = False }

-- Numeric conversion
let toInt = { Less = -1, Equal = 0, Greater = 1 }

-- String representation
let toString = { Less = "less", Equal = "equal", Greater = "greater" }
```
-}
let Self
    : Type -> Type
    = ./Type.dhall

let default
    : forall (Result : Type) -> Result -> Self Result
    = ./default.dhall

in  { Type = Self, default }
