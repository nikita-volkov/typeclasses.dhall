let Ordering = ./Type.dhall

in  \(A : Type) ->
    \(ordering : Ordering A) ->
    \(x : A) ->
    \(y : A) ->
      merge { Less = False, Greater = True, Equal = True } (ordering.order x y)
