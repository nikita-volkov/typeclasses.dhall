let Functor = ../../Classes/Functor/Type.dhall

let map
    : forall (A : Type) ->
      forall (B : Type) ->
      (A -> B) ->
      Optional A ->
        Optional B
    = \(A : Type) ->
      \(B : Type) ->
      \(f : A -> B) ->
      \(x : Optional A) ->
        merge { None = None B, Some = \(a : A) -> Some (f a) } x

in  { map } : Functor Optional
