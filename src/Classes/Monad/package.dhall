{-|
Monad typeclass for sequential, dependent computation.
-}
let Monad
    : (Type -> Type) -> Type
    = ./Type.dhall

in  { Type = Monad }
