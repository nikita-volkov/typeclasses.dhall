{-|
List monad instance.

This instance implements the `Monad` typeclass for `List` values,
enabling sequential composition that flattens nested lists.

## Implementation
- **flatMap**: Applies a function to each element, producing lists, then concatenates all results
- Built on the applicative instance for consistency

## Usage
```dhall
let listMonad = ./monad.dhall
let replicate = \(x : Natural) -> [x, x, x]

let result1 = listMonad.flatMap Natural Natural replicate [1, 2]      -- [1, 1, 1, 2, 2, 2]
let result2 = listMonad.flatMap Natural Natural replicate []          -- []
let result3 = listMonad.flatMap Natural Natural (\(x : Natural) -> [] : List Natural) [1, 2]  -- []
```

## Laws
This implementation satisfies all Monad laws:
- **Left Identity**: `flatMap f (pure a) = f a`
- **Right Identity**: `flatMap pure m = m`
- **Associativity**: `flatMap g (flatMap f m) = flatMap (\x -> flatMap g (f x)) m`
-}
let Monad = ../../Classes/Monad/Type.dhall

let applicative = ./applicative.dhall

let flatMap
    : forall (A : Type) ->
      forall (B : Type) ->
      (A -> List B) ->
      List A ->
        List B
    = \(A : Type) ->
      \(B : Type) ->
      \(f : A -> List B) ->
      \(list : List A) ->
        List/fold
          A
          list
          (List B)
          (\(a : A) -> \(acc : List B) -> f a # acc)
          ([] : List B)

in  { applicative, flatMap } : Monad List
