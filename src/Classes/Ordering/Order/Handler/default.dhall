{-|
Create a default handler that returns the same value for all `Order` cases.

This utility function creates a handler where all three cases (`Less`, `Equal`, `Greater`)
return the same default value. This is useful when you want to treat all cases uniformly
or as a starting point for building more specific handlers.

## Parameters
- `Result : Type` - The type of value the handler should return
- `defaultResult : Result` - The value to return for all cases

## Returns
A handler that maps all `Order` cases to the provided default value

## Usage
```dhall
-- Create a handler that returns False for all cases
let allFalse = default Bool False
let result1 = merge allFalse Order.Less     -- False
let result2 = merge allFalse Order.Equal    -- False
let result3 = merge allFalse Order.Greater  -- False

-- Use as a base for customization
let customHandler = default Natural 0 // { Equal = 42 }
let result4 = merge customHandler Order.Equal  -- 42
let result5 = merge customHandler Order.Less   -- 0
```

## Common Use Cases
- **Default behavior**: Provide fallback handling when only some cases matter
- **Handler templates**: Start with uniform behavior, then customize specific cases
- **Testing**: Create simple handlers for unit tests
- **Debugging**: Log or ignore all comparison results uniformly

## Implementation
Creates a record with all three fields set to the same value, ensuring
type consistency and exhaustive coverage.
-}
\(Result : Type) ->
\(defaultResult : Result) ->
    { Less = defaultResult, Equal = defaultResult, Greater = defaultResult }
  : ./Type.dhall Result
