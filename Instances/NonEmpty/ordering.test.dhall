let Prelude = ../../Prelude.dhall

let Comparison = ../../Classes/Ordering/Comparison.dhall

let NaturalExtensions = ../Natural/package.dhall

let ordering = ./ordering.dhall

let instance = ordering Natural NaturalExtensions.ordering

let compare = instance.compare

in  { singleElementNonEmpty =
      { LessHead =
            assert
          :     compare
                  { head = 1, tail = [] : List Natural }
                  { head = 2, tail = [] : List Natural }
            ===  Comparison.Less
      , greaterHead =
            assert
          :     compare
                  { head = 3, tail = [] : List Natural }
                  { head = 2, tail = [] : List Natural }
            ===  Comparison.Greater
      , equalHead =
            assert
          :     compare
                  { head = 2, tail = [] : List Natural }
                  { head = 2, tail = [] : List Natural }
            ===  Comparison.Equal
      }
    , multipleElementNonEmpty =
      { headDifferent =
        { LessHead =
              assert
            :     compare
                    { head = 1, tail = [ 2, 3 ] }
                    { head = 2, tail = [ 1, 1 ] }
              ===  Comparison.Less
        , greaterHead =
              assert
            :     compare
                    { head = 3, tail = [ 1, 1 ] }
                    { head = 2, tail = [ 5, 5 ] }
              ===  Comparison.Greater
        }
      , headSameTailDifferent =
        { LessTail =
              assert
            :     compare
                    { head = 1, tail = [ 2, 3 ] }
                    { head = 1, tail = [ 2, 4 ] }
              ===  Comparison.Less
        , greaterTail =
              assert
            :     compare
                    { head = 1, tail = [ 3, 3 ] }
                    { head = 1, tail = [ 2, 4 ] }
              ===  Comparison.Greater
        , equalTail =
              assert
            :     compare
                    { head = 1, tail = [ 2, 3 ] }
                    { head = 1, tail = [ 2, 3 ] }
              ===  Comparison.Equal
        }
      , differentTailLengths =
        { shorterTail =
              assert
            :     compare
                    { head = 1, tail = [ 2 ] }
                    { head = 1, tail = [ 2, 3 ] }
              ===  Comparison.Less
        , longerTail =
              assert
            :     compare
                    { head = 1, tail = [ 2, 3 ] }
                    { head = 1, tail = [ 2 ] }
              ===  Comparison.Greater
        }
      }
    }
