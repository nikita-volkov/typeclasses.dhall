let Arbitrary = ../../Classes/Arbitrary/Type.dhall

let arbitrary
    : forall (A : Type) -> Arbitrary A -> Arbitrary (Optional A)
    = \(A : Type) -> \(arbA : Arbitrary A) ->
        let generate = \(seed : Natural) -> \(depth : Natural) ->
              -- Generate None roughly 1/3 of the time
              let remainder = Natural/subtract (seed + depth) 3
              in if Natural/isZero remainder
                 then None A
                 else Some (arbA.generate seed depth)
        in { generate }

in arbitrary