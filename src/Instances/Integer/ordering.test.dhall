let ordering = ./ordering.dhall

let Order = ../../Classes/Ordering/Order/Type.dhall

let order = ordering.order

in  { order =
      { equalIntegers =
        { zero = assert : order +0 +0 === Order.Equal
        , positive = assert : order +5 +5 === Order.Equal
        , negative = assert : order -3 -3 === Order.Equal
        }
      , orderedIntegers =
        { negativeBeforePositive = assert : order -1 +1 === Order.Less
        , positiveAfterNegative = assert : order +1 -1 === Order.Greater
        , negativeOrdering = assert : order -5 -3 === Order.Less
        , positiveOrdering = assert : order +3 +7 === Order.Less
        }
      }
    }