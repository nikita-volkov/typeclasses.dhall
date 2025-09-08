# Dhall Typeclasses Library

[![Continuous Docs](https://img.shields.io/badge/docs-master-blue)](https://nikita-volkov.github.io/typeclasses.dhall/)

A comprehensive typeclass library for the [Dhall configuration language](https://dhall-lang.org/), providing common functional programming abstractions and their instances for built-in types.

## Overview

This library implements fundamental typeclasses from functional programming, enabling you to write more generic and reusable Dhall code. 

- **`Equality`** - Types that support equality comparison
- **`Ordering`** - Types that support ordering and comparison
- **`Functor`** - Types that can be mapped over (supports `map`)
- **`Applicative`** - Functors that support function application and pure values
- **`Monad`** - Applicatives that support sequential computation via `flatMap`
- **`Alternative`** - Applicatives that support choice and failure
- **`Arbitrary`** - Types that can generate arbitrary/random values for testing

## Installation

To use this library in your Dhall project, you can import it directly from the GitHub repository:

```dhall
https://raw.githubusercontent.com/nikita-volkov/typeclasses.dhall/v1.0.0/src/package.dhall
  sha256:0304dc3df75975b96baaaea82b64dff90bb227128170a262933d062ff5320a22
```

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

## Documentation

Comprehensive API documentation is automatically generated and available at:
[https://nikita-volkov.github.io/typeclasses.dhall/](https://nikita-volkov.github.io/typeclasses.dhall/)

## Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

## License

This project is open source. Please check the repository for license details.
