{-|
# Ordering Typeclass Module

This module provides the `Ordering` typeclass and comprehensive utility functions
for types that support total ordering and comparison operations.

## Exports

### Core Types
- **`Type`** - The `Ordering` typeclass definition
- **`Order`** - Submodule containing the `Order` result type and utilities

### Conversion Functions
- **`toEquality`** - Convert an `Ordering` instance to an `Equality` instance

### Comparison Functions
- **`equal`** - Test for equality using ordering
- **`notEqual`** - Test for inequality
- **`lessThan`** - Test if first value is less than second
- **`lessThanEqual`** - Test if first value is less than or equal to second
- **`greaterThan`** - Test if first value is greater than second
- **`greaterThanEqual`** - Test if first value is greater than or equal to second

### List Operations
- **`insertIntoDedupedSortedList`** - Insert element into sorted list maintaining order
- **`dedupAndSortList`** - Sort and deduplicate a list using the ordering

## Usage Examples

```dhall
let Ordering = ./Ordering/package.dhall
let naturalOrdering = ../../Instances/Natural/ordering.dhall

-- Basic comparisons
let isLess = Ordering.lessThan Natural naturalOrdering 3 5        -- True
let isGreater = Ordering.greaterThan Natural naturalOrdering 7 2  -- True
let isEqual = Ordering.equal Natural naturalOrdering 4 4          -- True

-- List operations
let sorted = Ordering.dedupAndSortList Natural naturalOrdering [3, 1, 4, 1, 5]
-- Result: [1, 3, 4, 5]
```

## Implementation Notes

All comparison functions are derived from the core `order` function, ensuring
consistency across all operations. The list operations provide efficient
sorting and deduplication based on the ordering.
-}
let Ordering
    : Type -> Type
    = ./Type.dhall

let Order = ./Order/package.dhall

let toEquality
    : forall (A : Type) -> Ordering A -> ../Equality/Type.dhall A
    = ./toEquality.dhall

let equal
    : forall (A : Type) -> Ordering A -> A -> A -> Bool
    = ./equal.dhall

let notEqual
    : forall (A : Type) -> Ordering A -> A -> A -> Bool
    = ./notEqual.dhall

let greaterThan
    : forall (A : Type) -> Ordering A -> A -> A -> Bool
    = ./greaterThan.dhall

let greaterThanEqual
    : forall (A : Type) -> Ordering A -> A -> A -> Bool
    = ./greaterThanEqual.dhall

let lessThan
    : forall (A : Type) -> Ordering A -> A -> A -> Bool
    = ./lessThan.dhall

let lessThanEqual
    : forall (A : Type) -> Ordering A -> A -> A -> Bool
    = ./lessThanEqual.dhall

let insertIntoDedupedSortedList
    : forall (A : Type) -> Ordering A -> A -> List A -> List A
    = ./insertIntoDedupedSortedList.dhall

let dedupAndSortList
    : forall (A : Type) -> Ordering A -> List A -> List A
    = ./dedupAndSortList.dhall

in  { Type = Ordering
    , Order
    , toEquality
    , equal
    , notEqual
    , greaterThan
    , greaterThanEqual
    , lessThan
    , lessThanEqual
    , insertIntoDedupedSortedList
    , dedupAndSortList
    }
