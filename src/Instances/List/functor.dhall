let Functor = ../../Classes/Functor/Type.dhall

let map
    : forall (A : Type) -> forall (B : Type) -> (A -> B) -> List A -> List B
    = \(A : Type) -> \(B : Type) -> \(f : A -> B) -> \(xs : List A) ->
        List/fold A xs (List B) (\(a : A) -> \(acc : List B) -> [f a] # acc) ([] : List B)

in  { map } : Functor List