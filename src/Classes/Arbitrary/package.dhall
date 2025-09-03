{-|
# Arbitrary Typeclass Module

This module provides the `Arbitrary` typeclass for generating arbitrary/random values,
primarily useful for property-based testing and sample data generation.

## Exports

### Type Definition
- **`Type`** - The `Arbitrary` typeclass definition

### Utility Functions
- **`sample`** - Generate a list of arbitrary values using an instance

## Usage Examples

```dhall
let Arbitrary = ./Arbitrary/package.dhall

-- Assuming we have a Natural arbitrary instance
let naturalArbitrary = { generate = \(seed : Natural) -> \(depth : Natural) -> seed }

-- Generate 5 sample values
let samples = Arbitrary.sample Natural naturalArbitrary 5
-- Result: [0, 1, 2, 3, 4] (using index as seed)
```

## Implementation Strategy

The `sample` function generates values by:
1. Creating a list of the specified size
2. Using the list index as the seed for generation
3. Using depth 0 for maximum complexity
4. Applying the instance's `generate` function

## Testing Applications

This typeclass is particularly valuable for:
- **Property-based testing**: Generate random inputs to test properties
- **Example generation**: Create sample data for documentation
- **Stress testing**: Generate edge cases and boundary conditions
-}
let Arbitrary
    : Type -> Type
    = ./Type.dhall

let sample
    : forall (A : Type) -> Arbitrary A -> Natural -> List A
    = ./sample.dhall

in  { Type = Arbitrary, sample }
