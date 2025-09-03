{-|
The `Functor` typeclass defines types that can be mapped over.

A functor represents a computational context that allows you to apply a function
to the values inside without changing the structure of the context.

## Type Definition

The `Functor` typeclass requires:
- `map : forall (A : Type) -> forall (B : Type) -> (A -> B) -> F A -> F B`

## Laws

Implementations must satisfy these laws:
- **Identity**: `map (\(x : A) -> x) = \(fa : F A) -> fa`
- **Composition**: `map (g ∘ f) = map g ∘ map f` where `∘` is function composition

## Examples

```dhall
-- Mapping over a List (hypothetical List functor instance)
let listFunctor = { map = List.map }
let increment = \(x : Natural) -> x + 1
let result = listFunctor.map Natural Natural increment [1, 2, 3]  -- [2, 3, 4]
```

## Common Instances

- `List` - Maps over each element in the list
- `Optional` - Maps over the value if present, otherwise returns `None`
-}
\(F : Type -> Type) ->
  { map : forall (A : Type) -> forall (B : Type) -> (A -> B) -> F A -> F B }
