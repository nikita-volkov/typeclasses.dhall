let Arbitrary = ./Type.dhall

let sample
    : forall (A : Type) -> Arbitrary A -> Natural -> List A
    = ./sample.dhall

in  { Type = Arbitrary, sample }
