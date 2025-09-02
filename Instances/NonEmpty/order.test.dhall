let Prelude = ../../Prelude.dhall

let Comparison = ../../Classes/Order/Comparison.dhall

let NaturalExtensions = ../Natural/package.dhall

let order = ./order.dhall

let instance = order Natural NaturalExtensions.order

let compare = instance.compare

in  { singleElementNonEmpty =
      { smallerHead =
            assert
          :     compare
                  { head = 1, tail = [] : List Natural }
                  { head = 2, tail = [] : List Natural }
            ===  Comparison.Smaller
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
        { smallerHead =
              assert
            :     compare
                    { head = 1, tail = [ 2, 3 ] }
                    { head = 2, tail = [ 1, 1 ] }
              ===  Comparison.Smaller
        , greaterHead =
              assert
            :     compare
                    { head = 3, tail = [ 1, 1 ] }
                    { head = 2, tail = [ 5, 5 ] }
              ===  Comparison.Greater
        }
      , headSameTailDifferent =
        { smallerTail =
              assert
            :     compare
                    { head = 1, tail = [ 2, 3 ] }
                    { head = 1, tail = [ 2, 4 ] }
              ===  Comparison.Smaller
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
              ===  Comparison.Smaller
        , longerTail =
              assert
            :     compare
                    { head = 1, tail = [ 2, 3 ] }
                    { head = 1, tail = [ 2 ] }
              ===  Comparison.Greater
        }
      }
    }
