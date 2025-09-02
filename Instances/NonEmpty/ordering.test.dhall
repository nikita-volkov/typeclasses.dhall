let Prelude = ../../Prelude.dhall

let Order = ../../Classes/Ordering/Order.dhall

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
            ===  Order.Less
      , greaterHead =
            assert
          :     compare
                  { head = 3, tail = [] : List Natural }
                  { head = 2, tail = [] : List Natural }
            ===  Order.Greater
      , equalHead =
            assert
          :     compare
                  { head = 2, tail = [] : List Natural }
                  { head = 2, tail = [] : List Natural }
            ===  Order.Equal
      }
    , multipleElementNonEmpty =
      { headDifferent =
        { LessHead =
              assert
            :     compare
                    { head = 1, tail = [ 2, 3 ] }
                    { head = 2, tail = [ 1, 1 ] }
              ===  Order.Less
        , greaterHead =
              assert
            :     compare
                    { head = 3, tail = [ 1, 1 ] }
                    { head = 2, tail = [ 5, 5 ] }
              ===  Order.Greater
        }
      , headSameTailDifferent =
        { LessTail =
              assert
            :     compare
                    { head = 1, tail = [ 2, 3 ] }
                    { head = 1, tail = [ 2, 4 ] }
              ===  Order.Less
        , greaterTail =
              assert
            :     compare
                    { head = 1, tail = [ 3, 3 ] }
                    { head = 1, tail = [ 2, 4 ] }
              ===  Order.Greater
        , equalTail =
              assert
            :     compare
                    { head = 1, tail = [ 2, 3 ] }
                    { head = 1, tail = [ 2, 3 ] }
              ===  Order.Equal
        }
      , differentTailLengths =
        { shorterTail =
              assert
            :     compare
                    { head = 1, tail = [ 2 ] }
                    { head = 1, tail = [ 2, 3 ] }
              ===  Order.Less
        , longerTail =
              assert
            :     compare
                    { head = 1, tail = [ 2, 3 ] }
                    { head = 1, tail = [ 2 ] }
              ===  Order.Greater
        }
      }
    }
