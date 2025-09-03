{-|
Convert a list of applicative values into an applicative list.

This function transforms `List (F A)` into `F (List A)`, effectively "sequencing"
a list of computations into a single computation that produces a list of results.

## Parameters
- `F : Type -> Type` - The applicative functor type constructor
- `applicative : Applicative F` - The applicative instance
- `A : Type` - The element type
- `list : List (F A)` - The list of applicative values to sequence

## Returns
`F (List A)` - An applicative computation producing a list of results

## Usage
```dhall
let computations = [Some 1, Some 2, Some 3]
let result = sequenceList Optional optionalApplicative Natural computations  -- Some [1, 2, 3]

let withFailure = [Some 1, None Natural, Some 3]
let result2 = sequenceList Optional optionalApplicative Natural withFailure  -- None (List Natural)
```

## Implementation Strategy
Uses `List.fold` to build up the result by:
1. Starting with an empty list wrapped in `pure`
2. Using `map2` to cons each element onto the accumulated list
3. The final result maintains the order of the original list

## Common Use Cases
- Validating a list of inputs (all must succeed)
- Collecting results from multiple independent computations
- Converting imperative-style loops to functional style
-}
let Applicative = ./Type.dhall

let Prelude = ../../Prelude.dhall

in  \(F : Type -> Type) ->
    \(applicative : Applicative F) ->
    \(A : Type) ->
    \(list : List (F A)) ->
      Prelude.List.fold
        (F A)
        list
        (F (List A))
        ( \(element : F A) ->
          \(acc : F (List A)) ->
            applicative.map2
              A
              (List A)
              (List A)
              (\(element : A) -> \(acc : List A) -> [ element ] # acc)
              element
              acc
        )
        (applicative.pure (List A) ([] : List A))
