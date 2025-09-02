let Prelude = ../../Prelude.dhall

let Order = ./Type.dhall

in  \(A : Type) ->
    \(order : Order A) ->
    \(left : A) ->
    \(right : A) ->
      merge
        { Less = False, Equal = True, Greater = False }
        (order.compare left right)
