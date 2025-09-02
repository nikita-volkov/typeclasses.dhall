let Applicative = ./Type.dhall

let Prelude = ../../Prelude.dhall

in  \(F : Type -> Type) ->
    \(applicative : Applicative F) ->
    \(A : Type) ->
    \(B : Type) ->
    \(C : Type) ->
    \(D : Type) ->
    \(f : A -> B -> C -> D) ->
    \(fa : F A) ->
    \(fb : F B) ->
    \(fc : F C) ->
      applicative.map2
        (C -> D)
        C
        D
        (\(cd : C -> D) -> cd)
        (applicative.map2 A B (C -> D) f fa fb)
        fc
