{-|
The `Alternative` typeclass extends `Applicative` with choice and failure.

Alternatives represent computations that can fail or provide multiple results,
with operations to combine alternatives and handle failure cases.

## Type Definition

The `Alternative` typeclass requires:
- `applicative : Applicative F` - The underlying applicative instance
- `empty : forall (A : Type) -> F A` - The failed/empty computation
- `or : forall (A : Type) -> F A -> F A -> F A` - Choose between two alternatives

## Laws

Implementations must satisfy these laws:
- **Left Identity**: `or (empty A) x = x`
- **Right Identity**: `or x (empty A) = x`
- **Associativity**: `or x (or y z) = or (or x y) z`

## Examples

```dhall
-- Trying multiple alternatives until one succeeds
let result = or (or computation1 computation2) computation3
```

## Common Instances

- `List` - Non-deterministic choice (concatenation for `or`, empty list for `empty`)
- `Optional` - Optional values (`None` for `empty`, first `Some` for `or`)

## Typical Usage Patterns

- **Parser Combinators**: Try different parsing alternatives
- **Validation**: Collect multiple validation errors
- **Configuration**: Provide fallback options
-}
\(F : Type -> Type) ->
  { applicative : ../Applicative/Type.dhall F
  , empty : forall (A : Type) -> F A
  , or : forall (A : Type) -> F A -> F A -> F A
  }
