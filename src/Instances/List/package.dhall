{-|
List typeclass instances for equality, ordering, and arbitrary generation.

All instances use lexicographic semantics and require element instances.
-}
{ arbitrary = ./arbitrary.dhall
, equality = ./equality.dhall
, ordering = ./ordering.dhall
}
