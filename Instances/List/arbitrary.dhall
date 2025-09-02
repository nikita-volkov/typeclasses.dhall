let Prelude = ../../Prelude.dhall

let Classes = ../../Classes/package.dhall

let Arbitrary = Classes.Arbitrary

let NaturalExtensions = ../Natural/package.dhall

let Natural/div =
      let quotient =
            https://github.com/jcaesar/dhall-div/releases/download/1/quotient.dhall
              sha256:d6a994f4b431081e877a0beac02f5dcc98f3ea5b027986114487578056cb3db9

      in  \(a : Natural) ->
          \(b : Natural) ->
            if    Prelude.Natural.isZero b
            then  None Natural
            else  Some (quotient a b).q

in  \(Element : Type) ->
    \(elementInstance : Arbitrary.Type Element) ->
      let generate
          : Natural -> Natural -> List Element
          = \(iteration : Natural) ->
            \(depth : Natural) ->
              let size = Natural/div iteration depth

              let size = Prelude.Optional.default Natural 0 size

              in  Prelude.List.generate
                    size
                    Element
                    ( \(index : Natural) ->
                        elementInstance.generate
                          (size + index)
                          (Prelude.Natural.subtract 1 depth)
                    )

      in  { generate } : Arbitrary.Type (List Element)
