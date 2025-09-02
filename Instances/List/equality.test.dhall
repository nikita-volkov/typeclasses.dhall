let Prelude = ../../Prelude.dhall

let NaturalExtensions = ../Natural/package.dhall

let equality = ./equality.dhall

let subj = equality Natural NaturalExtensions.equality

in  { equal =
      { emptyLists =
          assert : subj.equal ([] : List Natural) ([] : List Natural) === True
      , emptyVsNonEmpty =
        { emptyVsSingle =
            assert : subj.equal ([] : List Natural) [ 1 ] === False
        , singleVsEmpty =
            assert : subj.equal [ 1 ] ([] : List Natural) === False
        , emptyVsMultiple =
            assert : subj.equal ([] : List Natural) [ 1, 2, 3 ] === False
        }
      , singleElementLists =
        { sameElement = assert : subj.equal [ 5 ] [ 5 ] === True
        , differentElement = assert : subj.equal [ 3 ] [ 7 ] === False
        }
      , multipleElementLists =
        { sameElements = assert : subj.equal [ 1, 2, 3 ] [ 1, 2, 3 ] === True
        , differentElements =
            assert : subj.equal [ 1, 2, 3 ] [ 1, 2, 4 ] === False
        , sameElementsDifferentOrder =
            assert : subj.equal [ 1, 2, 3 ] [ 3, 2, 1 ] === False
        , firstElementDifferent =
            assert : subj.equal [ 0, 2, 3 ] [ 1, 2, 3 ] === False
        , lastElementDifferent =
            assert : subj.equal [ 1, 2, 3 ] [ 1, 2, 4 ] === False
        , middleElementDifferent =
            assert : subj.equal [ 1, 2, 3 ] [ 1, 5, 3 ] === False
        }
      , differentLengths =
        { shorterVsLonger = assert : subj.equal [ 1, 2 ] [ 1, 2, 3 ] === False
        , longerVsShorter = assert : subj.equal [ 1, 2, 3 ] [ 1, 2 ] === False
        , prefixMatch = assert : subj.equal [ 1, 2, 3 ] [ 1, 2, 3, 4 ] === False
        }
      , longerLists =
        { sameLongLists =
              assert
            : subj.equal [ 1, 2, 3, 4, 5, 6 ] [ 1, 2, 3, 4, 5, 6 ] === True
        , differentLongLists =
              assert
            : subj.equal [ 1, 2, 3, 4, 5, 6 ] [ 1, 2, 3, 4, 5, 7 ] === False
        }
      }
    }
