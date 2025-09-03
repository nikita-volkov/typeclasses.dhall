{-|
Optional alternative instance.

This instance implements the `Alternative` typeclass for `Optional` values,
providing choice operations and an empty value.

## Implementation
- **empty**: Returns `None` for any type
- **or**: Left-biased choice - returns the first `Some` value, or `None` if both are `None`

## Usage
```dhall
let optionalAlternative = ./alternative.dhall

let result1 = optionalAlternative.empty Natural                           -- None Natural
let result2 = optionalAlternative.or Natural (Some 3) (Some 5)            -- Some 3
let result3 = optionalAlternative.or Natural (None Natural) (Some 7)      -- Some 7
let result4 = optionalAlternative.or Natural (None Natural) (None Natural) -- None Natural
```

## Laws
This implementation satisfies all Alternative laws:
- **Left Identity**: `or empty x = x`
- **Right Identity**: `or x empty = x`
- **Associativity**: `or (or x y) z = or x (or y z)`
- **Annihilation**: `map f empty = empty`
-}
let Alternative = ../../Classes/Alternative/Type.dhall

let applicative = ./applicative.dhall

let empty
    : forall (A : Type) -> Optional A
    = \(A : Type) -> None A

let or
    : forall (A : Type) -> Optional A -> Optional A -> Optional A
    = \(A : Type) ->
      \(left : Optional A) ->
      \(right : Optional A) ->
        merge { None = right, Some = \(a : A) -> Some a } left

in  { applicative, empty, or } : Alternative Optional
