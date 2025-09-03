{-|
Natural number equality instance.

This instance implements the `Equality` typeclass for `Natural` numbers using
Dhall's built-in equality function.

## Implementation
Uses `Natural/equal` directly from the Dhall Prelude, ensuring consistency
with Dhall's own notion of natural number equality.

## Usage
```dhall
let naturalEquality = ./equality.dhall
let result1 = naturalEquality.equal 5 5    -- True
let result2 = naturalEquality.equal 3 7    -- False
let result3 = naturalEquality.equal 0 0    -- True
```

## Laws
This implementation satisfies all Equality laws:
- **Reflexivity**: `equal x x = True` for all naturals `x`
- **Symmetry**: `equal x y = equal y x` for all naturals `x`, `y`
- **Transitivity**: If `equal x y = True` and `equal y z = True`, then `equal x z = True`
-}
let Prelude = ../../Prelude.dhall

let Equality = ../../Classes/Equality/Type.dhall

let equal = Prelude.Natural.equal

in  { equal } : Equality Natural
