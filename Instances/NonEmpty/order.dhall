let Prelude = ../../Prelude.dhall

let Order = ../../Classes/Order/Type.dhall

let Comparison = ../../Classes/Order/Comparison.dhall

let ListExtensions = ../List/package.dhall

let compare =
      \(Element : Type) ->
      \(elementOrder : Order Element) ->
      \(left : Prelude.NonEmpty.Type Element) ->
      \(right : Prelude.NonEmpty.Type Element) ->
        merge
          { Smaller = Comparison.Smaller
          , Greater = Comparison.Greater
          , Equal =
              (ListExtensions.order Element elementOrder).compare
                left.tail
                right.tail
          }
          (elementOrder.compare left.head right.head)

in  \(Element : Type) ->
    \(elementOrder : Order Element) ->
        { compare = compare Element elementOrder }
      : Order (Prelude.NonEmpty.Type Element)
