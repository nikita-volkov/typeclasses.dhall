let Prelude = ../../Prelude.dhall

let Order = ../../Classes/Ordering/Order.dhall

let ordering = ./ordering.dhall

let order = ordering.order

in  { order =
      { LessNumbers = assert : order 3 5 === Order.Less
      , greaterNumbers = assert : order 7 2 === Order.Greater
      , equalNumbers = assert : order 4 4 === Order.Equal
      , zeroOrders =
        { zeroLessThanPositive = assert : order 0 1 === Order.Less
        , positiveGreaterThanZero = assert : order 1 0 === Order.Greater
        , zeroEqualsZero = assert : order 0 0 === Order.Equal
        }
      , largeNumbers =
        { LessLarge = assert : order 999 1000 === Order.Less
        , greaterLarge = assert : order 1000 999 === Order.Greater
        , equalLarge = assert : order 1000 1000 === Order.Equal
        }
      }
    }
