-- This function takes a list of `F A` values and combines them into a single `F A` value using the `Alternative` instance.
--
-- It chooses the first alternative to succeed, accumulating all the reports produced in the process.
let Alternative = ./Type.dhall

let Prelude = ../../Prelude.dhall

in  \(F : Type -> Type) ->
    \(alternative : Alternative F) ->
    \(A : Type) ->
    \(list : List (F A)) ->
        Prelude.List.foldLeft
          (F A)
          list
          (F A)
          (alternative.or A)
          (alternative.empty A)
      : F A
