let Prelude = ../../Prelude.dhall

let Ordering = ./Type.dhall

let Order = ./Order/Type.dhall

in  \(A : Type) ->
    \(ordering : Ordering A) ->
    \(x : A) ->
    \(y : A) ->
      merge { Less = True, Greater = False, Equal = False } (ordering.order x y)
