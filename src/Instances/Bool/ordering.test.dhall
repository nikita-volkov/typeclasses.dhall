let ordering = ./ordering.dhall

let Order = ../../Classes/Ordering/Order/Type.dhall

let order = ordering.order

in  { order =
      { equalBools =
        { trueEqualsTrue = assert : order True True === Order.Equal
        , falseEqualsFalse = assert : order False False === Order.Equal
        }
      , orderedBools =
        { falseBeforeTrue = assert : order False True === Order.Less
        , trueAfterFalse = assert : order True False === Order.Greater
        }
      }
    }