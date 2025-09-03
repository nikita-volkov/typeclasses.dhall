{-|
Boolean ordering instance.

This instance implements the `Ordering` typeclass for `Bool` values using
the standard ordering where `False < True`.

## Implementation
Uses conditional logic to establish ordering:
- `False` is considered less than `True`
- Same values are equal

## Usage
```dhall
let boolOrdering = ./ordering.dhall
let result1 = boolOrdering.order False True  -- Order.Less
let result2 = boolOrdering.order True False  -- Order.Greater
let result3 = boolOrdering.order True True   -- Order.Equal
```

## Laws
This implementation satisfies all Ordering laws:
- **Totality**: For any `x`, `y`, exactly one of `order x y` equals `Less`, `Equal`, or `Greater`
- **Reflexivity**: `order x x = Equal` for all booleans `x`
- **Antisymmetry**: If `order x y = Equal`, then `x = y`
- **Transitivity**: Ordering relationships are transitive
-}
let Ordering = ../../Classes/Ordering/Type.dhall

let Order = ../../Classes/Ordering/Order/Type.dhall

let order
    : Bool -> Bool -> Order
    = \(left : Bool) ->
      \(right : Bool) ->
        if    left && (if right then False else True)
        then  Order.Greater
        else  if (if left then False else True) && right
        then  Order.Less
        else  Order.Equal

in  { order } : Ordering Bool
