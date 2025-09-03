{-|
The `Arbitrary` typeclass defines types that can generate arbitrary/random values.

This typeclass is primarily useful for property-based testing and generating
sample data. It provides a way to create values of any type given a seed and depth.

## Type Definition

The `Arbitrary` typeclass requires:
- `generate : forall (seed : Natural) -> forall (depth : Natural) -> Value`

## Parameters

- **seed**: Used to control the randomness/variety of generated values
- **depth**: Controls the complexity/size of generated values
  - At depth 0: Most complex values
  - At depth 1: Less complex values
  - Higher depths: Progressively simpler values

## Usage Patterns

The depth parameter is crucial for avoiding infinite generation in recursive types:
- Lists become shorter at higher depths
- Trees become shallower at higher depths
- Eventually terminating at some maximum depth

## Examples

```dhall
-- Generate a list of arbitrary naturals
let naturalArbitrary = { generate = \(seed : Natural) -> \(depth : Natural) -> seed }
let sample = Arbitrary.sample Natural naturalArbitrary 5  -- Generate 5 values
```

## Common Implementations

- **Primitive types**: Use seed directly or with simple transformations
- **Composite types**: Combine generators from constituent types
- **Recursive types**: Use depth to ensure termination
-}
-- Typeclass for generating arbitrary values of a given type.
--
-- Depth is used to control the complexity of the generated values.
-- At depth 0 it's most complex. At 1 it's less complex, and so on.
\(Value : Type) ->
  { generate : forall (seed : Natural) -> forall (depth : Natural) -> Value }
