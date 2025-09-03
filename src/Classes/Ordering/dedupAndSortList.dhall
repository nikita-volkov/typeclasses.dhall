{-|
Sort and deduplicate a list using the provided ordering.

This function takes an unsorted list that may contain duplicates and returns
a sorted list with all duplicates removed, using the ordering instance to
determine both the sort order and equality for deduplication.

## Parameters
- `A : Type` - The type of elements in the list
- `ordering : Ordering A` - The ordering instance to use for sorting and deduplication
- `list : List A` - The input list to sort and deduplicate

## Returns
`List A` - A sorted list with duplicates removed

## Algorithm
Uses a fold-based approach with `insertIntoDedupedSortedList`:
1. Start with an empty list (sorted and deduplicated by definition)
2. For each element in the input list, insert it into the result list
3. `insertIntoDedupedSortedList` maintains both sorted order and uniqueness

## Usage
```dhall
let naturalOrdering = ../../Instances/Natural/ordering.dhall
let unsorted = [3, 1, 4, 1, 5, 9, 2, 6, 5]
let result = dedupAndSortList Natural naturalOrdering unsorted
-- Result: [1, 2, 3, 4, 5, 6, 9]
```

## Efficiency
- **Time complexity**: O(n²) in worst case due to list insertion
- **Space complexity**: O(n) for the result list
- **Stable**: Maintains relative order of equal elements (first occurrence wins)

## Use Cases
- **Data cleaning**: Remove duplicates from user input
- **Set operations**: Convert lists to set-like behavior
- **Normalization**: Prepare data for comparison or processing
-}
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
