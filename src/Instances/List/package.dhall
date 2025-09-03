{-|
List typeclass instances for equality, ordering, and arbitrary generation.

All instances use lexicographic semantics and require element instances.
-}
{ arbitrary = ./arbitrary.dhall
, equality = ./equality.dhall
, ordering = ./ordering.dhall
, functor = ./functor.dhall
, applicative = ./applicative.dhall
, monad = ./monad.dhall
, alternative = ./alternative.dhall
}
