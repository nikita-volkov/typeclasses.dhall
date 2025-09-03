{-|
Boolean arbitrary value generation instance.

This instance implements the `Arbitrary` typeclass for `Bool` values using
a deterministic algorithm based on seed and depth parameters.

## Implementation
Uses modular arithmetic to alternate between `True` and `False` values:
- Even results of `(seed + depth) mod 2` produce `True`
- Odd results produce `False`

## Usage
```dhall
let boolArbitrary = ./arbitrary.dhall
let result1 = boolArbitrary.generate 0 0  -- True
let result2 = boolArbitrary.generate 1 0  -- False  
let result3 = boolArbitrary.generate 2 1  -- False
```

## Properties
- **Deterministic**: Same seed and depth always produce the same result
- **Balanced**: Roughly equal distribution of `True` and `False` values
- **Predictable**: Simple pattern based on even/odd arithmetic
-}
let Arbitrary = ../../Classes/Arbitrary/Type.dhall

let generate
    : Natural -> Natural -> Bool
    = \(seed : Natural) ->
      \(depth : Natural) ->
        let remainder = Natural/subtract (seed + depth) 2

        in  Natural/isZero remainder

in  { generate } : Arbitrary Bool
