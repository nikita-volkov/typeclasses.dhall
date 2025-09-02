let Prelude = ../../Prelude.dhall

let Ordering = ../../Classes/Ordering/Type.dhall

let Order = ../../Classes/Ordering/Order.dhall

let ListExtensions = ../List/package.dhall

let compare =
      \(Element : Type) ->
      \(elementOrder : Ordering Element) ->
      \(left : Prelude.NonEmpty.Type Element) ->
      \(right : Prelude.NonEmpty.Type Element) ->
        merge
          { Less = Order.Less
          , Greater = Order.Greater
          , Equal =
              (ListExtensions.ordering Element elementOrder).compare
                left.tail
                right.tail
          }
          (elementOrder.compare left.head right.head)

in  \(Element : Type) ->
    \(elementOrder : Ordering Element) ->
        { compare = compare Element elementOrder }
      : Ordering (Prelude.NonEmpty.Type Element)
