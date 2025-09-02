let Prelude = ../../Prelude.dhall

let Order = ./Type.dhall

in  \(A : Type) ->
    \(order : Order A) ->
    \(left : A) ->
    \(right : A) ->
      merge
        { Smaller = True, Equal = False, Greater = True }
        (order.compare left right)
