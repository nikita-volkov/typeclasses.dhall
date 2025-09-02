let Prelude = ../../Prelude.dhall

let Order = ../../Classes/Ordering/Order.dhall

let ordering = ./ordering.dhall

let compare = ordering.compare

in  { compare =
      { LessNumbers = assert : compare 3 5 === Order.Less
      , greaterNumbers = assert : compare 7 2 === Order.Greater
      , equalNumbers = assert : compare 4 4 === Order.Equal
      , zeroOrders =
        { zeroLessThanPositive = assert : compare 0 1 === Order.Less
        , positiveGreaterThanZero = assert : compare 1 0 === Order.Greater
        , zeroEqualsZero = assert : compare 0 0 === Order.Equal
        }
      , largeNumbers =
        { LessLarge = assert : compare 999 1000 === Order.Less
        , greaterLarge = assert : compare 1000 999 === Order.Greater
        , equalLarge = assert : compare 1000 1000 === Order.Equal
        }
      }
    }
