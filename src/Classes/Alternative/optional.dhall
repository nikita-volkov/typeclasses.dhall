{-|
Convert an alternative computation to an optional result.

This function attempts to run an alternative computation and wraps the result
in an `Optional`, where success becomes `Some` and failure becomes `None`.

## Parameters
- `F : Type -> Type` - The alternative functor type constructor
- `alternative : Alternative F` - The alternative instance
- `A : Type` - The element type
- `f : F A` - The alternative computation to make optional

## Returns
`F (Optional A)` - A computation that produces `Some value` on success or `None` on failure

## Usage
```dhall
-- For Optional alternative
let computation = Some 42
let result = optional Optional optionalAlternative Natural computation  -- Some (Some 42)

let failing = None Natural
let result2 = optional Optional optionalAlternative Natural failing     -- Some (None Natural)

-- For List alternative
let listComp = [1, 2, 3]
let result3 = optional List listAlternative Natural listComp            -- [Some 1, Some 2, Some 3]

let emptyList = [] : List Natural
let result4 = optional List listAlternative Natural emptyList           -- [None Natural]
```

## Implementation Strategy
Uses `or` to combine:
1. The original computation mapped to `Some` (on success)
2. `pure (None A)` as the fallback (on failure)

This ensures that the computation always succeeds, just with an Optional result.

## Use Cases
- Making potentially failing operations safe
- Providing graceful degradation in error-prone computations
- Converting between different error-handling styles
-}
let Alternative = ./Type.dhall

in  \(F : Type -> Type) ->
    \(alternative : Alternative F) ->
    \(A : Type) ->
    \(f : F A) ->
        alternative.or
          (Optional A)
          ( alternative.applicative.functor.map
              A
              (Optional A)
              (\(a : A) -> Some a)
              f
          )
          (alternative.applicative.pure (Optional A) (None A))
      : F (Optional A)
