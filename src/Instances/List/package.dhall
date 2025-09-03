{-|
List typeclass instances for equality, ordering, and functional programming abstractions.

Supports all major typeclasses including functors, monads, and alternatives,
enabling full functional programming workflows with lists using lexicographic semantics.
-}
{ arbitrary = ./arbitrary.dhall
, equality = ./equality.dhall
, ordering = ./ordering.dhall
, functor = ./functor.dhall
, applicative = ./applicative.dhall
, monad = ./monad.dhall
, alternative = ./alternative.dhall
}
