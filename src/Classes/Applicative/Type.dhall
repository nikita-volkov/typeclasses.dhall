{-|
The `Applicative` typeclass extends `Functor` with the ability to apply functions within a context.

Applicatives allow you to work with multiple independent computations in a context,
combining their results. They're more powerful than functors but less powerful than monads.

## Type Definition

The `Applicative` typeclass requires:
- `functor : Functor F` - The underlying functor instance
- `pure : forall (A : Type) -> A -> F A` - Wrap a value in the applicative context
- `map2 : forall (A B C : Type) -> (A -> B -> C) -> F A -> F B -> F C` - Apply a binary function

## Laws

Implementations must satisfy these laws:
- **Identity**: `map2 (\(x : A) -> \(_ : Unit) -> x) fa (pure {}) = fa`
- **Composition**: Complex composition law involving `map2`
- **Homomorphism**: `map2 f (pure x) (pure y) = pure (f x y)`
- **Interchange**: `map2 f (pure x) fy = map2 (\(g : A -> B) -> g x) (pure f) fy`

## Examples

```dhall
-- Combining two independent computations
let result = applicative.map2
  Natural Natural Natural
  (\(x : Natural) -> \(y : Natural) -> x + y)
  (pure 5)
  (pure 3)  -- pure 8
```

## Common Instances

- `List` - Cartesian product of computations
- `Optional` - Succeeds only if both computations succeed
-}
\(F : Type -> Type) ->
  { functor : ../Functor/Type.dhall F
  , pure : forall (A : Type) -> A -> F A
  , map2 :
      forall (A : Type) ->
      forall (B : Type) ->
      forall (C : Type) ->
      (A -> B -> C) ->
      F A ->
      F B ->
        F C
  }
