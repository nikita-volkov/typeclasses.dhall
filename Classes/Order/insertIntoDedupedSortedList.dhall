-- Assuming that the input list is already sorted and deduplicated,
-- inserts a new element into the list if it is not already present,
-- maintaining the sorted order.
let Prelude = ../../Prelude.dhall

let Order = ./Type.dhall

let equal = ./equal.dhall

let lessThanEqual = ./lessThanEqual.dhall

let greaterThanEqual = ./greaterThanEqual.dhall

in  \(A : Type) ->
      let State
          : Type
          = { inserted : Bool, list : List A }

      let initialState
          : State
          = { inserted = False, list = [] : List A }

      in  \(order : Order A) ->
          \(newElement : A) ->
            let updateState
                : State -> A -> State
                = \(state : State) ->
                  \(element : A) ->
                    if    state.inserted
                    then  { inserted = True, list = [ element ] # state.list }
                    else  merge
                            { Smaller =
                              { inserted = True
                              , list = [ element, newElement ] # state.list
                              }
                            , Equal =
                              { inserted = True
                              , list = [ element ] # state.list
                              }
                            , Greater =
                              { inserted = False
                              , list = [ element ] # state.list
                              }
                            }
                            (order.compare newElement element)

            let finishState
                : State -> List A
                = \(state : State) ->
                    if    state.inserted
                    then  Prelude.List.reverse A state.list
                    else  Prelude.List.reverse A ([ newElement ] # state.list)

            in  \(list : List A) ->
                  finishState
                    ( Prelude.List.foldLeft
                        A
                        list
                        State
                        updateState
                        initialState
                    )
