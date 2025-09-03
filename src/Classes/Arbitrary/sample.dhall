{-|
Generate a list of arbitrary sample values using an `Arbitrary` instance.

This is the primary function for generating test data or examples using the
`Arbitrary` typeclass. It creates a list of values by varying the seed parameter
while keeping the depth constant.

## Parameters
- `A : Type` - The type for which to generate samples
- `instance : Arbitrary A` - The arbitrary instance defining how to generate values
- `size : Natural` - The number of sample values to generate

## Returns
`List A` - A list containing `size` generated values

## Usage
```dhall
-- Assuming we have a Natural arbitrary instance
let naturalArbitrary = { generate = \(seed : Natural) -> \(depth : Natural) -> seed }

-- Generate 5 sample values
let samples = sample Natural naturalArbitrary 5
-- Result: [0, 1, 2, 3, 4] (using index as seed)
```

## Implementation Strategy
Uses `List.generate` to create values by:
1. Creating indices from 0 to size-1
2. Using each index as the seed parameter
3. Using depth 0 for maximum complexity
4. Applying the instance's `generate` function

## Typical Usage Patterns
- **Property-based testing**: Generate random inputs for testing properties
- **Example generation**: Create sample data for documentation or demos
- **Performance testing**: Generate datasets of varying sizes
- **Edge case discovery**: Use different seeds to explore the value space

## Depth Parameter
The sample function uses depth 0, which requests the most complex values
the generator can produce. For recursive types, this might mean:
- Longest possible lists
- Deepest possible tree structures
- Most complex nested data structures
-}
-- This is the main function that generates a sample of arbitrary values
-- of type A using the provided instance of the Arbitrary typeclass.
-- The size parameter controls how many values to generate.
let Prelude = ../../Prelude.dhall

let Self = ./Type.dhall

in  \(A : Type) ->
    \(instance : Self A) ->
    \(size : Natural) ->
        Prelude.List.generate
          size
          A
          (\(index : Natural) -> instance.generate index 0)
      : List A
