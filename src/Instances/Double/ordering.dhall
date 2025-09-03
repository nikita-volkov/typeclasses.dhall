let Prelude = ../../Prelude.dhall

let Ordering = ../../Classes/Ordering/Type.dhall

let Order = ../../Classes/Ordering/Order/Type.dhall

let order
    : Double -> Double -> Order
    = \(left : Double) ->
      \(right : Double) ->
        if    Prelude.Double.lessThan left right
        then  Order.Less
        else  if Prelude.Double.lessThan right left
        then  Order.Greater
        else  Order.Equal

in  { order } : Ordering Double