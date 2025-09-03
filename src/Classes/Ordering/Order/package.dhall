{-|
# Order Type and Utilities Module

This module provides the `Order` type and related utilities for working with
three-way comparison results.

## Exports

### Core Type
- **`Type`** - The `Order` sum type (`< Less | Equal | Greater >`)

### Utilities
- **`Handler`** - Utilities for pattern matching and handling `Order` values
- **`ConcreteHandler`** - Type-specific handler construction utilities

## Order Type

The `Order` type represents the three possible relationships between two values:
- `Less` - First value is less than the second
- `Equal` - Both values are equal
- `Greater` - First value is greater than the second

## Handler Pattern

The `Handler` utilities provide a convenient way to work with `Order` values:

```dhall
-- Create a handler that maps all cases to the same result
let boolHandler = Handler.default Bool False

-- Create a handler with specific behavior for each case
let customHandler = { Less = "smaller", Equal = "same", Greater = "bigger" }

-- Use with merge
let result = merge customHandler someOrderValue
```

## Usage Examples

```dhall
let Order = ./Order/package.dhall

-- Basic Order usage
let comparison = Order.Type.Less

-- Using handlers
let isLessThan = merge (Order.Handler.default Bool False)
                      { Less = True }
                      comparison  -- True

-- Creating concrete handlers for specific types
let stringHandler = Order.ConcreteHandler Text
let myHandler = stringHandler.default "unknown"
```

## Design Philosophy

The `Order` type and its utilities follow functional programming principles:
- **Exhaustive pattern matching**: All cases must be handled
- **Type safety**: Impossible to forget a case
- **Composability**: Handlers can be built incrementally
-}
let Self
    : Type
    = ./Type.dhall

let Handler = ./Handler/package.dhall

let ConcreteHandler = ./ConcreteHandler.dhall

in  { Type = Self, Handler, ConcreteHandler }
