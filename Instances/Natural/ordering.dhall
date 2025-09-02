let Prelude = ../../Prelude.dhall

let Ordering = ../../Classes/Ordering/Type.dhall

let Order = ../../Classes/Ordering/Order.dhall

let compare
    : Natural -> Natural -> Order
    = \(left : Natural) ->
      \(right : Natural) ->
        if    Prelude.Natural.lessThan left right
        then  Order.Less
        else  if Prelude.Natural.lessThan right left
        then  Order.Greater
        else  Order.Equal

in  { compare } : Ordering Natural
