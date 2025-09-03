{-|
# Alternative Typeclass Module

This module provides the `Alternative` typeclass and utility functions for types
that support choice, failure, and alternative computations.

## Exports

### Type Definition
- **`Type`** - The `Alternative` typeclass definition

### Utility Functions
- **`liftOptional`** - Convert an `Optional A` to `F A` using the Alternative instance
- **`ors`** - Combine a list of alternatives, choosing the first successful one
- **`optional`** - Convert `F A` to `F (Optional A)`, capturing potential failure

## Usage Examples

```dhall
let Alternative = ./Alternative/package.dhall

-- Combine multiple alternatives
let alternatives = [computation1, computation2, computation3]
let result = Alternative.ors F alternativeInstance A alternatives

-- Lift an optional value
let maybeValue = Some 42
let lifted = Alternative.liftOptional F alternativeInstance Natural maybeValue

-- Make a computation optional
let optionalResult = Alternative.optional F alternativeInstance A computation
```

## Common Use Cases

- **Parser combinators**: Try different parsing strategies
- **Validation**: Collect and combine validation errors
- **Configuration**: Provide fallback options and defaults
- **Search algorithms**: Try multiple search strategies

## Implementation Notes

The utility functions provide common patterns for working with alternatives:
- `liftOptional` bridges between `Optional` and generic `Alternative` types
- `ors` implements a fold-based approach to combining multiple alternatives
- `optional` provides safe failure handling by wrapping results in `Optional`
-}
let Alternative
    : (Type -> Type) -> Type
    = ./Type.dhall

let liftOptional
    : forall (F : Type -> Type) ->
      Alternative F ->
      forall (A : Type) ->
      Optional A ->
        F A
    = ./liftOptional.dhall

let ors
    : forall (F : Type -> Type) ->
      Alternative F ->
      forall (A : Type) ->
      List (F A) ->
        F A
    = ./ors.dhall

let optional
    : forall (F : Type -> Type) ->
      Alternative F ->
      forall (A : Type) ->
      F A ->
        F (Optional A)
    = ./optional.dhall

in  { Type = Alternative, liftOptional, ors, optional }
