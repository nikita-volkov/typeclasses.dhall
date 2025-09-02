let Self = ./Type.dhall

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

in  { Type = Self, equal, notEqual }
