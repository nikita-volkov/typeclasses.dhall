let Prelude = ../../Prelude.dhall

let Ordering = ./Type.dhall

in  \(A : Type) ->
    \(ordering : Ordering A) ->
    \(left : A) ->
    \(right : A) ->
      merge
        { Less = False, Equal = True, Greater = False }
        (ordering.order left right)
