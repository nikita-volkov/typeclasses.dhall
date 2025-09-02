let Applicative = ./Type.dhall

let Prelude = ../../Prelude.dhall

in  \(F : Type -> Type) ->
    \(applicative : Applicative F) ->
    \(A : Type) ->
    \(list : List (F A)) ->
      Prelude.List.fold
        (F A)
        list
        (F (List A))
        ( \(element : F A) ->
          \(acc : F (List A)) ->
            applicative.map2
              A
              (List A)
              (List A)
              (\(element : A) -> \(acc : List A) -> [ element ] # acc)
              element
              acc
        )
        (applicative.pure (List A) ([] : List A))
