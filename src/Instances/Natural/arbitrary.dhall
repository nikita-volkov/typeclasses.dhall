let Prelude = ../../Prelude.dhall

let Arbitrary = ../../Classes/Arbitrary/Type.dhall

let generate
    : Natural -> Natural -> Natural
    = \(seed : Natural) -> \(depth : Natural) ->
        -- Simple generation: use seed modulo some value based on depth
        let modulus = if Natural/isZero depth then 1000 else Natural/subtract depth 10
        let modulus = if Natural/isZero modulus then 1 else modulus
        in Natural/subtract (seed + depth) modulus

in  { generate } : Arbitrary Natural