let equality = ./equality.dhall

let equal = equality.equal

in  { equal =
      { sameBools =
        { trueEqualsTrue = assert : equal True True === True
        , falseEqualsFalse = assert : equal False False === True
        }
      , differentBools =
        { trueNotEqualsFalse = assert : equal True False === False
        , falseNotEqualsTrue = assert : equal False True === False
        }
      }
    }