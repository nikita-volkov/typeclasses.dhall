{-|
Test if the first value is less than the second using an `Ordering` instance.

## Parameters
- `A : Type` - The type of values to compare
- `ordering : Ordering A` - The ordering instance to use
- `x : A` - The first value
- `y : A` - The second value

## Returns
`True` if `x < y`, `False` otherwise

## Usage
```dhall
let naturalOrdering = ../../Instances/Natural/ordering.dhall
let result = lessThan Natural naturalOrdering 3 5  -- True
```

## Implementation
Pattern matches on the `Order` result, returning `True` only for the `Less` case.
-}
let Ordering = ./Type.dhall

in  \(A : Type) ->
    \(ordering : Ordering A) ->
    \(x : A) ->
    \(y : A) ->
      merge { Less = True, Greater = False, Equal = False } (ordering.order x y)
