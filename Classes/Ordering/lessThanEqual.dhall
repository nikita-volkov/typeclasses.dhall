let Prelude = ../../Prelude.dhall

let Ordering = ./Type.dhall

let Comparison = ./Comparison.dhall

in  \(A : Type) ->
    \(ordering : Ordering A) ->
    \(x : A) ->
    \(y : A) ->
      merge
        { Less = True, Greater = False, Equal = True }
        (ordering.compare x y)
