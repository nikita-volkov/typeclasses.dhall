{-|
# Dhall Typeclasses Library - Main Module

This is the main entry point for the Dhall typeclasses library, providing access
to both typeclass definitions and their concrete instances for common types.

## Structure

The library is organized into two main components:

### Classes
Core typeclass definitions that establish the interface contracts:
- `Equality`, `Ordering` - Basic comparison operations
- `Functor`, `Applicative`, `Monad` - Computational abstractions
- `Alternative` - Choice and failure handling
- `Arbitrary` - Random value generation for testing

### Instances
Concrete implementations of the typeclasses for built-in Dhall types:
- `Natural` - Numbers with equality and ordering
- `List` - Collections with equality, ordering, and arbitrary generation
- `NonEmpty` - Non-empty collections with equality and ordering

## Usage

```dhall
let typeclasses = ./package.dhall

-- Access typeclass definitions
let Equality = typeclasses.Classes.Equality.Type
let Ordering = typeclasses.Classes.Ordering.Type

-- Access concrete instances
let naturalEquality = typeclasses.Instances.Natural.equality
let listOrdering = typeclasses.Instances.List.ordering

-- Use in computations
let isEqual = typeclasses.Classes.Equality.equal Natural naturalEquality 5 5  -- True
```

## Design Philosophy

This library follows functional programming principles:
- **Modularity**: Each typeclass is independently defined and composable
- **Reusability**: Instances can be combined to create more complex instances
- **Type Safety**: All operations are fully typed with explicit type parameters
- **Consistency**: All implementations follow their respective mathematical laws
-}
{ Classes = ./Classes/package.dhall, Instances = ./Instances/package.dhall }
