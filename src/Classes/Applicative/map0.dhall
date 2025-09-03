{-|
Lift a value into an applicative context (equivalent to `pure`).

This function is a convenience alias for the `pure` function of an applicative,
following the naming convention of the `mapN` family of functions.

## Parameters
- `F : Type -> Type` - The applicative functor type constructor
- `applicative : Applicative F` - The applicative instance
- `A : Type` - The type of the value to lift
- `a : A` - The value to lift into the applicative context

## Returns
`F A` - The value wrapped in the applicative context

## Usage
```dhall
let result = map0 Optional optionalApplicative Natural 42  -- Some 42
```

## Relationship to Other Functions
- Equivalent to `applicative.pure A a`
- Part of the `mapN` family (map0, map1, map2, ...)
- Foundation for higher-arity mapping functions
-}
let Applicative = ./Type.dhall

in  \(F : Type -> Type) ->
    \(applicative : Applicative F) ->
    \(A : Type) ->
    \(a : A) ->
      applicative.pure A a
