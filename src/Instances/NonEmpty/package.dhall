{-|
# NonEmpty List Typeclass Instances

This module provides typeclass instances for Dhall's `NonEmpty` type (non-empty lists),
implementing comparison and ordering operations.

## Available Instances

### Equality
- **`equality`** - Equality for non-empty lists using head and tail comparison

### Ordering
- **`ordering`** - Ordering for non-empty lists using lexicographic comparison

## NonEmpty Structure

Dhall's `NonEmpty` type has the structure:
```dhall
{ head : Element, tail : List Element }
```

This guarantees at least one element while allowing additional elements in the tail.

## Parameterization

Both instances are **parameterized** and require typeclass instances for the element type:

```dhall
let NonEmptyInstances = ./NonEmpty/package.dhall
let NaturalInstances = ../Natural/package.dhall

-- Create non-empty list instances for Natural elements
let naturalNonEmptyEquality = NonEmptyInstances.equality Natural NaturalInstances.equality
let naturalNonEmptyOrdering = NonEmptyInstances.ordering Natural NaturalInstances.ordering
```

## Comparison Strategy

Both equality and ordering use a **head-first** approach:
1. **Head comparison**: Compare the head elements first
2. **Tail comparison**: If heads are equal, compare the tail lists
3. **Early termination**: Different heads determine the result immediately

## Usage Examples

```dhall
-- Equality
let eq = naturalNonEmptyEquality
let ne1 = { head = 1, tail = [2, 3] }
let ne2 = { head = 1, tail = [2, 3] }
let ne3 = { head = 1, tail = [2, 4] }

let result1 = eq.equal ne1 ne2  -- True
let result2 = eq.equal ne1 ne3  -- False

-- Ordering
let ord = naturalNonEmptyOrdering
let result3 = ord.order ne1 ne3  -- Order.Less (because [2, 3] < [2, 4])
```
-}
{ equality = ./equality.dhall, ordering = ./ordering.dhall }
