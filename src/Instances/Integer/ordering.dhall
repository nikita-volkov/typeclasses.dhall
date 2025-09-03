let Prelude = ../../Prelude.dhall

let Ordering = ../../Classes/Ordering/Type.dhall

let Order = ../../Classes/Ordering/Order/Type.dhall

let order
    : Integer -> Integer -> Order
    = \(left : Integer) ->
      \(right : Integer) ->
        if    Prelude.Integer.lessThan left right
        then  Order.Less
        else  if Prelude.Integer.lessThan right left
        then  Order.Greater
        else  Order.Equal

in  { order } : Ordering Integer
