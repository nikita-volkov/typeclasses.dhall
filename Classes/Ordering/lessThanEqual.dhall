let Prelude = ../../Prelude.dhall

let Ordering = ./Type.dhall

let Order = ./Order.dhall

in  \(A : Type) ->
    \(ordering : Ordering A) ->
    \(x : A) ->
    \(y : A) ->
      merge { Less = True, Greater = False, Equal = True } (ordering.order x y)
