let Ordering = ./Type.dhall

let Order = ./Order/package.dhall

let toEquality
    : forall (A : Type) -> Ordering A -> ../Equality/Type.dhall A
    = ./toEquality.dhall

let equal
    : forall (A : Type) -> Ordering A -> A -> A -> Bool
    = ./equal.dhall

let notEqual
    : forall (A : Type) -> Ordering A -> A -> A -> Bool
    = ./notEqual.dhall

let greaterThan
    : forall (A : Type) -> Ordering A -> A -> A -> Bool
    = ./greaterThan.dhall

let greaterThanEqual
    : forall (A : Type) -> Ordering A -> A -> A -> Bool
    = ./greaterThanEqual.dhall

let lessThan
    : forall (A : Type) -> Ordering A -> A -> A -> Bool
    = ./lessThan.dhall

let lessThanEqual
    : forall (A : Type) -> Ordering A -> A -> A -> Bool
    = ./lessThanEqual.dhall

let insertIntoDedupedSortedList
    : forall (A : Type) -> Ordering A -> A -> List A -> List A
    = ./insertIntoDedupedSortedList.dhall

let dedupAndSortList
    : forall (A : Type) -> Ordering A -> List A -> List A
    = ./dedupAndSortList.dhall

in  { Type = Ordering
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
