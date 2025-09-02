let Self = ./Type.dhall

let Order = ./Order/package.dhall

let toEquality
    : forall (A : Type) ->
      Self A ->
        ../Equality/Type.dhall A
    = ./toEquality.dhall

let equal
    : forall (A : Type) ->
      Self A ->
      A ->
      A ->
        Bool
    = ./equal.dhall

let notEqual
    : forall (A : Type) ->
      Self A ->
      A ->
      A ->
        Bool
    = ./notEqual.dhall

let greaterThan
    : forall (A : Type) ->
      Self A ->
      A ->
      A ->
        Bool
    = ./greaterThan.dhall

let greaterThanEqual
    : forall (A : Type) ->
      Self A ->
      A ->
      A ->
        Bool
    = ./greaterThanEqual.dhall

let lessThan
    : forall (A : Type) ->
      Self A ->
      A ->
      A ->
        Bool
    = ./lessThan.dhall

let lessThanEqual
    : forall (A : Type) ->
      Self A ->
      A ->
      A ->
        Bool
    = ./lessThanEqual.dhall

let insertIntoDedupedSortedList
    : forall (A : Type) ->
      Self A ->
      A ->
      List A ->
        List A
    = ./insertIntoDedupedSortedList.dhall

let dedupAndSortList
    : forall (A : Type) ->
      Self A ->
      List A ->
        List A
    = ./dedupAndSortList.dhall

in  { Type = Self
    , Order
    , toEquality
    , equal
    , notEqual
    , greaterThan
    , greaterThanEqual
    , lessThan
    , lessThanEqual
    , insertIntoDedupedSortedList
    , dedupAndSortList
    }
