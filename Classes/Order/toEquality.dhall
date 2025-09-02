-- Adapt an instance of `Order` to `Equality`.
let Prelude = ../../Prelude.dhall

let Order = ./Type.dhall

let Equality = ../Equality/package.dhall

in  \(A : Type) ->
    \(order : Order A) ->
      { equal = ./equal.dhall A order } : Equality.Type A
