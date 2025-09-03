{-|
Functor typeclass for types that can be mapped over.

Requires: `map : (A -> B) -> F A -> F B`
-}
\(F : Type -> Type) ->
  { map : forall (A : Type) -> forall (B : Type) -> (A -> B) -> F A -> F B }
