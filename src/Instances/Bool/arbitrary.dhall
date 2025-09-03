let Arbitrary = ../../Classes/Arbitrary/Type.dhall

let generate
    : Natural -> Natural -> Bool
    = \(seed : Natural) ->
      \(depth : Natural) ->
        let remainder = Natural/subtract (seed + depth) 2

        in  Natural/isZero remainder

in  { generate } : Arbitrary Bool
