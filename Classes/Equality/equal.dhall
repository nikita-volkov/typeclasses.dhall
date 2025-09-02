let Equality = ./Type.dhall

in  \(A : Type) ->
    \(equality : Equality A) ->
    \(x : A) ->
    \(y : A) ->
      equality.equal x y
