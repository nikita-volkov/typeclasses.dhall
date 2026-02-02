{-|
Generate a list of sample values using an Arbitrary instance.
-}
let Prelude = ../../Deps/Prelude.dhall

let Self = ./Type.dhall

in  \(A : Type) ->
    \(instance : Self A) ->
    \(size : Natural) ->
        Prelude.List.generate
          size
          A
          (\(index : Natural) -> instance.generate index 0)
      : List A
