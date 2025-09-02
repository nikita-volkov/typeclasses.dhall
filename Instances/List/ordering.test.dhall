let Prelude = ../../Prelude.dhall

let Order = ../../Classes/Ordering/Order.dhall

let NaturalExtensions = ../Natural/package.dhall

let ordering = ./ordering.dhall

let subj = ordering Natural NaturalExtensions.ordering

in  { sameLength =
      { emptyListsAreEqual =
            assert
          : subj.order ([] : List Natural) ([] : List Natural) === Order.Equal
      , LessElement = assert : subj.order [ 1 ] [ 2 ] === Order.Less
      , greaterElement = assert : subj.order [ 3 ] [ 2 ] === Order.Greater
      , equalElement = assert : subj.order [ 2 ] [ 2 ] === Order.Equal
      , lexicographicLess =
          assert : subj.order [ 1, 2, 3 ] [ 1, 2, 4 ] === Order.Less
      , lexicographicGreater =
          assert : subj.order [ 1, 3, 3 ] [ 1, 2, 4 ] === Order.Greater
      , lexicographicEqual =
          assert : subj.order [ 1, 2, 3 ] [ 1, 2, 3 ] === Order.Equal
      , firstElementDifferent =
          assert : subj.order [ 0, 5, 10 ] [ 1, 2, 3 ] === Order.Less
      }
    , differentLengths =
      { emptyIsLessThanNonEmpty =
          assert : subj.order ([] : List Natural) [ 1 ] === Order.Less
      , nonEmptyIsGreaterThanEmpty =
          assert : subj.order [ 1 ] ([] : List Natural) === Order.Greater
      , shorterVsLongerWhenPrefixEqual =
          assert : subj.order [ 1, 2 ] [ 1, 2, 3 ] === Order.Less
      , longerVsShorterWhenPrefixEqual =
          assert : subj.order [ 1, 2, 3 ] [ 1, 2 ] === Order.Greater
      , shorterVsLongerWhenPrefixDifferent =
          assert : subj.order [ 2, 3 ] [ 1, 2, 3 ] === Order.Greater
      , longerVsShorterWhenPrefixDifferent =
          assert : subj.order [ 0, 2, 3 ] [ 1, 2 ] === Order.Less
      }
    }
