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
