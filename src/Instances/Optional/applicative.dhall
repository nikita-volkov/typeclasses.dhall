{-|
Optional applicative instance.

This instance implements the `Applicative` typeclass for `Optional` values,
enabling function application within optional contexts.

## Implementation
- **pure**: Wraps a value in `Some`
- **map2**: Applies a binary function to two optional values, returning `Some` only if both inputs are `Some`

## Usage
```dhall
let optionalApplicative = ./applicative.dhall
let add = \(x : Natural) -> \(y : Natural) -> x + y

let result1 = optionalApplicative.pure Natural 42                                -- Some 42
let result2 = optionalApplicative.map2 Natural Natural Natural add (Some 3) (Some 5)  -- Some 8
let result3 = optionalApplicative.map2 Natural Natural Natural add (Some 3) (None Natural)  -- None Natural
```

## Laws
This implementation satisfies all Applicative laws:
- **Identity**: `map2 (\x -> \y -> x) (pure a) v = v`
- **Composition**: Applicative composition laws hold
- **Homomorphism**: `map2 f (pure a) (pure b) = pure (f a b)`
- **Interchange**: Interchange law for applicative functors
-}
let Applicative = ../../Classes/Applicative/Type.dhall

let functor = ./functor.dhall

let pure
    : forall (A : Type) -> A -> Optional A
    = \(A : Type) -> \(a : A) -> Some a

let map2
    : forall (A : Type) ->
      forall (B : Type) ->
      forall (C : Type) ->
      (A -> B -> C) ->
      Optional A ->
      Optional B ->
        Optional C
    = \(A : Type) ->
      \(B : Type) ->
      \(C : Type) ->
      \(f : A -> B -> C) ->
      \(oa : Optional A) ->
      \(ob : Optional B) ->
        merge
          { None = None C
          , Some =
              \(a : A) ->
                merge { None = None C, Some = \(b : B) -> Some (f a b) } ob
          }
          oa

in  { functor, pure, map2 } : Applicative Optional
