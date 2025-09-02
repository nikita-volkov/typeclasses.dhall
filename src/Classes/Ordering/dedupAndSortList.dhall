-- Dedupes and sorts a list of elements of type `A` based on the provided `Ordering`.
let Prelude = ../../Prelude.dhall

let Ordering = ./Type.dhall

let insertIntoDedupedSortedList = ./insertIntoDedupedSortedList.dhall

in  \(A : Type) ->
      let State
          : Type
          = List A

      let initialState
          : State
          = [] : List A

      in  \(ordering : Ordering A) ->
            let updateState
                : A -> State -> State
                = insertIntoDedupedSortedList A ordering

            in  \(list : List A) ->
                  Prelude.List.fold A list State updateState initialState
