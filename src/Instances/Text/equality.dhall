let Prelude = ../../Prelude.dhall

let Equality = ../../Classes/Equality/Type.dhall

let equal = Prelude.Text.equal

in  { equal } : Equality Text