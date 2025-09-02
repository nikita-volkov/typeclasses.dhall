let Prelude = ../../Prelude.dhall

let Ordering = ../../Classes/Ordering/Type.dhall

let Comparison = ../../Classes/Ordering/Comparison.dhall

let ListExtensions = ../List/package.dhall

let compare =
      \(Element : Type) ->
      \(elementOrder : Ordering Element) ->
      \(left : Prelude.NonEmpty.Type Element) ->
      \(right : Prelude.NonEmpty.Type Element) ->
        merge
          { Less = Comparison.Less
          , Greater = Comparison.Greater
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
