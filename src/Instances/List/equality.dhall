{-|
List equality instance using element-wise comparison.

## Parameters
- `Element : Type` - The type of elements in the list
- `elementEquality : Equality Element` - Equality instance for the element type

## Implementation Strategy
Performs a single-pass element-wise comparison by folding over the first list
(indexed via `List/indexed`) and looking up corresponding elements in the second
list via `List/index` (the same pattern `List/zip` uses internally). This avoids
allocating an intermediate list of pairs.

Returns `False` immediately if:
- The second list runs out of elements before the first
- Any corresponding element pair differs

After processing the first list, returns `False` if the second list has
remaining elements.

## Usage
```dhall
let NaturalEquality = ../Natural/equality.dhall
let listEquality = equality Natural NaturalEquality

let result1 = listEquality.equal [1, 2, 3] [1, 2, 3]     -- True
let result2 = listEquality.equal [1, 2] [1, 2, 3]        -- False (different lengths)
let result3 = listEquality.equal [1, 2, 3] [1, 2, 4]     -- False (different elements)
let result4 = listEquality.equal ([] : List Natural) []  -- True (empty lists)
```

## Efficiency
- **No intermediate allocation**: Avoids creating a zipped list of pairs
- **Early termination** on first element difference or length mismatch
- **O(min(m,n))** element comparisons, with `List/index` lookups per element

## Laws
Satisfies all Equality laws when the element equality does:
- **Reflexivity**: Any list equals itself
- **Symmetry**: Order of comparison doesn't matter
- **Transitivity**: Equality relationships compose correctly
-}
let Prelude = ../../Deps/Prelude.dhall

let Equality = ../../Classes/Equality/Type.dhall

in  \(Element : Type) ->
    \(elementEquality : Equality Element) ->
      let equal =
            \(x : List Element) ->
            \(y : List Element) ->
              let Result = { count : Natural, equal : Bool }

              let result =
                    Prelude.List.foldLeft
                      { index : Natural, value : Element }
                      (List/indexed Element x)
                      Result
                      ( \(state : Result) ->
                        \(ix : { index : Natural, value : Element }) ->
                          if    state.equal
                          then  merge
                                  { None = { count = ix.index, equal = False }
                                  , Some =
                                      \(yElem : Element) ->
                                        { count = ix.index + 1
                                        , equal =
                                            elementEquality.equal ix.value yElem
                                        }
                                  }
                                  (Prelude.List.index ix.index Element y)
                          else  state
                      )
                      { count = 0, equal = True }

              in  if    result.equal
                  then  merge
                          { None = True, Some = \(_ : Element) -> False }
                          (Prelude.List.index result.count Element y)
                  else  False

      in  { equal } : Equality (List Element)
