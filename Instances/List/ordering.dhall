let Prelude = ../../Prelude.dhall

let Ordering = ../../Classes/Ordering/Type.dhall

let Comparison = ../../Classes/Ordering/Comparison.dhall

let NaturalExtensions = ../Natural/package.dhall

let compare =
      \(Element : Type) ->
      \(elementOrder : Ordering Element) ->
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
                      { Less = Comparison.Less
                      , Greater = Comparison.Greater
                      , Equal = elementOrder.compare pair._1 pair._2
                      }
                      state
                )
                Comparison.Equal

        in  merge
              { Less = Comparison.Less
              , Greater = Comparison.Greater
              , Equal =
                  let leftLength = Prelude.List.length Element left

                  let rightLength = Prelude.List.length Element right

                  in  NaturalExtensions.ordering.compare leftLength rightLength
              }
              zippedComparison

in  \(Element : Type) ->
    \(elementOrder : Ordering Element) ->
      { compare = compare Element elementOrder } : Ordering (List Element)
