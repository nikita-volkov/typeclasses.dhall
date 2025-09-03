let Monad = ../../Classes/Monad/Type.dhall

let applicative = ./applicative.dhall

let flatMap
    : forall (A : Type) ->
      forall (B : Type) ->
      (A -> List B) ->
      List A ->
        List B
    = \(A : Type) ->
      \(B : Type) ->
      \(f : A -> List B) ->
      \(list : List A) ->
        List/fold
          A
          list
          (List B)
          (\(a : A) -> \(acc : List B) -> f a # acc)
          ([] : List B)

in  { applicative, flatMap } : Monad List
