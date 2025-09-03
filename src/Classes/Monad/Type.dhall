{-|
The `Monad` typeclass extends `Applicative` with sequential computation and dependency.

Monads allow you to chain computations where each step can depend on the results
of previous steps. This enables modeling of sequential, dependent computations.

## Type Definition

The `Monad` typeclass requires:
- `applicative : Applicative F` - The underlying applicative instance
- `flatMap : forall (A B : Type) -> (A -> F B) -> F A -> F B` - Sequential composition

## Laws

Implementations must satisfy these laws:
- **Left Identity**: `flatMap f (pure x) = f x`
- **Right Identity**: `flatMap pure m = m`
- **Associativity**: `flatMap g (flatMap f m) = flatMap (\(x : A) -> flatMap g (f x)) m`

## Examples

```dhall
-- Sequential computation with dependency
let computation = \(x : Natural) ->
  flatMap
    (\(y : Natural) -> pure (x + y))
    (someComputation x)
```

## Common Instances

- `List` - Non-deterministic computation (list comprehensions)
- `Optional` - Computation that might fail
- `IO` - Sequential I/O operations (not available in pure Dhall)

## Relationship to Other Typeclasses

Monads are the most powerful of the three main typeclasses:
- `Functor` < `Applicative` < `Monad`
- Every `Monad` is an `Applicative`
- Every `Applicative` is a `Functor`
-}
\(F : Type -> Type) ->
  { applicative : ../Applicative/Type.dhall F
  , flatMap : forall (A : Type) -> forall (B : Type) -> (A -> F B) -> F A -> F B
  }
