{-|
Map a function over a list and sequence the results.

This function combines mapping and sequencing in one operation: it applies a
function that produces applicative values to each element of a list, then
sequences the resulting list of applicative values.

## Parameters
- `F : Type -> Type` - The applicative functor type constructor
- `applicative : Applicative F` - The applicative instance
- `A : Type` - The input element type
- `B : Type` - The output element type
- `f : A -> F B` - The function to map over each element
- `list : List A` - The input list

## Returns
`F (List B)` - An applicative computation producing a list of transformed results

## Usage
```dhall
let safeDivide = \(x : Natural) -> if Natural/isZero x then None Natural else Some (10 / x)
let inputs = [1, 2, 5]
let result = traverseList Optional optionalApplicative Natural Natural safeDivide inputs
-- Result: Some [10, 5, 2]

let withZero = [1, 0, 5]
let result2 = traverseList Optional optionalApplicative Natural Natural safeDivide withZero
-- Result: None (List Natural)
```

## Implementation
Combines `List.map` and `sequenceList`:
1. Maps the function over the list to get `List (F B)`
2. Sequences the result to get `F (List B)`

## Relationship to Other Functions
- Equivalent to `sequenceList ∘ List.map f`
- Common pattern in functional programming (traverse = map + sequence)
- More efficient than separate map and sequence operations
-}
let Applicative = ./Type.dhall

let Prelude = ../../Prelude.dhall

let sequenceList = ./sequenceList.dhall

in  \(F : Type -> Type) ->
    \(applicative : Applicative F) ->
    \(A : Type) ->
    \(B : Type) ->
    \(f : A -> F B) ->
    \(list : List A) ->
        sequenceList F applicative B (Prelude.List.map A (F B) f list)
      : F (List B)
