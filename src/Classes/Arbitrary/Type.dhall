{-|
Arbitrary typeclass for generating random values given seed and depth.

Requires: `generate : Natural -> Natural -> Value`
-}
\(Value : Type) ->
  { generate : forall (seed : Natural) -> forall (depth : Natural) -> Value }
