let Prelude = ./../../Prelude.dhall

let equal = ./equal.dhall

let Equality = ./Type.dhall

in  \(A : Type) ->
    \(equality : Equality A) ->
    \(x : A) ->
    \(y : A) ->
      Prelude.Bool.not (equal A equality x y)
