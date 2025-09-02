let Applicative = ./Type.dhall

let Prelude = ../../Prelude.dhall

let sequenceList = ./sequenceList.dhall

in  \(F : Type -> Type) ->
    \(applicative : Applicative F) ->
    \(A : Type) ->
    \(B : Type) ->
    \(f : A -> F B) ->
    \(list : List A) ->
        sequenceList F applicative B (Prelude.List.map A (F B) f list)
      : F (List B)
