{-|
List functor instance.

This instance implements the `Functor` typeclass for `List` values,
allowing functions to be mapped over all elements in a list.

## Implementation
Uses `List/fold` to apply the function to each element and collect results
in reverse order, then reverses the final result.

## Usage
```dhall
let listFunctor = ./functor.dhall
let double = \(x : Natural) -> x * 2

let result1 = listFunctor.map Natural Natural double [1, 2, 3]      -- [2, 4, 6]
let result2 = listFunctor.map Natural Natural double ([] : List Natural)  -- []
```

## Laws
This implementation satisfies all Functor laws:
- **Identity**: `map (\x -> x) = (\x -> x)`
- **Composition**: `map (f ∘ g) = map f ∘ map g`
-}
let Functor = ../../Classes/Functor/Type.dhall

let map
    : forall (A : Type) -> forall (B : Type) -> (A -> B) -> List A -> List B
    = \(A : Type) ->
      \(B : Type) ->
      \(f : A -> B) ->
      \(xs : List A) ->
        List/fold
          A
          xs
          (List B)
          (\(a : A) -> \(acc : List B) -> [ f a ] # acc)
          ([] : List B)

in  { map } : Functor List
