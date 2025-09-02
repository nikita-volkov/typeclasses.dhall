let Prelude = ../../Prelude.dhall

let Comparison = ../../Classes/Order/Comparison.dhall

let order = ./order.dhall

let compare = order.compare

in  { compare =
      { smallerNumbers = assert : compare 3 5 === Comparison.Smaller
      , greaterNumbers = assert : compare 7 2 === Comparison.Greater
      , equalNumbers = assert : compare 4 4 === Comparison.Equal
      , zeroComparisons =
        { zeroLessThanPositive = assert : compare 0 1 === Comparison.Smaller
        , positiveGreaterThanZero = assert : compare 1 0 === Comparison.Greater
        , zeroEqualsZero = assert : compare 0 0 === Comparison.Equal
        }
      , largeNumbers =
        { smallerLarge = assert : compare 999 1000 === Comparison.Smaller
        , greaterLarge = assert : compare 1000 999 === Comparison.Greater
        , equalLarge = assert : compare 1000 1000 === Comparison.Equal
        }
      }
    }
