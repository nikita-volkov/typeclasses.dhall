let Applicative = ../../Classes/Applicative/Type.dhall

let functor = ./functor.dhall

let pure
    : forall (A : Type) -> A -> List A
    = \(A : Type) -> \(a : A) -> [ a ]

let map2
    : forall (A : Type) ->
      forall (B : Type) ->
      forall (C : Type) ->
      (A -> B -> C) ->
      List A ->
      List B ->
        List C
    = \(A : Type) ->
      \(B : Type) ->
      \(C : Type) ->
      \(f : A -> B -> C) ->
      \(list : List A) ->
      \(bs : List B) ->
        List/fold
          A
          list
          (List C)
          ( \(a : A) ->
            \(acc : List C) ->
              List/fold
                B
                bs
                (List C)
                (\(b : B) -> \(acc2 : List C) -> [ f a b ] # acc2)
                acc
          )
          ([] : List C)

in  { functor, pure, map2 } : Applicative List
