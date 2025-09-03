let equality = ./equality.dhall

let equal = equality.equal

in  { equal =
      { sameTexts =
        { emptyTexts = assert : equal "" "" === True
        , singleChar = assert : equal "a" "a" === True
        , multiChar = assert : equal "hello" "hello" === True
        }
      , differentTexts =
        { emptyVsNonEmpty = assert : equal "" "a" === False
        , differentChars = assert : equal "a" "b" === False
        , differentWords = assert : equal "hello" "world" === False
        }
      }
    }