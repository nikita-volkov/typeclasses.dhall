let Ordering = ../../Classes/Ordering/Type.dhall

let Order = ../../Classes/Ordering/Order/Type.dhall

let order
    : Bool -> Bool -> Order
    = \(left : Bool) ->
      \(right : Bool) ->
        if    left && (if right then False else True)
        then  Order.Greater
        else  if (if left then False else True) && right
        then  Order.Less
        else  Order.Equal

in  { order } : Ordering Bool