{-|
# Dhall Typeclasses - Core Classes Module

This module exports all the fundamental typeclass definitions used throughout
the Dhall typeclasses library.

## Exported Typeclasses

### Basic Typeclasses
- **`Equality`** - Types supporting equality comparison (`==`, `!=`)
- **`Ordering`** - Types supporting total ordering (`<`, `>`, `<=`, `>=`)
- **`Arbitrary`** - Types that can generate random/arbitrary values for testing

### Functorial Typeclasses
- **`Functor`** - Types that can be mapped over (`map`)
- **`Applicative`** - Functors with independent parallel composition (`pure`, `map2`)
- **`Monad`** - Applicatives with dependent sequential composition (`flatMap`)
- **`Alternative`** - Applicatives with choice and failure (`empty`, `or`)

## Usage

```dhall
let Classes = ./Classes/package.dhall

-- Use specific typeclass
let myEquality : Classes.Equality Natural = naturalEqualityInstance

-- Access type definitions
let OrderResult : Type = Classes.Ordering.Order.Type
```

## Type Hierarchy

```
Functor
  ↓
Applicative
  ↓
Monad

Applicative
  ↓
Alternative
```

Each typeclass builds upon the previous ones, providing increasingly powerful abstractions.
-}
{ Equality = ./Equality/package.dhall
, Ordering = ./Ordering/package.dhall
, Arbitrary = ./Arbitrary/package.dhall
, Functor = ./Functor/package.dhall
, Applicative = ./Applicative/package.dhall
, Monad = ./Monad/package.dhall
, Alternative = ./Alternative/package.dhall
}
