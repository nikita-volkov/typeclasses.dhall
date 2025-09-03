{-|
NonEmpty list equality instance.

This instance implements the `Equality` typeclass for `NonEmpty` types by comparing
both the head element and the tail list for equality.

## Parameters
- `Element : Type` - The type of elements in the non-empty list
- `elementEquality : Equality Element` - Equality instance for the element type

## Implementation Strategy
1. **Head comparison**: Compare the head elements using element equality
2. **Tail comparison**: Compare the tail lists using List equality
3. **Logical AND**: Both comparisons must be true for overall equality

## Usage
```dhall
let NaturalEquality = ../Natural/equality.dhall
let nonEmptyEquality = equality Natural NaturalEquality

let ne1 = { head = 1, tail = [2, 3] }
let ne2 = { head = 1, tail = [2, 3] }
let ne3 = { head = 1, tail = [2, 4] }
let ne4 = { head = 2, tail = [2, 3] }

let result1 = nonEmptyEquality.equal ne1 ne2  -- True (same head and tail)
let result2 = nonEmptyEquality.equal ne1 ne3  -- False (different tail)
let result3 = nonEmptyEquality.equal ne1 ne4  -- False (different head)
```

## Efficiency
- **Short-circuit evaluation**: If heads differ, tail comparison is skipped
- **Delegates to List equality**: Reuses optimized list comparison for tails
- **O(min(m,n))** complexity where m, n are the total lengths

## Laws
Satisfies all Equality laws when element and list equalities do:
- **Reflexivity**: Any non-empty list equals itself
- **Symmetry**: Order of comparison doesn't matter
- **Transitivity**: Equality relationships compose correctly
-}
let Prelude = ../../Prelude.dhall

let Equality = ../../Classes/Equality/Type.dhall

let ListExtensions = ../List/package.dhall

in  \(Element : Type) ->
    \(elementEquality : Equality Element) ->
      let equal =
            \(x : Prelude.NonEmpty.Type Element) ->
            \(y : Prelude.NonEmpty.Type Element) ->
                  elementEquality.equal x.head y.head
              &&  (ListExtensions.equality Element elementEquality).equal
                    x.tail
                    y.tail

      in  { equal } : Equality (Prelude.NonEmpty.Type Element)
