let Monad = ../../Classes/Monad/Type.dhall

let applicative = ./applicative.dhall

let flatMap
    : forall (A : Type) -> forall (B : Type) -> (A -> Optional B) -> Optional A -> Optional B
    = \(A : Type) -> \(B : Type) -> \(f : A -> Optional B) -> \(oa : Optional A) ->
        merge
          { None = None B
          , Some = \(a : A) -> f a
          }
          oa

in  { applicative, flatMap } : Monad Optional