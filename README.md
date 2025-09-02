# Dhall Typeclasses Library

[![Continuous Docs](https://img.shields.io/badge/docs-master-blue)](https://nikita-volkov.github.io/typeclasses.dhall/)

A comprehensive typeclass library for the [Dhall configuration language](https://dhall-lang.org/), providing common functional programming abstractions and their instances for built-in and custom types.

## Overview

This library implements fundamental typeclasses from functional programming, enabling you to write more generic and reusable Dhall code. It provides both the typeclass definitions and instances for common types like `List`, `Natural`, and `NonEmpty`.

## Installation

To use this library in your Dhall project, you can import it directly from the GitHub repository:

```dhall
let typeclasses = https://raw.githubusercontent.com/nikita-volkov/typeclasses.dhall/master/src/package.dhall

in typeclasses
```

For a specific version, use a tagged release:

```dhall
let typeclasses = https://raw.githubusercontent.com/nikita-volkov/typeclasses.dhall/v1.0.0/src/package.dhall

in typeclasses
```

## Available Typeclasses

### Core Typeclasses

- **`Equality`** - Types that support equality comparison
- **`Ordering`** - Types that support ordering and comparison
- **`Functor`** - Types that can be mapped over (supports `map`)
- **`Applicative`** - Functors that support function application and pure values
- **`Monad`** - Applicatives that support sequential computation via `flatMap`
- **`Alternative`** - Applicatives that support choice and failure
- **`Arbitrary`** - Types that can generate arbitrary/random values for testing

### Usage Examples

```dhall
let typeclasses = ./src/package.dhall

-- Using Functor to map over a List
let listFunctor = typeclasses.Instances.List.functor
let numbers = [1, 2, 3]
let doubled = listFunctor.map Natural Natural (\(x: Natural) -> x * 2) numbers
-- Result: [2, 4, 6]

-- Using Applicative to combine values
let listApplicative = typeclasses.Instances.List.applicative
let addFunction = \(x: Natural) -> \(y: Natural) -> x + y
let list1 = [1, 2]
let list2 = [10, 20]
let combined = listApplicative.map2 Natural Natural Natural addFunction list1 list2
-- Result: [11, 21, 12, 22]
```

## Available Instances

### List Instances
- `Equality` - Compare lists for equality
- `Ordering` - Lexicographic ordering of lists
- `Arbitrary` - Generate arbitrary lists for testing

### Natural Instances
- `Equality` - Natural number equality
- `Ordering` - Natural number ordering
- `Arbitrary` - Generate arbitrary natural numbers

### NonEmpty Instances
- Various typeclass instances for non-empty data structures

## Type Definitions

### Functor
```dhall
\(F : Type -> Type) ->
  { map : forall (A : Type) -> forall (B : Type) -> (A -> B) -> F A -> F B }
```

### Applicative
```dhall
\(F : Type -> Type) ->
  { functor : Functor F
  , pure : forall (A : Type) -> A -> F A
  , map2 : forall (A : Type) -> forall (B : Type) -> forall (C : Type) -> 
           (A -> B -> C) -> F A -> F B -> F C
  }
```

### Monad
```dhall
\(F : Type -> Type) ->
  { applicative : Applicative F
  , flatMap : forall (A : Type) -> forall (B : Type) -> (A -> F B) -> F A -> F B
  }
```

## Project Structure

```
src/
├── package.dhall          -- Main package exports
├── Prelude.dhall         -- Dhall Prelude reference
├── Classes/              -- Typeclass definitions
│   ├── Functor/
│   ├── Applicative/
│   ├── Monad/
│   ├── Alternative/
│   ├── Equality/
│   ├── Ordering/
│   └── Arbitrary/
└── Instances/            -- Typeclass instances
    ├── List/
    ├── Natural/
    └── NonEmpty/
```

## Documentation

Comprehensive API documentation is automatically generated and available at:
[https://nikita-volkov.github.io/typeclasses.dhall/](https://nikita-volkov.github.io/typeclasses.dhall/)

## Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

## License

This project is open source. Please check the repository for license details.
