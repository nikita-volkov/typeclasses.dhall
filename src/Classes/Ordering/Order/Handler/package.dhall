{-|
Handler utilities for pattern matching on Order values.

Exports: Type, default.
-}
let Self
    : Type -> Type
    = ./Type.dhall

let default
    : forall (Result : Type) -> Result -> Self Result
    = ./default.dhall

in  { Type = Self, default }
