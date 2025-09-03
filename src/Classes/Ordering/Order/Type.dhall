{-|
The `Order` type represents the result of a three-way comparison between two values.

This is the core type returned by ordering operations, providing a complete
characterization of the relationship between two comparable values.

## Constructors

- `Less` - The first value is less than the second value
- `Equal` - The two values are equal according to the ordering
- `Greater` - The first value is greater than the second value

## Usage

This type is typically used as the return value of comparison functions
and can be pattern-matched using `merge` to handle all three cases.

## Examples

```dhall
let result = Order.Less
let isLessThan = merge { Less = True, Equal = False, Greater = False } result
```
-}
< Less | Equal | Greater >
