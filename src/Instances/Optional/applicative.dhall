let Applicative = ../../Classes/Applicative/Type.dhall

let functor = ./functor.dhall

let pure
    : forall (A : Type) -> A -> Optional A
    = \(A : Type) -> \(a : A) -> Some a

let map2
    : forall (A : Type) ->
      forall (B : Type) ->
      forall (C : Type) ->
      (A -> B -> C) ->
      Optional A ->
      Optional B ->
        Optional C
    = \(A : Type) ->
      \(B : Type) ->
      \(C : Type) ->
      \(f : A -> B -> C) ->
      \(oa : Optional A) ->
      \(ob : Optional B) ->
        merge
          { None = None C
          , Some =
              \(a : A) ->
                merge { None = None C, Some = \(b : B) -> Some (f a b) } ob
          }
          oa

in  { functor, pure, map2 } : Applicative Optional
