{-|
Optional monad instance.

This instance implements the `Monad` typeclass for `Optional` values,
enabling sequential composition of optional computations.

## Implementation
- **flatMap**: Chains optional computations, returning `None` if the input is `None`, otherwise applying the function
- Built on the applicative instance for consistency

## Usage
```dhall
let optionalMonad = ./monad.dhall
let safeDivide = \(x : Natural) -> \(y : Natural) -> 
  if Natural/isZero y then None Natural else Some (Natural/subtract x y)

let result1 = optionalMonad.flatMap Natural Natural (safeDivide 10) (Some 2)        -- Some 8
let result2 = optionalMonad.flatMap Natural Natural (safeDivide 10) (None Natural)  -- None Natural
let result3 = optionalMonad.flatMap Natural Natural (safeDivide 10) (Some 0)       -- None Natural
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
      (A -> Optional B) ->
      Optional A ->
        Optional B
    = \(A : Type) ->
      \(B : Type) ->
      \(f : A -> Optional B) ->
      \(oa : Optional A) ->
        merge { None = None B, Some = \(a : A) -> f a } oa

in  { applicative, flatMap } : Monad Optional
