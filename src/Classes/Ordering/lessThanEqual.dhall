{-|
Test if the first value is less than or equal to the second using an `Ordering` instance.

## Parameters
- `A : Type` - The type of values to compare
- `ordering : Ordering A` - The ordering instance to use
- `x : A` - The first value
- `y : A` - The second value

## Returns
`True` if `x <= y`, `False` otherwise

## Usage
```dhall
let naturalOrdering = ../../Instances/Natural/ordering.dhall
let result1 = lessThanEqual Natural naturalOrdering 3 5  -- True
let result2 = lessThanEqual Natural naturalOrdering 5 5  -- True
let result3 = lessThanEqual Natural naturalOrdering 7 5  -- False
```

## Implementation
Pattern matches on the `Order` result, returning `True` for both `Less` and `Equal` cases.
-}
let Ordering = ./Type.dhall

in  \(A : Type) ->
    \(ordering : Ordering A) ->
    \(x : A) ->
    \(y : A) ->
      merge { Less = True, Greater = False, Equal = True } (ordering.order x y)
