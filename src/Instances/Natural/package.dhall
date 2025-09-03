{-|
# Natural Number Typeclass Instances

This module provides typeclass instances for Dhall's built-in `Natural` type,
implementing basic comparison and ordering operations.

## Available Instances

### Equality
- **`equality`** - Natural number equality using Dhall's built-in `Natural/equal`

### Ordering
- **`ordering`** - Natural number ordering using standard numeric comparison

## Usage Examples

```dhall
let NaturalInstances = ./Natural/package.dhall

-- Equality operations
let eq = NaturalInstances.equality
let result1 = eq.equal 5 5    -- True
let result2 = eq.equal 3 7    -- False

-- Ordering operations
let ord = NaturalInstances.ordering
let result3 = ord.order 3 7   -- Order.Less
let result4 = ord.order 7 3   -- Order.Greater
let result5 = ord.order 5 5   -- Order.Equal
```

## Implementation Details

### Equality Implementation
Uses Dhall's built-in `Natural/equal` function directly, ensuring consistency
with Dhall's own notion of natural number equality.

### Ordering Implementation
Implements three-way comparison using Dhall's `Natural/lessThan`:
1. If `left < right` then `Order.Less`
2. If `right < left` then `Order.Greater`
3. Otherwise `Order.Equal`

## Law Compliance

Both instances satisfy their respective typeclass laws:
- **Equality laws**: reflexive, symmetric, transitive
- **Ordering laws**: total, reflexive, antisymmetric, transitive
-}
{ equality = ./equality.dhall, ordering = ./ordering.dhall }
