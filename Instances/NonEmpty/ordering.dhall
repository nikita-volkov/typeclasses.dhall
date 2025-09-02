let Prelude = ../../Prelude.dhall

let Ordering = ../../Classes/Ordering/Type.dhall

let Order = ../../Classes/Ordering/Order/Type.dhall

let ListExtensions = ../List/package.dhall

let order =
      \(Element : Type) ->
      \(elementOrder : Ordering Element) ->
      \(left : Prelude.NonEmpty.Type Element) ->
      \(right : Prelude.NonEmpty.Type Element) ->
        merge
          { Less = Order.Less
          , Greater = Order.Greater
          , Equal =
              (ListExtensions.ordering Element elementOrder).order
                left.tail
                right.tail
          }
          (elementOrder.order left.head right.head)

in  \(Element : Type) ->
    \(elementOrder : Ordering Element) ->
        { order = order Element elementOrder }
      : Ordering (Prelude.NonEmpty.Type Element)
