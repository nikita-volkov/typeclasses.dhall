{-|
The `Equality` typeclass defines types that support equality comparison.

This typeclass provides a foundation for comparing values of the same type for equality.
It's the basis for many other operations and is implemented for most basic types.

## Type Definition

The `Equality` typeclass requires a single method:
- `equal : A -> A -> Bool` - Tests whether two values of type `A` are equal

## Laws

Implementations must satisfy these mathematical laws:
- **Reflexivity**: `equal x x = True` for all `x`
- **Symmetry**: `equal x y = equal y x` for all `x` and `y`
- **Transitivity**: If `equal x y = True` and `equal y z = True`, then `equal x z = True`

## Examples

```dhall
let naturalEquality = ../../../Instances/Natural/equality.dhall
let result = naturalEquality.equal 5 5  -- True
```
-}
\(A : Type) -> { equal : A -> A -> Bool }
