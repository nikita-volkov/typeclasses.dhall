{-|
List equality instance using lexicographic comparison.

This instance implements the `Equality` typeclass for `List` types by comparing
lists element-wise in lexicographic (dictionary) order.

## Parameters
- `Element : Type` - The type of elements in the list
- `elementEquality : Equality Element` - Equality instance for the element type

## Implementation Strategy
1. **Length check**: First compares list lengths for efficiency
2. **Element-wise comparison**: If lengths match, zips lists and compares each pair
3. **Short-circuit**: Returns `False` immediately if any element pair differs

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
- **O(1) length comparison** first avoids unnecessary element comparisons
- **Early termination** on first element difference
- **O(min(m,n))** complexity where m, n are list lengths

## Laws
Satisfies all Equality laws when the element equality does:
- **Reflexivity**: Any list equals itself
- **Symmetry**: Order of comparison doesn't matter
- **Transitivity**: Equality relationships compose correctly
-}
let Prelude = ../../Prelude.dhall

let Equality = ../../Classes/Equality/Type.dhall

let NaturalExtensions = ../Natural/package.dhall

in  \(Element : Type) ->
    \(elementEquality : Equality Element) ->
      let equal =
            \(x : List Element) ->
            \(y : List Element) ->
              let lengthsEqual =
                    NaturalExtensions.equality.equal
                      (Prelude.List.length Element x)
                      (Prelude.List.length Element y)

              let Pair = { _1 : Element, _2 : Element }

              in  if    lengthsEqual
                  then  Prelude.List.fold
                          Pair
                          (Prelude.List.zip Element x Element y)
                          Bool
                          ( \(pair : Pair) ->
                            \(state : Bool) ->
                              state && elementEquality.equal pair._1 pair._2
                          )
                          True
                  else  False

      in  { equal } : Equality (List Element)
