let Prelude = ../../Prelude.dhall

let NaturalExtensions = ../Natural/package.dhall

let equality = ./equality.dhall

let subj = equality Natural NaturalExtensions.equality

in  { equal =
      { singleElementNonEmpty =
        { sameHead =
              assert
            :     subj.equal
                    { head = 5, tail = [] : List Natural }
                    { head = 5, tail = [] : List Natural }
              ===  True
        , differentHead =
              assert
            :     subj.equal
                    { head = 3, tail = [] : List Natural }
                    { head = 7, tail = [] : List Natural }
              ===  False
        }
      , multipleElementNonEmpty =
        { headAndTailSame =
              assert
            :     subj.equal
                    { head = 1, tail = [ 2, 3 ] }
                    { head = 1, tail = [ 2, 3 ] }
              ===  True
        , headSameTailDifferent =
              assert
            :     subj.equal
                    { head = 1, tail = [ 2, 3 ] }
                    { head = 1, tail = [ 2, 4 ] }
              ===  False
        , headDifferentTailSame =
              assert
            :     subj.equal
                    { head = 1, tail = [ 2, 3 ] }
                    { head = 2, tail = [ 2, 3 ] }
              ===  False
        , headAndTailDifferent =
              assert
            :     subj.equal
                    { head = 1, tail = [ 2, 3 ] }
                    { head = 2, tail = [ 4, 5 ] }
              ===  False
        }
      , differentTailLengths =
        { headSameShorterTail =
              assert
            :     subj.equal
                    { head = 1, tail = [ 2 ] }
                    { head = 1, tail = [ 2, 3 ] }
              ===  False
        , headSameLongerTail =
              assert
            :     subj.equal
                    { head = 1, tail = [ 2, 3 ] }
                    { head = 1, tail = [ 2 ] }
              ===  False
        , headSameEmptyVsNonEmptyTail =
              assert
            :     subj.equal
                    { head = 1, tail = [] : List Natural }
                    { head = 1, tail = [ 2 ] }
              ===  False
        }
      , complexCases =
        { longNonEmptyEqual =
              assert
            :     subj.equal
                    { head = 1, tail = [ 2, 3, 4, 5, 6 ] }
                    { head = 1, tail = [ 2, 3, 4, 5, 6 ] }
              ===  True
        , longNonEmptyDifferent =
              assert
            :     subj.equal
                    { head = 1, tail = [ 2, 3, 4, 5, 6 ] }
                    { head = 1, tail = [ 2, 3, 4, 5, 7 ] }
              ===  False
        , tailOrderMatters =
              assert
            :     subj.equal
                    { head = 1, tail = [ 2, 3, 4 ] }
                    { head = 1, tail = [ 4, 3, 2 ] }
              ===  False
        }
      }
    }
