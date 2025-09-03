{-|
List alternative instance.

This instance implements the `Alternative` typeclass for `List` values,
providing choice operations via list concatenation.

## Implementation
- **empty**: Returns an empty list
- **or**: Concatenates two lists (left list followed by right list)

## Usage
```dhall
let listAlternative = ./alternative.dhall

let result1 = listAlternative.empty Natural                           -- []
let result2 = listAlternative.or Natural [1, 2] [3, 4]               -- [1, 2, 3, 4]
let result3 = listAlternative.or Natural [] [5, 6]                   -- [5, 6]
let result4 = listAlternative.or Natural [7, 8] []                   -- [7, 8]
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
    : forall (A : Type) -> List A
    = \(A : Type) -> [] : List A

let or
    : forall (A : Type) -> List A -> List A -> List A
    = \(A : Type) -> \(left : List A) -> \(right : List A) -> left # right

in  { applicative, empty, or } : Alternative List
