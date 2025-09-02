let Prelude = ../../Prelude.dhall

let Comparison = ../../Classes/Order/Comparison.dhall

let NaturalExtensions = ../Natural/package.dhall

let order = ./order.dhall

let subj = order Natural NaturalExtensions.order

in  { sameLength =
      { emptyListsAreEqual =
            assert
          :     subj.compare ([] : List Natural) ([] : List Natural)
            ===  Comparison.Equal
      , LessElement = assert : subj.compare [ 1 ] [ 2 ] === Comparison.Less
      , greaterElement =
          assert : subj.compare [ 3 ] [ 2 ] === Comparison.Greater
      , equalElement = assert : subj.compare [ 2 ] [ 2 ] === Comparison.Equal
      , lexicographicLess =
          assert : subj.compare [ 1, 2, 3 ] [ 1, 2, 4 ] === Comparison.Less
      , lexicographicGreater =
          assert : subj.compare [ 1, 3, 3 ] [ 1, 2, 4 ] === Comparison.Greater
      , lexicographicEqual =
          assert : subj.compare [ 1, 2, 3 ] [ 1, 2, 3 ] === Comparison.Equal
      , firstElementDifferent =
          assert : subj.compare [ 0, 5, 10 ] [ 1, 2, 3 ] === Comparison.Less
      }
    , differentLengths =
      { emptyIsLessThanNonEmpty =
          assert : subj.compare ([] : List Natural) [ 1 ] === Comparison.Less
      , nonEmptyIsGreaterThanEmpty =
          assert : subj.compare [ 1 ] ([] : List Natural) === Comparison.Greater
      , shorterVsLongerWhenPrefixEqual =
          assert : subj.compare [ 1, 2 ] [ 1, 2, 3 ] === Comparison.Less
      , longerVsShorterWhenPrefixEqual =
          assert : subj.compare [ 1, 2, 3 ] [ 1, 2 ] === Comparison.Greater
      , shorterVsLongerWhenPrefixDifferent =
          assert : subj.compare [ 2, 3 ] [ 1, 2, 3 ] === Comparison.Greater
      , longerVsShorterWhenPrefixDifferent =
          assert : subj.compare [ 0, 2, 3 ] [ 1, 2 ] === Comparison.Less
      }
    }
