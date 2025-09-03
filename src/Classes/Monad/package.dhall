{-|
# Monad Typeclass Module

This module provides the `Monad` typeclass definition for types that support
sequential, dependent computation.

## Exports

### Type Definition
- **`Type`** - The `Monad` typeclass definition

## Usage Examples

```dhall
let Monad = ./Monad/package.dhall

-- Using a monad instance (hypothetical Optional example)
let optionalMonad : Monad.Type Optional =
  { applicative = optionalApplicative
  , flatMap = \(A : Type) -> \(B : Type) -> \(f : A -> Optional B) -> \(opt : Optional A) ->
      merge { None = None B, Some = f } opt
  }

-- Sequential computation with dependency
let computation = \(x : Natural) ->
  optionalMonad.flatMap
    Natural Natural
    (\(y : Natural) -> Some (x + y))
    (someComputation x)
```

## Design Philosophy

The `Monad` typeclass is deliberately minimal, containing only the essential `flatMap`
operation alongside the required `Applicative` instance. This design encourages
composition and reuse of existing `Applicative` functionality.

## Common Patterns

Monads enable several important patterns:
- **Do notation** (in languages that support it)
- **Error handling** with short-circuiting
- **State threading** through computations
- **Resource management** with proper cleanup
-}
let Monad
    : (Type -> Type) -> Type
    = ./Type.dhall

in  { Type = Monad }
