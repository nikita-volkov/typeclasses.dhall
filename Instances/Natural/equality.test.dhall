let Prelude = ../../Prelude.dhall

let equality = ./equality.dhall

let equal = equality.equal

in  { equal =
      { sameNumbers =
        { zero = assert : equal 0 0 === True
        , positiveNumber = assert : equal 5 5 === True
        , largeNumber = assert : equal 1000 1000 === True
        }
      , differentNumbers =
        { zeroVsPositive = assert : equal 0 1 === False
        , positiveVsZero = assert : equal 1 0 === False
        , differentPositive = assert : equal 3 7 === False
        , closeNumbers = assert : equal 10 11 === False
        , largeNumbers = assert : equal 999 1000 === False
        }
      }
    }
