{-|
List applicative instance.

This instance implements the `Applicative` typeclass for `List` values,
enabling function application across list elements (Cartesian product behavior).

## Implementation
- **pure**: Creates a singleton list containing the value
- **map2**: Applies a binary function to all combinations of elements from two lists

## Usage
```dhall
let listApplicative = ./applicative.dhall
let add = \(x : Natural) -> \(y : Natural) -> x + y

let result1 = listApplicative.pure Natural 42                           -- [42]
let result2 = listApplicative.map2 Natural Natural Natural add [1, 2] [10, 20]  -- [11, 21, 12, 22]
let result3 = listApplicative.map2 Natural Natural Natural add [] [1, 2]        -- []
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
    : forall (A : Type) -> A -> List A
    = \(A : Type) -> \(a : A) -> [ a ]

let map2
    : forall (A : Type) ->
      forall (B : Type) ->
      forall (C : Type) ->
      (A -> B -> C) ->
      List A ->
      List B ->
        List C
    = \(A : Type) ->
      \(B : Type) ->
      \(C : Type) ->
      \(f : A -> B -> C) ->
      \(list : List A) ->
      \(bs : List B) ->
        List/fold
          A
          list
          (List C)
          ( \(a : A) ->
            \(acc : List C) ->
              List/fold
                B
                bs
                (List C)
                (\(b : B) -> \(acc2 : List C) -> [ f a b ] # acc2)
                acc
          )
          ([] : List C)

in  { functor, pure, map2 } : Applicative List
