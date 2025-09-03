{-|
Natural number arbitrary value generation instance.

This instance implements the `Arbitrary` typeclass for `Natural` numbers using
division-based generation for mathematically sound value distribution.

## Implementation
Uses division with zero-handling to generate naturals:
- Computes `(seed + depth) / depth` when depth > 0
- Falls back to `seed + depth` when depth = 0 to avoid division by zero
- Provides more predictable value distribution than modulus-based approaches

## Usage
```dhall
let naturalArbitrary = ./arbitrary.dhall
let result1 = naturalArbitrary.generate 10 2  -- 6 (= 12 / 2)
let result2 = naturalArbitrary.generate 7 0   -- 7 (fallback)
let result3 = naturalArbitrary.generate 15 3  -- 6 (= 18 / 3)
```

## Properties
- **Deterministic**: Same seed and depth always produce the same result
- **Mathematically sound**: Uses proper division instead of arbitrary modulus
- **Safe**: Handles division by zero gracefully
- **Predictable**: Value ranges are proportional to input parameters
-}
let Prelude = ../../Prelude.dhall

let Arbitrary = ../../Classes/Arbitrary/Type.dhall

let Natural/div
    : Natural -> Natural -> Optional Natural
    = let quotient =
            https://github.com/jcaesar/dhall-div/releases/download/1/quotient.dhall
              sha256:d6a994f4b431081e877a0beac02f5dcc98f3ea5b027986114487578056cb3db9

      in  \(a : Natural) ->
          \(b : Natural) ->
            if    Prelude.Natural.isZero b
            then  None Natural
            else  Some (quotient a b).q

let generate
    : Natural -> Natural -> Natural
    = \(seed : Natural) ->
      \(depth : Natural) ->
        let divisor = if Prelude.Natural.isZero depth then 1 else depth

        let result = Natural/div (seed + depth) divisor

        in  Prelude.Optional.default Natural (seed + depth) result

in  { generate } : Arbitrary Natural
