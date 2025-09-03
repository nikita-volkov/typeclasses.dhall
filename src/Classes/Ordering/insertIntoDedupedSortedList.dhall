{-|
Insert an element into a sorted, deduplicated list while maintaining both properties.

This function assumes the input list is already sorted and contains no duplicates,
then inserts a new element in the correct position. If the element already exists
in the list, it is not inserted again (maintaining deduplication).

## Parameters
- `A : Type` - The type of elements in the list
- `ordering : Ordering A` - The ordering instance to use for comparison
- `newElement : A` - The element to insert
- `list : List A` - The input sorted, deduplicated list

## Returns
`List A` - The updated list with the element inserted (if not already present)

## Preconditions
- Input list must be sorted according to the ordering
- Input list must contain no duplicates

## Algorithm
Uses a stateful fold approach:
1. **State tracking**: Maintains whether insertion has occurred and the result list
2. **Position finding**: Scans until finding the correct insertion point
3. **Duplicate handling**: Skips insertion if element already exists
4. **Order preservation**: Maintains sorted order throughout

## Usage
```dhall
let naturalOrdering = ../../Instances/Natural/ordering.dhall
let sortedList = [1, 3, 5, 7]

let result1 = insertIntoDedupedSortedList Natural naturalOrdering 4 sortedList
-- Result: [1, 3, 4, 5, 7]

let result2 = insertIntoDedupedSortedList Natural naturalOrdering 5 sortedList
-- Result: [1, 3, 5, 7] (no change, 5 already exists)

let result3 = insertIntoDedupedSortedList Natural naturalOrdering 0 sortedList
-- Result: [0, 1, 3, 5, 7]
```

## Efficiency
- **Time complexity**: O(n) where n is the list length
- **Space complexity**: O(n) for the result list
- **Early termination**: Stops scanning once insertion point is found

## Use Cases
- Building sorted sets incrementally
- Maintaining sorted data structures
- Implementing set union operations
-}
-- Assuming that the input list is already sorted and deduplicated,
-- inserts a new element into the list if it is not already present,
-- maintaining the sorted order.
let Prelude = ../../Prelude.dhall

let Ordering = ./Type.dhall

in  \(A : Type) ->
      let State
          : Type
          = { inserted : Bool, list : List A }

      let initialState
          : State
          = { inserted = False, list = [] : List A }

      in  \(ordering : Ordering A) ->
          \(newElement : A) ->
            let updateState
                : State -> A -> State
                = \(state : State) ->
                  \(element : A) ->
                    if    state.inserted
                    then  { inserted = True, list = [ element ] # state.list }
                    else  merge
                            { Less =
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
                            (ordering.order newElement element)

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
