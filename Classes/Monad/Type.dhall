\(F : Type -> Type) ->
  { applicative : ../Applicative/Type.dhall F
  , flatMap : forall (A : Type) -> forall (B : Type) -> (A -> F B) -> F A -> F B
  }
