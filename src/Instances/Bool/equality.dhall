{-|
Boolean equality instance.

This instance implements the `Equality` typeclass for `Bool` values using
direct boolean comparison.

## Implementation
Uses logical equivalence to determine equality: two booleans are equal if
they have the same truth value.

## Usage
```dhall
let boolEquality = ./equality.dhall
let result1 = boolEquality.equal True True    -- True
let result2 = boolEquality.equal False False  -- True
let result3 = boolEquality.equal True False   -- False
```

## Laws
This implementation satisfies all Equality laws:
- **Reflexivity**: `equal x x = True` for all booleans `x`
- **Symmetry**: `equal x y = equal y x` for all booleans `x`, `y`
- **Transitivity**: If `equal x y = True` and `equal y z = True`, then `equal x z = True`
-}
let Equality = ../../Classes/Equality/Type.dhall

let equal
    : Bool -> Bool -> Bool
    = \(left : Bool) ->
      \(right : Bool) ->
        if left then right else if right then False else True

in  { equal } : Equality Bool
