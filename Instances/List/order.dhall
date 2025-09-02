let Prelude = ../../Prelude.dhall

let Order = ../../Classes/Order/Type.dhall

let Comparison = ../../Classes/Order/Comparison.dhall

let NaturalExtensions = ../Natural/package.dhall

let compare =
      \(Element : Type) ->
      \(elementOrder : Order Element) ->
      \(left : List Element) ->
      \(right : List Element) ->
        let Pair = { _1 : Element, _2 : Element }

        let zipped = Prelude.List.zip Element left Element right

        let zippedComparison =
              Prelude.List.foldLeft
                Pair
                zipped
                Comparison
                ( \(state : Comparison) ->
                  \(pair : Pair) ->
                    merge
                      { Smaller = Comparison.Smaller
                      , Greater = Comparison.Greater
                      , Equal = elementOrder.compare pair._1 pair._2
                      }
                      state
                )
                Comparison.Equal

        in  merge
              { Smaller = Comparison.Smaller
              , Greater = Comparison.Greater
              , Equal =
                  let leftLength = Prelude.List.length Element left

                  let rightLength = Prelude.List.length Element right

                  in  NaturalExtensions.order.compare leftLength rightLength
              }
              zippedComparison

in  \(Element : Type) ->
    \(elementOrder : Order Element) ->
      { compare = compare Element elementOrder } : Order (List Element)
