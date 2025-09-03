{-|
Apply a binary function to two applicative values.

This function applies a two-argument function to values inside applicative contexts,
combining them according to the applicative's semantics. This is the core operation
that distinguishes `Applicative` from `Functor`.

## Parameters
- `F : Type -> Type` - The applicative functor type constructor
- `applicative : Applicative F` - The applicative instance
- `A : Type` - The first input type
- `B : Type` - The second input type
- `C : Type` - The output type
- `f : A -> B -> C` - The binary function to apply
- `fa : F A` - The first applicative value
- `fb : F B` - The second applicative value

## Returns
`F C` - The result of applying the function to both values within the applicative context

## Usage
```dhall
let add = \(x : Natural) -> \(y : Natural) -> x + y
let result = map2 Optional optionalApplicative Natural Natural Natural add (Some 3) (Some 5)  -- Some 8
```

## Relationship to Other Functions
- Directly uses `applicative.map2`
- Foundation for all higher-arity mapping functions (map3, map4, ...)
- Core distinguishing operation of `Applicative` typeclass
-}
let Applicative = ./Type.dhall

in  \(F : Type -> Type) ->
    \(applicative : Applicative F) ->
    \(A : Type) ->
    \(B : Type) ->
    \(C : Type) ->
    \(f : A -> B -> C) ->
    \(fa : F A) ->
    \(fb : F B) ->
      applicative.map2 A B C f fa fb
