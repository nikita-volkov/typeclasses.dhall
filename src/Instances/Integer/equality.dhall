{-|
Integer equality instance.

This instance implements the `Equality` typeclass for `Integer` values using
Dhall's built-in integer equality function.

## Implementation
Uses `Integer/equal` directly from the Dhall Prelude, ensuring consistency
with Dhall's own notion of integer equality.

## Usage
```dhall
let integerEquality = ./equality.dhall
let result1 = integerEquality.equal +5 +5    -- True
let result2 = integerEquality.equal -3 -3    -- True
let result3 = integerEquality.equal +2 -2    -- False
```

## Laws
This implementation satisfies all Equality laws:
- **Reflexivity**: `equal x x = True` for all integers `x`
- **Symmetry**: `equal x y = equal y x` for all integers `x`, `y`
- **Transitivity**: If `equal x y = True` and `equal y z = True`, then `equal x z = True`
-}
let Prelude = ../../Prelude.dhall

let Equality = ../../Classes/Equality/Type.dhall

let equal = Prelude.Integer.equal

in  { equal } : Equality Integer
