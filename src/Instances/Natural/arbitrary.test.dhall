let arbitrary = ./arbitrary.dhall

let generate = arbitrary.generate

in  { generate =
      { differentSeeds =
        { seed0depth0 = assert : generate 0 0 === 0
        , seed1depth0 = assert : generate 1 0 === 1
        , seed5depth0 = assert : generate 5 0 === 5
        }
      , differentDepths =
        { seed0depth1 = assert : generate 0 1 === 1
        , seed0depth2 = assert : generate 0 2 === 1
        }
      }
    }