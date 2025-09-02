let Ordering = ./Type.dhall

in  \(A : Type) ->
    \(ordering : Ordering A) ->
    \(x : A) ->
    \(y : A) ->
      merge { Less = True, Greater = False, Equal = True } (ordering.order x y)
