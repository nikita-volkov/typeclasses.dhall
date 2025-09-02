let Self
    : Type -> Type
    = ./Type.dhall

let default
    : forall (Result : Type) -> Result -> Self Result
    = ./default.dhall

in  { Type = Self, default }
