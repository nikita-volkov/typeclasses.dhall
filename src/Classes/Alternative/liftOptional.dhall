{-|
Convert an `Optional A` value into the alternative context.

This function bridges between Dhall's built-in `Optional` type and the generic
`Alternative` typeclass, allowing optional values to be used in alternative computations.

## Parameters
- `F : Type -> Type` - The alternative functor type constructor
- `alternative : Alternative F` - The alternative instance
- `A : Type` - The element type
- `optional : Optional A` - The optional value to lift

## Returns
`F A` - The value lifted into the alternative context

## Behavior
- `Some value` becomes `pure value` (successful computation)
- `None` becomes `empty` (failed computation)

## Usage
```dhall
let maybeValue = Some 42
let result = liftOptional List listAlternative Natural maybeValue  -- [42]

let noValue = None Natural
let result2 = liftOptional List listAlternative Natural noValue    -- [] : List Natural
```

## Use Cases
- Converting configuration defaults from Optional to alternative contexts
- Bridging between partial functions (that return Optional) and alternative computations
- Providing fallback behavior in alternative-based error handling
-}
let Alternative = ./Type.dhall

let Prelude = ../../Prelude.dhall

in  \(F : Type -> Type) ->
    \(alternative : Alternative F) ->
    \(A : Type) ->
    \(optional : Optional A) ->
        Prelude.Optional.fold
          A
          optional
          (F A)
          (\(value : A) -> alternative.applicative.pure A value)
          (alternative.empty A)
      : F A
