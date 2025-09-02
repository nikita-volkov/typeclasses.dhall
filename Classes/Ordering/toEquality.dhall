-- Adapt an instance of `Ordering` to `Equality`.
let Prelude = ../../Prelude.dhall

let Ordering = ./Type.dhall

let Equality = ../Equality/package.dhall

in  \(A : Type) ->
    \(ordering : Ordering A) ->
      { equal = ./equal.dhall A ordering } : Equality.Type A
