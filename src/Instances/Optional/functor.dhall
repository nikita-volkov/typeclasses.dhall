{-|
Optional functor instance.

This instance implements the `Functor` typeclass for `Optional` values,
allowing functions to be mapped over optional content.

## Implementation
Uses pattern matching to handle Optional values:
- `map f (None A)` ⟹ `None B`
- `map f (Some a)` ⟹ `Some (f a)`

## Usage
```dhall
let optionalFunctor = ./functor.dhall
let increment = \(x : Natural) -> x + 1

let result1 = optionalFunctor.map Natural Natural increment (Some 5)        -- Some 6
let result2 = optionalFunctor.map Natural Natural increment (None Natural)  -- None Natural
```

## Laws
This implementation satisfies all Functor laws:
- **Identity**: `map (\x -> x) = (\x -> x)`
- **Composition**: `map (f ∘ g) = map f ∘ map g`
-}
let Functor = ../../Classes/Functor/Type.dhall

let map
    : forall (A : Type) ->
      forall (B : Type) ->
      (A -> B) ->
      Optional A ->
        Optional B
    = \(A : Type) ->
      \(B : Type) ->
      \(f : A -> B) ->
      \(x : Optional A) ->
        merge { None = None B, Some = \(a : A) -> Some (f a) } x

in  { map } : Functor Optional
