let Prelude = ../../Prelude.dhall

let Equality = ../../Classes/Equality/Type.dhall

let equal = Prelude.Integer.equal

in  { equal } : Equality Integer