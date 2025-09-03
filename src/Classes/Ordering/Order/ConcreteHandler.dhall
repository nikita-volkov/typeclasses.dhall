{-|
Construct a concrete handler module for a specific result type.

This function creates a module containing handler utilities specialized for a
particular result type. It follows the "functor" pattern from ML languages,
where a functor creates modules based on provided types.

## Parameters
- `Result : Type` - The type of values the handlers will return

## Returns
A module containing:
- `Type` - The handler type specialized for `Result`
- `default` - Function to create default handlers for `Result`

## Usage
```dhall
-- Create a handler module for Text results
let TextHandler = ConcreteHandler Text
let textHandler = TextHandler.default "unknown"
let customHandler = textHandler // { Equal = "same", Less = "smaller" }

-- Create a handler module for Natural results
let NaturalHandler = ConcreteHandler Natural
let natHandler = NaturalHandler.default 0
let scoringHandler = natHandler // { Greater = 1, Less = -1 }
```

## Benefits of Concrete Handlers

1. **Type specialization**: All functions work with the specific result type
2. **Reduced verbosity**: Don't need to specify result type repeatedly
3. **Module organization**: Groups related functionality together
4. **Reusability**: Can create libraries of handlers for common types

## Comparison

```dhall
-- Without ConcreteHandler (verbose)
let handler1 = Handler.default Text "unknown"
let handler2 = Handler.default Text "fallback"

-- With ConcreteHandler (concise)
let TextHandler = ConcreteHandler Text
let handler1 = TextHandler.default "unknown"
let handler2 = TextHandler.default "fallback"
```

## ML Functor Pattern

This follows the ML tradition where functors (functions from modules to modules)
create specialized modules. Here we create handler modules specialized for
specific result types.
-}
-- A functor in the OCaml terminology.
-- Constructs a module with non-polymorphic definitions based on the provided type.
let Handler = ./Handler/package.dhall

in  \(Result : Type) ->
      let Self
          : Type
          = Handler.Type Result

      let default
          : Result -> Self
          = Handler.default Result

      in  { Type = Self, default }
