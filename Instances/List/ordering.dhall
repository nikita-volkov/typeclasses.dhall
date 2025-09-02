let Prelude = ../../Prelude.dhall

let Ordering = ../../Classes/Ordering/Type.dhall

let Order = ../../Classes/Ordering/Order.dhall

let NaturalExtensions = ../Natural/package.dhall

let order =
      \(Element : Type) ->
      \(elementOrder : Ordering Element) ->
      \(left : List Element) ->
      \(right : List Element) ->
        let Pair = { _1 : Element, _2 : Element }

        let zipped = Prelude.List.zip Element left Element right

        let zippedOrder =
              Prelude.List.foldLeft
                Pair
                zipped
                Order
                ( \(state : Order) ->
                  \(pair : Pair) ->
                    merge
                      { Less = Order.Less
                      , Greater = Order.Greater
                      , Equal = elementOrder.order pair._1 pair._2
                      }
                      state
                )
                Order.Equal

        in  merge
              { Less = Order.Less
              , Greater = Order.Greater
              , Equal =
                  let leftLength = Prelude.List.length Element left

                  let rightLength = Prelude.List.length Element right

                  in  NaturalExtensions.ordering.order leftLength rightLength
              }
              zippedOrder

in  \(Element : Type) ->
    \(elementOrder : Ordering Element) ->
      { order = order Element elementOrder } : Ordering (List Element)
