{-|
Combine a list of alternative computations, choosing the first successful one.

This function takes a list of alternative computations and combines them using
the `or` operation, effectively trying each alternative in order until one succeeds.

## Parameters
- `F : Type -> Type` - The alternative functor type constructor
- `alternative : Alternative F` - The alternative instance
- `A : Type` - The element type
- `list : List (F A)` - The list of alternative computations to try

## Returns
`F A` - The result of the first successful computation, or `empty` if all fail

## Usage
```dhall
let computations = [None Natural, Some 42, Some 100]
let result = ors Optional optionalAlternative Natural computations  -- Some 42

let allFail = [None Natural, None Natural, None Natural]
let result2 = ors Optional optionalAlternative Natural allFail      -- None Natural

let listExample = [[] : List Natural, [1, 2], [3, 4]]
let result3 = ors List listAlternative Natural listExample          -- [1, 2, 3, 4]
```

## Implementation Strategy
Uses `List.foldLeft` to combine alternatives from left to right:
1. Starts with `empty` as the initial accumulator
2. Uses `or` to combine each alternative with the accumulator
3. Due to the Alternative laws, the first successful alternative wins

## Common Use Cases
- Trying multiple parsing strategies until one succeeds
- Implementing fallback configuration sources
- Searching through multiple data sources
-}
-- This function takes a list of `F A` values and combines them into a single `F A` value using the `Alternative` instance.
--
-- It chooses the first alternative to succeed, accumulating all the reports produced in the process.
let Alternative = ./Type.dhall

let Prelude = ../../Prelude.dhall

in  \(F : Type -> Type) ->
    \(alternative : Alternative F) ->
    \(A : Type) ->
    \(list : List (F A)) ->
        Prelude.List.foldLeft
          (F A)
          list
          (F A)
          (alternative.or A)
          (alternative.empty A)
      : F A
