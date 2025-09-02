let Ordering = ./Type.dhall

in  \(A : Type) ->
    \(ordering : Ordering A) ->
    \(x : A) ->
    \(y : A) ->
      merge { Less = True, Greater = False, Equal = False } (ordering.order x y)
