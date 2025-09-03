{-|
Optional typeclass instances providing complete monadic functionality.

Supports all major typeclasses including functors, monads, and alternatives,
enabling full functional programming workflows with optional values.
-}
{ functor = ./functor.dhall
, applicative = ./applicative.dhall
, monad = ./monad.dhall
, alternative = ./alternative.dhall
, equality = ./equality.dhall
, ordering = ./ordering.dhall
, arbitrary = ./arbitrary.dhall
}
