-- Dedupes and sorts a list of elements of type `A` based on the provided `Order`.
let Prelude = ../../Prelude.dhall

let Order = ./Type.dhall

let insertIntoDedupedSortedList = ./insertIntoDedupedSortedList.dhall

in  \(A : Type) ->
      let State
          : Type
          = List A

      let initialState
          : State
          = [] : List A

      in  \(order : Order A) ->
            let updateState
                : A -> State -> State
                = insertIntoDedupedSortedList A order

            in  \(list : List A) ->
                  Prelude.List.fold A list State updateState initialState
