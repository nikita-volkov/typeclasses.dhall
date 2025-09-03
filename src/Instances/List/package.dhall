{-|
# List Typeclass Instances

This module provides typeclass instances for Dhall's built-in `List` type,
implementing comparison, ordering, and arbitrary value generation.

## Available Instances

### Equality
- **`equality`** - Lexicographic equality for lists (requires element equality)

### Ordering
- **`ordering`** - Lexicographic ordering for lists (requires element ordering)

### Arbitrary
- **`arbitrary`** - Random list generation for testing (requires element generator)

## Parameterization

All instances are **parameterized** - they require typeclass instances for the element type:

```dhall
let ListInstances = ./List/package.dhall
let NaturalInstances = ../Natural/package.dhall

-- Create list instances for Natural elements
let naturalListEquality = ListInstances.equality Natural NaturalInstances.equality
let naturalListOrdering = ListInstances.ordering Natural NaturalInstances.ordering
let naturalListArbitrary = ListInstances.arbitrary Natural naturalArbitraryInstance
```

## Lexicographic Semantics

Both equality and ordering use **lexicographic** (dictionary-style) comparison:
1. Compare elements pairwise from left to right
2. First differing pair determines the result
3. If all compared elements are equal, shorter list is "less"

## Usage Examples

```dhall
-- Equality
let eq = naturalListEquality
let result1 = eq.equal [1, 2, 3] [1, 2, 3]  -- True
let result2 = eq.equal [1, 2] [1, 2, 3]     -- False

-- Ordering
let ord = naturalListOrdering
let result3 = ord.order [1, 2] [1, 3]       -- Order.Less
let result4 = ord.order [1, 2, 3] [1, 2]    -- Order.Greater
let result5 = ord.order [] [1]              -- Order.Less
```
-}
{ arbitrary = ./arbitrary.dhall
, equality = ./equality.dhall
, ordering = ./ordering.dhall
}
