{-|
Apply a unary function within an applicative context (equivalent to `map`).

This function applies a single-argument function to a value inside an applicative
context, equivalent to the functor's `map` operation.

## Parameters
- `F : Type -> Type` - The applicative functor type constructor
- `applicative : Applicative F` - The applicative instance
- `A : Type` - The input type
- `B : Type` - The output type
- `f : A -> B` - The function to apply
- `fa : F A` - The applicative value to map over

## Returns
`F B` - The result of applying the function within the applicative context

## Usage
```dhall
let increment = \(x : Natural) -> x + 1
let result = map1 Optional optionalApplicative Natural Natural increment (Some 5)  -- Some 6
```

## Relationship to Other Functions
- Equivalent to `applicative.functor.map A B f fa`
- Part of the `mapN` family (map0, map1, map2, ...)
- Foundation for understanding higher-arity mapping
-}
let Applicative = ./Type.dhall

in  \(F : Type -> Type) ->
    \(applicative : Applicative F) ->
    \(A : Type) ->
    \(B : Type) ->
    \(f : A -> B) ->
    \(fa : F A) ->
      applicative.functor.map A B f fa
