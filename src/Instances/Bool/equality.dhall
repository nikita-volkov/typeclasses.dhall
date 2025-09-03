let Equality = ../../Classes/Equality/Type.dhall

let equal
    : Bool -> Bool -> Bool
    = \(left : Bool) ->
      \(right : Bool) ->
        if left then right else if right then False else True

in  { equal } : Equality Bool
