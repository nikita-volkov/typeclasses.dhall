let arbitrary = ./arbitrary.dhall

let generate = arbitrary.generate

in  { generate =
      { evenSeeds =
        { seed0 = assert : generate 0 0 === True
        , seed2 = assert : generate 2 0 === True
        , seed4 = assert : generate 4 0 === True
        }
      , oddSeeds =
        { seed1 = assert : generate 1 0 === False
        , seed3 = assert : generate 3 0 === False
        , seed5 = assert : generate 5 0 === False
        }
      }
    }