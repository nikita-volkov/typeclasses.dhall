let Applicative = ./Type.dhall

let Prelude = ../../Prelude.dhall

in  \(F : Type -> Type) ->
    \(applicative : Applicative F) ->
    \(A : Type) ->
    \(B : Type) ->
    \(C : Type) ->
    \(D : Type) ->
    \(E : Type) ->
    \(f : A -> B -> C -> D -> E) ->
    \(fa : F A) ->
    \(fb : F B) ->
    \(fc : F C) ->
    \(fd : F D) ->
      applicative.map2
        (D -> E)
        D
        E
        (\(de : D -> E) -> de)
        ( applicative.map2
            (C -> D -> E)
            C
            (D -> E)
            (\(cde : C -> D -> E) -> cde)
            (applicative.map2 A B (C -> D -> E) f fa fb)
            fc
        )
        fd
