-- This is the main function that generates a sample of arbitrary values
-- of type A using the provided instance of the Arbitrary typeclass.
-- The size parameter controls how many values to generate.
let Prelude = ../../Prelude.dhall

let Self = ./Type.dhall

in  \(A : Type) ->
    \(instance : Self A) ->
    \(size : Natural) ->
        Prelude.List.generate
          size
          A
          (\(index : Natural) -> instance.generate index 0)
      : List A
