{-|
Optional equality instance.

This instance implements the `Equality` typeclass for `Optional` values,
providing parameterized equality that requires an equality instance for the wrapped type.

## Implementation
Uses pattern matching to handle all Optional value combinations:
- `None = None` ⟹ `True`
- `None = Some _` ⟹ `False`
- `Some _ = None` ⟹ `False`
- `Some a = Some b` ⟹ `equal a b` (using the provided equality instance)

## Usage
```dhall
let optionalEquality = ./equality.dhall
let Natural/equal = ../../Natural/equality.dhall

let optionalNaturalEq = optionalEquality Natural Natural/equal
let result1 = optionalNaturalEq.equal (None Natural) (None Natural)     -- True
let result2 = optionalNaturalEq.equal (Some 5) (Some 5)                 -- True
let result3 = optionalNaturalEq.equal (Some 3) (None Natural)           -- False
```

## Laws
This implementation satisfies all Equality laws when the element equality does:
- **Reflexivity**: `equal x x = True` for all optional values `x`
- **Symmetry**: `equal x y = equal y x` for all optional values `x`, `y`
- **Transitivity**: If `equal x y = True` and `equal y z = True`, then `equal x z = True`
-}
let Equality = ../../Classes/Equality/Type.dhall

let equality
    : forall (A : Type) -> Equality A -> Equality (Optional A)
    = \(A : Type) ->
      \(eqA : Equality A) ->
        let equal =
              \(left : Optional A) ->
              \(right : Optional A) ->
                merge
                  { None = merge { None = True, Some = \(_ : A) -> False } right
                  , Some =
                      \(a : A) ->
                        merge
                          { None = False, Some = \(b : A) -> eqA.equal a b }
                          right
                  }
                  left

        in  { equal }

in  equality
