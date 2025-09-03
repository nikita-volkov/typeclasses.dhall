{-|
Handler type for pattern matching on `Order` values.

This type defines the structure needed to handle all three cases of an `Order`
value using Dhall's `merge` operation. It ensures exhaustive pattern matching
by requiring handlers for all three constructors.

## Type Definition

A handler for result type `Result` must provide:
- `Less : Result` - Value to return when order is `Less`
- `Equal : Result` - Value to return when order is `Equal`
- `Greater : Result` - Value to return when order is `Greater`

## Usage with merge

```dhall
let orderValue = Order.Less
let handler = { Less = "smaller", Equal = "same", Greater = "bigger" }
let result = merge handler orderValue  -- "smaller"
```

## Handler Creation

Handlers can be created manually or using utility functions:

```dhall
-- Manual creation
let boolHandler = { Less = False, Equal = True, Greater = False }

-- Using default utility
let defaultHandler = Handler.default Bool False  -- All cases return False
let customHandler = defaultHandler // { Equal = True }  -- Override Equal case
```

## Type Safety

The handler type ensures:
- **Exhaustiveness**: All `Order` cases must be handled
- **Type consistency**: All handler cases must return the same type
- **Compile-time verification**: Missing cases are caught at type-check time
-}
\(Result : Type) -> { Less : Result, Equal : Result, Greater : Result }
