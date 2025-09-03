{-|
Functor typeclass for types that can be mapped over.
-}
let Functor
    : (Type -> Type) -> Type
    = ./Type.dhall

in  { Type = Functor }
