\(F : Type -> Type) ->
  { applicative : ../Applicative/Type.dhall F
  , empty : forall (A : Type) -> F A
  , or : forall (A : Type) -> F A -> F A -> F A
  }
