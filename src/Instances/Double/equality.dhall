let Prelude = ../../Prelude.dhall

let Equality = ../../Classes/Equality/Type.dhall

let equal = Prelude.Double.equal

in  { equal } : Equality Double