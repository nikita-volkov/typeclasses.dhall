{-|
List arbitrary instance for generating random lists.

This instance implements the `Arbitrary` typeclass for `List` types, generating
lists of varying sizes with elements created using the provided element generator.

## Parameters
- `Element : Type` - The type of elements in the list
- `elementInstance : Arbitrary Element` - Arbitrary instance for generating elements

## Generation Strategy
1. **Size calculation**: Uses `iteration / depth` to determine list length
2. **Element generation**: Creates each element with `size + index` as seed and `depth - 1`
3. **Depth control**: Reduces depth for elements to ensure termination in recursive types

## Usage
```dhall
let naturalArbitrary = { generate = \(seed : Natural) -> \(depth : Natural) -> seed }
let listArbitrary = arbitrary Natural naturalArbitrary

-- Generate lists with different parameters
let list1 = listArbitrary.generate 10 1  -- List of length 10, elements with depth 0
let list2 = listArbitrary.generate 5 2   -- List of length 2, elements with depth 1
let list3 = listArbitrary.generate 0 1   -- Empty list (0/1 = 0)
```

## Size Control
- **Higher iteration**: Generates longer lists
- **Higher depth**: Generates shorter lists (safer for recursive structures)
- **Division by zero protection**: Returns empty list when depth is 0

## Element Seeding
Each element gets a unique seed (`size + index`) ensuring variety within the same list.
The depth is decremented for elements to prevent infinite recursion in nested structures.

## Typical Behavior
- At depth 1: Generates moderately-sized lists
- At depth 2+: Generates smaller lists
- Elements become simpler as depth increases
- Perfect for property-based testing scenarios
-}
let Prelude = ../../Prelude.dhall

let Classes = ../../Classes/package.dhall

let Arbitrary = Classes.Arbitrary

let Natural/div
    : Natural -> Natural -> Optional Natural
    = let quotient =
            https://github.com/jcaesar/dhall-div/releases/download/1/quotient.dhall
              sha256:d6a994f4b431081e877a0beac02f5dcc98f3ea5b027986114487578056cb3db9

      in  \(a : Natural) ->
          \(b : Natural) ->
            if    Prelude.Natural.isZero b
            then  None Natural
            else  Some (quotient a b).q

in  \(Element : Type) ->
    \(elementInstance : Arbitrary.Type Element) ->
      let generate
          : Natural -> Natural -> List Element
          = \(iteration : Natural) ->
            \(depth : Natural) ->
              let size = Natural/div iteration depth

              let size = Prelude.Optional.default Natural 0 size

              in  Prelude.List.generate
                    size
                    Element
                    ( \(index : Natural) ->
                        elementInstance.generate
                          (size + index)
                          (Prelude.Natural.subtract 1 depth)
                    )

      in  { generate } : Arbitrary.Type (List Element)
