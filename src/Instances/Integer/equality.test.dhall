let equality = ./equality.dhall

let equal = equality.equal

in  { equal =
      { sameIntegers =
        { zero = assert : equal +0 +0 === True
        , positive = assert : equal +5 +5 === True
        , negative = assert : equal -3 -3 === True
        }
      , differentIntegers =
        { positiveVsNegative = assert : equal +1 -1 === False
        , differentPositive = assert : equal +3 +7 === False
        , differentNegative = assert : equal -5 -2 === False
        }
      }
    }