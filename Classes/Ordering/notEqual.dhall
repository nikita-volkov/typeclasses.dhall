let Ordering = ./Type.dhall

in  \(A : Type) ->
    \(ordering : Ordering A) ->
    \(left : A) ->
    \(right : A) ->
      merge
        { Less = True, Equal = False, Greater = True }
        (ordering.order left right)
