{-|
# Applicative Typeclass Module

This module provides the `Applicative` typeclass and a comprehensive set of utility
functions for working with applicative computations.

## Exports

### Core Type
- **`Type`** - The `Applicative` typeclass definition

### List Operations
- **`sequenceList`** - Convert `List (F A)` to `F (List A)`
- **`traverseList`** - Map a function and sequence in one step

### Mapping Functions
- **`map0`** through **`map10`** - Apply functions of various arities within applicative context

## Mapping Functions

The `mapN` functions allow you to apply functions of N arguments to N applicative values:

- **`map0`** - Lift a value into applicative context (equivalent to `pure`)
- **`map1`** - Apply unary function (equivalent to `map` from Functor)
- **`map2`** - Apply binary function to two applicative values
- **`map3`** - Apply ternary function to three applicative values
- ... and so on up to **`map10`**

## Usage Examples

```dhall
let Applicative = ./Applicative/package.dhall

-- Apply a binary function
let add = \(x : Natural) -> \(y : Natural) -> x + y
let result = Applicative.map2 F applicativeInstance Natural Natural Natural add fa fb

-- Sequence a list of computations
let computations : List (F Natural) = [fa, fb, fc]
let sequenced : F (List Natural) = Applicative.sequenceList F applicativeInstance Natural computations

-- Traverse with a function
let increment = \(x : Natural) -> pure (x + 1)
let result = Applicative.traverseList F applicativeInstance Natural Natural increment [1, 2, 3]
```

## Implementation Notes

- Higher-arity `mapN` functions are implemented in terms of `map2`, using currying
- `traverseList` is implemented as `map` followed by `sequenceList`
- All functions respect the Applicative laws and maintain proper type safety
-}
let Applicative
    : (Type -> Type) -> Type
    = ./Type.dhall

let sequenceList
    : forall (F : Type -> Type) ->
      Applicative F ->
      forall (A : Type) ->
      List (F A) ->
        F (List A)
    = ./sequenceList.dhall

let traverseList
    : forall (F : Type -> Type) ->
      Applicative F ->
      forall (A : Type) ->
      forall (B : Type) ->
      (A -> F B) ->
      List A ->
        F (List B)
    = ./traverseList.dhall

let map0
    : forall (F : Type -> Type) ->
      Applicative F ->
      forall (A : Type) ->
      A ->
        F A
    = ./map0.dhall

let map1
    : forall (F : Type -> Type) ->
      Applicative F ->
      forall (A : Type) ->
      forall (B : Type) ->
      (A -> B) ->
      F A ->
        F B
    = ./map1.dhall

let map2
    : forall (F : Type -> Type) ->
      Applicative F ->
      forall (A : Type) ->
      forall (B : Type) ->
      forall (C : Type) ->
      (A -> B -> C) ->
      F A ->
      F B ->
        F C
    = ./map2.dhall

let map3
    : forall (F : Type -> Type) ->
      Applicative F ->
      forall (A : Type) ->
      forall (B : Type) ->
      forall (C : Type) ->
      forall (D : Type) ->
      (A -> B -> C -> D) ->
      F A ->
      F B ->
      F C ->
        F D
    = ./map3.dhall

let map4
    : forall (F : Type -> Type) ->
      Applicative F ->
      forall (A : Type) ->
      forall (B : Type) ->
      forall (C : Type) ->
      forall (D : Type) ->
      forall (E : Type) ->
      (A -> B -> C -> D -> E) ->
      F A ->
      F B ->
      F C ->
      F D ->
        F E
    = ./map4.dhall

let map5
    : forall (F : Type -> Type) ->
      Applicative F ->
      forall (A : Type) ->
      forall (B : Type) ->
      forall (C : Type) ->
      forall (D : Type) ->
      forall (E : Type) ->
      forall (G : Type) ->
      (A -> B -> C -> D -> E -> G) ->
      F A ->
      F B ->
      F C ->
      F D ->
      F E ->
        F G
    = ./map5.dhall

let map6
    : forall (F : Type -> Type) ->
      Applicative F ->
      forall (A : Type) ->
      forall (B : Type) ->
      forall (C : Type) ->
      forall (D : Type) ->
      forall (E : Type) ->
      forall (G : Type) ->
      forall (H : Type) ->
      (A -> B -> C -> D -> E -> G -> H) ->
      F A ->
      F B ->
      F C ->
      F D ->
      F E ->
      F G ->
        F H
    = ./map6.dhall

let map7
    : forall (F : Type -> Type) ->
      Applicative F ->
      forall (A : Type) ->
      forall (B : Type) ->
      forall (C : Type) ->
      forall (D : Type) ->
      forall (E : Type) ->
      forall (G : Type) ->
      forall (H : Type) ->
      forall (I : Type) ->
      (A -> B -> C -> D -> E -> G -> H -> I) ->
      F A ->
      F B ->
      F C ->
      F D ->
      F E ->
      F G ->
      F H ->
        F I
    = ./map7.dhall

let map8
    : forall (F : Type -> Type) ->
      Applicative F ->
      forall (A : Type) ->
      forall (B : Type) ->
      forall (C : Type) ->
      forall (D : Type) ->
      forall (E : Type) ->
      forall (G : Type) ->
      forall (H : Type) ->
      forall (I : Type) ->
      forall (J : Type) ->
      (A -> B -> C -> D -> E -> G -> H -> I -> J) ->
      F A ->
      F B ->
      F C ->
      F D ->
      F E ->
      F G ->
      F H ->
      F I ->
        F J
    = ./map8.dhall

let map9
    : forall (F : Type -> Type) ->
      Applicative F ->
      forall (A : Type) ->
      forall (B : Type) ->
      forall (C : Type) ->
      forall (D : Type) ->
      forall (E : Type) ->
      forall (G : Type) ->
      forall (H : Type) ->
      forall (I : Type) ->
      forall (J : Type) ->
      forall (K : Type) ->
      (A -> B -> C -> D -> E -> G -> H -> I -> J -> K) ->
      F A ->
      F B ->
      F C ->
      F D ->
      F E ->
      F G ->
      F H ->
      F I ->
      F J ->
        F K
    = ./map9.dhall

let map10
    : forall (F : Type -> Type) ->
      Applicative F ->
      forall (A : Type) ->
      forall (B : Type) ->
      forall (C : Type) ->
      forall (D : Type) ->
      forall (E : Type) ->
      forall (G : Type) ->
      forall (H : Type) ->
      forall (I : Type) ->
      forall (J : Type) ->
      forall (K : Type) ->
      forall (L : Type) ->
      (A -> B -> C -> D -> E -> G -> H -> I -> J -> K -> L) ->
      F A ->
      F B ->
      F C ->
      F D ->
      F E ->
      F G ->
      F H ->
      F I ->
      F J ->
      F K ->
        F L
    = ./map10.dhall

in  { Type = Applicative
    , sequenceList
    , traverseList
    , map0
    , map1
    , map2
    , map3
    , map4
    , map5
    , map6
    , map7
    , map8
    , map9
    , map10
    }
