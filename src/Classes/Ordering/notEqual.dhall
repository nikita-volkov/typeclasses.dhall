{-|
Test for inequality using an `Ordering` instance.

This function tests whether two values are not equal by checking if the
ordering comparison returns either `Less` or `Greater`.

## Parameters
- `A : Type` - The type of values to compare
- `ordering : Ordering A` - The ordering instance to use
- `left : A` - The first value to compare
- `right : A` - The second value to compare

## Returns
`True` if the values are not equal, `False` if they are equal

## Usage
```dhall
let naturalOrdering = ../../Instances/Natural/ordering.dhall
let result1 = notEqual Natural naturalOrdering 3 7  -- True
let result2 = notEqual Natural naturalOrdering 5 5  -- False
```

## Implementation
Pattern matches on the `Order` result, returning `True` for `Less` and `Greater`,
and `False` for `Equal`.
-}
let Ordering = ./Type.dhall

in  \(A : Type) ->
    \(ordering : Ordering A) ->
    \(left : A) ->
    \(right : A) ->
      merge
        { Less = True, Equal = False, Greater = True }
        (ordering.order left right)
