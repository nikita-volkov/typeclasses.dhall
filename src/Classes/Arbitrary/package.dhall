let Self = ./Type.dhall

let sample
    : forall (A : Type) ->
      Self A ->
      Natural ->
        List A
    = ./sample.dhall

in  { Type = Self, sample }
