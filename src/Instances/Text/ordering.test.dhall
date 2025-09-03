let ordering = ./ordering.dhall

let Order = ../../Classes/Ordering/Order/Type.dhall

let order = ordering.order

in  { order =
      { equalTexts =
        { empty = assert : order "" "" === Order.Equal
        , sameWord = assert : order "hello" "hello" === Order.Equal
        }
      , orderedTexts =
        { emptyBeforeNonEmpty = assert : order "" "a" === Order.Less
        , shorterBeforeLonger = assert : order "hi" "hello" === Order.Less
        , longerAfterShorter = assert : order "hello" "hi" === Order.Greater
        }
      }
    }