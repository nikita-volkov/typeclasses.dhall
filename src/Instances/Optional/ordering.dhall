{-|
Optional ordering instance.

This instance implements the `Ordering` typeclass for `Optional` values,
providing parameterized ordering where `None < Some` for any value.

## Implementation
Uses pattern matching to establish ordering relationships:
- `None` compared to `None` ⟹ `Equal`
- `None` compared to `Some _` ⟹ `Less`
- `Some _` compared to `None` ⟹ `Greater`
- `Some a` compared to `Some b` ⟹ `order a b` (using the provided ordering instance)

## Usage
```dhall
let optionalOrdering = ./ordering.dhall
let Natural/ordering = ../../Natural/ordering.dhall

let optionalNaturalOrd = optionalOrdering Natural Natural/ordering
let result1 = optionalNaturalOrd.order (None Natural) (Some 5)      -- Order.Less
let result2 = optionalNaturalOrd.order (Some 3) (None Natural)      -- Order.Greater
let result3 = optionalNaturalOrd.order (Some 2) (Some 7)            -- Order.Less
```

## Laws
This implementation satisfies all Ordering laws when the element ordering does:
- **Totality**: For any `x`, `y`, exactly one of `order x y` equals `Less`, `Equal`, or `Greater`
- **Reflexivity**: `order x x = Equal` for all optional values `x`
- **Antisymmetry**: If `order x y = Equal`, then `x = y`
- **Transitivity**: Ordering relationships are transitive
-}
let Ordering = ../../Classes/Ordering/Type.dhall

let Order = ../../Classes/Ordering/Order/Type.dhall

let ordering
    : forall (A : Type) -> Ordering A -> Ordering (Optional A)
    = \(A : Type) ->
      \(ordA : Ordering A) ->
        let order =
              \(left : Optional A) ->
              \(right : Optional A) ->
                merge
                  { None =
                      merge
                        { None = Order.Equal, Some = \(_ : A) -> Order.Less }
                        right
                  , Some =
                      \(a : A) ->
                        merge
                          { None = Order.Greater
                          , Some = \(b : A) -> ordA.order a b
                          }
                          right
                  }
                  left

        in  { order }

in  ordering
