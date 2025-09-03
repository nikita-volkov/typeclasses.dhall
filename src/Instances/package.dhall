{-|
# Typeclass Instances Module

This module provides concrete implementations of the typeclasses for built-in
Dhall types and common data structures.

## Available Instances

### Natural Numbers
- **`Natural.equality`** - Natural number equality comparison
- **`Natural.ordering`** - Natural number ordering (standard numeric ordering)

### Lists
- **`List.equality`** - Lexicographic equality for lists
- **`List.ordering`** - Lexicographic ordering for lists
- **`List.arbitrary`** - Arbitrary list generation for testing

### Non-Empty Lists
- **`NonEmpty.equality`** - Equality for non-empty lists
- **`NonEmpty.ordering`** - Ordering for non-empty lists

## Usage Examples

```dhall
let Instances = ./Instances/package.dhall

-- Natural number operations
let naturalEq = Instances.Natural.equality
let isEqual = naturalEq.equal 5 5  -- True

let naturalOrd = Instances.Natural.ordering
let isLess = naturalOrd.order 3 7  -- Order.Less

-- List operations
let listEq = Instances.List.equality Natural naturalEq
let listsEqual = listEq.equal [1, 2, 3] [1, 2, 3]  -- True

let listOrd = Instances.List.ordering Natural naturalOrd
let listComparison = listOrd.order [1, 2] [1, 3]  -- Order.Less
```

## Implementation Notes

- All instances are **parameterized** - they take element typeclass instances as arguments
- List and NonEmpty instances are **polymorphic** - they work with any element type
- Natural instances are **concrete** - they work directly with Natural numbers
- All implementations satisfy their respective typeclass laws
-}
{ Natural = ./Natural/package.dhall
, List = ./List/package.dhall
, NonEmpty = ./NonEmpty/package.dhall
}
