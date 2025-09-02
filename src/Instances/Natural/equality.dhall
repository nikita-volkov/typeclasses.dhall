let Prelude = ../../Prelude.dhall

let Equality = ../../Classes/Equality/Type.dhall

let equal = Prelude.Natural.equal

in  { equal } : Equality Natural
