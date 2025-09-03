{-|
# Equality Typeclass Module

This module provides the `Equality` typeclass and related utility functions
for types that support equality comparison.

## Exports

### Type Definition
- **`Type`** - The `Equality` typeclass definition

### Utility Functions
- **`equal`** - Extract and apply the equality function from an instance
- **`notEqual`** - Derived inequality function (negation of `equal`)

## Usage Examples

```dhall
let Equality = ./Equality/package.dhall
let naturalEquality = ../../Instances/Natural/equality.dhall

-- Direct equality check
let isEqual = Equality.equal Natural naturalEquality 5 5  -- True

-- Inequality check
let notEqual = Equality.notEqual Natural naturalEquality 3 7  -- True
```

## Implementation Notes

The `notEqual` function is automatically derived from `equal` by logical negation,
ensuring consistency and reducing the implementation burden for typeclass instances.
-}
let Equality
    : Type -> Type
    = ./Type.dhall

let equal
    : forall (A : Type) -> Equality A -> A -> A -> Bool
    = ./equal.dhall

let notEqual
    : forall (A : Type) -> Equality A -> A -> A -> Bool
    = ./notEqual.dhall

in  { Type = Equality, equal, notEqual }
