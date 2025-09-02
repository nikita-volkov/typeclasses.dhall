let Alternative = ./Type.dhall

let liftOptional
    : forall (F : Type -> Type) ->
      Alternative F ->
      forall (A : Type) ->
      Optional A ->
        F A
    = ./liftOptional.dhall

let ors
    : forall (F : Type -> Type) ->
      Alternative F ->
      forall (A : Type) ->
      List (F A) ->
        F A
    = ./ors.dhall

let optional
    : forall (F : Type -> Type) ->
      Alternative F ->
      forall (A : Type) ->
      F A ->
        F (Optional A)
    = ./optional.dhall

in  { Type = Alternative, liftOptional, ors, optional }
