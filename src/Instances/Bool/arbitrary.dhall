let Arbitrary = ../../Classes/Arbitrary/Type.dhall

let generate
    : Natural -> Natural -> Bool
    = \(seed : Natural) -> \(depth : Natural) ->
        -- Generate Bool based on seed modulo 2
        let remainder = Natural/subtract (seed + depth) 2
        in Natural/isZero remainder

in  { generate } : Arbitrary Bool