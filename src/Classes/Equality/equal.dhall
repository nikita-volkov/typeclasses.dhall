{-|
Extract and apply the equality function from an `Equality` instance.

This is a utility function that extracts the `equal` function from an equality
instance and applies it to two values. It's essentially function application
with explicit type parameters.

## Parameters
- `A : Type` - The type of values to compare
- `equality : Equality A` - The equality instance
- `x : A` - The first value to compare
- `y : A` - The second value to compare

## Returns
`True` if the values are equal according to the instance, `False` otherwise

## Usage
```dhall
let naturalEquality = ../../Instances/Natural/equality.dhall
let result = equal Natural naturalEquality 5 5  -- True
```

## Implementation Notes
This function simply extracts the `equal` field from the equality record and
applies it. It serves as a convenience function for consistent API usage.
-}
let Equality = ./Type.dhall

in  \(A : Type) ->
    \(equality : Equality A) ->
    \(x : A) ->
    \(y : A) ->
      equality.equal x y
