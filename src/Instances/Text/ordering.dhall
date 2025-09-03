let Prelude = ../../Prelude.dhall

let Ordering = ../../Classes/Ordering/Type.dhall

let Order = ../../Classes/Ordering/Order/Type.dhall

let order
    : Text -> Text -> Order
    = \(left : Text) ->
      \(right : Text) ->
        if    Prelude.Text.lessThan left right
        then  Order.Less
        else  if Prelude.Text.lessThan right left
        then  Order.Greater
        else  Order.Equal

in  { order } : Ordering Text