{-|
# Functor Typeclass Module

This module provides the `Functor` typeclass definition for types that can be mapped over.

## Exports

### Type Definition
- **`Type`** - The `Functor` typeclass definition

## Usage Examples

```dhall
let Functor = ./Functor/package.dhall

-- Using a functor instance (hypothetical List example)
let listFunctor : Functor.Type List = { map = List/map }
let increment = \(x : Natural) -> x + 1
let result = listFunctor.map Natural Natural increment [1, 2, 3]  -- [2, 3, 4]
```

## Design Notes

The Functor typeclass is intentionally minimal, containing only the essential `map` operation.
Additional utility functions are typically provided by higher-level typeclasses like
`Applicative` that build upon `Functor`.

## Relationship to Other Typeclasses

`Functor` is the foundation of the functional programming typeclass hierarchy:
- Every `Applicative` contains a `Functor`
- Every `Monad` contains an `Applicative`, which contains a `Functor`
-}
let Functor
    : (Type -> Type) -> Type
    = ./Type.dhall

in  { Type = Functor }
