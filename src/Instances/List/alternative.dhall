let Alternative = ../../Classes/Alternative/Type.dhall

let applicative = ./applicative.dhall

let empty
    : forall (A : Type) -> List A
    = \(A : Type) -> [] : List A

let or
    : forall (A : Type) -> List A -> List A -> List A
    = \(A : Type) -> \(left : List A) -> \(right : List A) ->
        left # right

in  { applicative, empty, or } : Alternative List