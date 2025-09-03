let Prelude = ../../Prelude.dhall

let Arbitrary = ../../Classes/Arbitrary/Type.dhall

let Natural/div
    : Natural -> Natural -> Optional Natural
    = let quotient =
            https://github.com/jcaesar/dhall-div/releases/download/1/quotient.dhall
              sha256:d6a994f4b431081e877a0beac02f5dcc98f3ea5b027986114487578056cb3db9

      in  \(a : Natural) ->
          \(b : Natural) ->
            if    Prelude.Natural.isZero b
            then  None Natural
            else  Some (quotient a b).q

let generate
    : Natural -> Natural -> Natural
    = \(seed : Natural) ->
      \(depth : Natural) ->
        let divisor = if Prelude.Natural.isZero depth then 1 else depth

        let result = Natural/div (seed + depth) divisor

        in  Prelude.Optional.default Natural (seed + depth) result

in  { generate } : Arbitrary Natural
