{-|
Test for inequality using an `Equality` instance.

This function provides the logical negation of equality, testing whether
two values are not equal according to the provided equality instance.

## Parameters
- `A : Type` - The type of values to compare
- `equality : Equality A` - The equality instance
- `x : A` - The first value to compare
- `y : A` - The second value to compare

## Returns
`True` if the values are not equal, `False` if they are equal

## Usage
```dhall
let naturalEquality = ../../Instances/Natural/equality.dhall
let result1 = notEqual Natural naturalEquality 3 7  -- True
let result2 = notEqual Natural naturalEquality 5 5  -- False
```

## Implementation
Uses boolean negation of the equality test to derive inequality. This ensures
perfect consistency with the equality function.
-}
let Prelude = ../../Prelude.dhall

let equal = ./equal.dhall

let Equality = ./Type.dhall

in  \(A : Type) ->
    \(equality : Equality A) ->
    \(x : A) ->
    \(y : A) ->
      Prelude.Bool.not (equal A equality x y)
