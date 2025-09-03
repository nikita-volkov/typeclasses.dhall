{-|
Optional arbitrary value generation instance.

This instance implements the `Arbitrary` typeclass for `Optional` values,
generating `None` approximately 1/3 of the time and `Some` values 2/3 of the time.

## Implementation
Uses modular arithmetic to decide between `None` and `Some`:
- When `(seed + depth) mod 3 = 0` ⟹ generates `None`
- Otherwise ⟹ generates `Some` using the provided arbitrary instance

## Usage
```dhall
let optionalArbitrary = ./arbitrary.dhall
let naturalArbitrary = ../../Natural/arbitrary.dhall

let optionalNaturalArb = optionalArbitrary Natural naturalArbitrary
let result1 = optionalNaturalArb.generate 0 0  -- None Natural (0 mod 3 = 0)
let result2 = optionalNaturalArb.generate 1 0  -- Some 1 (1 mod 3 ≠ 0)
let result3 = optionalNaturalArb.generate 2 1  -- None Natural (3 mod 3 = 0)
```

## Properties
- **Balanced distribution**: Roughly 1/3 `None`, 2/3 `Some` values
- **Deterministic**: Same seed and depth always produce the same result
- **Parameterized**: Uses the element type's arbitrary instance for `Some` values
-}
let Arbitrary = ../../Classes/Arbitrary/Type.dhall

let arbitrary
    : forall (A : Type) -> Arbitrary A -> Arbitrary (Optional A)
    = \(A : Type) ->
      \(arbA : Arbitrary A) ->
        let generate =
              \(seed : Natural) ->
              \(depth : Natural) ->
                let remainder = Natural/subtract (seed + depth) 3

                in  if    Natural/isZero remainder
                    then  None A
                    else  Some (arbA.generate seed depth)

        in  { generate }

in  arbitrary
