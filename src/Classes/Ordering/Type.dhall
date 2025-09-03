{-|
The `Ordering` typeclass defines types that support total ordering and comparison.

This typeclass enables sorting, ranking, and all ordering-based operations. It extends
the concept of equality by providing a three-way comparison.

## Type Definition

The `Ordering` typeclass requires:
- `order : A -> A -> Order` - Compares two values and returns `Less`, `Equal`, or `Greater`

Where `Order` is defined as: `< Less | Equal | Greater >`

## Laws

Implementations must satisfy these mathematical laws:
- **Totality**: For any `x` and `y`, exactly one of `Less`, `Equal`, or `Greater` is returned
- **Reflexivity**: `order x x = Equal` for all `x`
- **Antisymmetry**: If `order x y = Equal`, then `order y x = Equal`
- **Transitivity**: If `order x y = Less` and `order y z = Less`, then `order x z = Less`
- **Consistency**: If `order x y = Equal`, then `order x z = order y z` for all `z`

## Examples

```dhall
let naturalOrdering = ../../../Instances/Natural/ordering.dhall
let result = naturalOrdering.order 3 5  -- Order.Less
```
-}
\(A : Type) -> { order : A -> A -> ./Order/Type.dhall }
