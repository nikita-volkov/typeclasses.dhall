let Prelude = ../../Prelude.dhall

let Ordering = ../../Classes/Ordering/Type.dhall

let Comparison = ../../Classes/Ordering/Comparison.dhall

let compare
    : Natural -> Natural -> Comparison
    = \(left : Natural) ->
      \(right : Natural) ->
        if    Prelude.Natural.lessThan left right
        then  Comparison.Less
        else  if Prelude.Natural.lessThan right left
        then  Comparison.Greater
        else  Comparison.Equal

in  { compare } : Ordering Natural
