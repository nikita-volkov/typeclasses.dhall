{-|
Integer ordering instance.

This instance implements the `Ordering` typeclass for `Integer` values using
Dhall's built-in integer comparison functions.

## Implementation
Uses `Integer/lessThan` from the Dhall Prelude to establish ordering
relationships between integers.

## Usage
```dhall
let integerOrdering = ./ordering.dhall
let result1 = integerOrdering.order -5 +3   -- Order.Less
let result2 = integerOrdering.order +7 +2   -- Order.Greater  
let result3 = integerOrdering.order +4 +4   -- Order.Equal
```

## Laws
This implementation satisfies all Ordering laws:
- **Totality**: For any `x`, `y`, exactly one of `order x y` equals `Less`, `Equal`, or `Greater`
- **Reflexivity**: `order x x = Equal` for all integers `x`
- **Antisymmetry**: If `order x y = Equal`, then `x = y`
- **Transitivity**: Ordering relationships are transitive
-}
let Prelude = ../../Prelude.dhall

let Ordering = ../../Classes/Ordering/Type.dhall

let Order = ../../Classes/Ordering/Order/Type.dhall

let order
    : Integer -> Integer -> Order
    = \(left : Integer) ->
      \(right : Integer) ->
        if    Prelude.Integer.lessThan left right
        then  Order.Less
        else  if Prelude.Integer.lessThan right left
        then  Order.Greater
        else  Order.Equal

in  { order } : Ordering Integer
