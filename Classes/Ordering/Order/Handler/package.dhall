let Self
    : Type -> Type
    = ./Type.dhall

let default
    : forall (Result : Type) -> Result -> Self Result
    = ./default.dhall

let AppliedApi = ./AppliedApi.dhall

in  { Type = Self, default, AppliedApi }
