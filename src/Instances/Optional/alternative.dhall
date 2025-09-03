let Alternative = ../../Classes/Alternative/Type.dhall

let applicative = ./applicative.dhall

let empty
    : forall (A : Type) -> Optional A
    = \(A : Type) -> None A

let or
    : forall (A : Type) -> Optional A -> Optional A -> Optional A
    = \(A : Type) -> \(left : Optional A) -> \(right : Optional A) ->
        merge
          { None = right
          , Some = \(a : A) -> Some a
          }
          left

in  { applicative, empty, or } : Alternative Optional