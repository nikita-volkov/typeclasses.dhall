-- Typeclass for generating arbitrary values of a given type.
--
-- Depth is used to control the complexity of the generated values.
-- At depth 0 it's most complex. At 1 it's less complex, and so on.
\(Value : Type) ->
  { generate : forall (seed : Natural) -> forall (depth : Natural) -> Value }
