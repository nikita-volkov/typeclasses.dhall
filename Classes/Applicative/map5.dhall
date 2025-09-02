let Applicative = ./Type.dhall

let Prelude = ../../Prelude.dhall

in  \(F : Type -> Type) ->
    \(applicative : Applicative F) ->
    \(A : Type) ->
    \(B : Type) ->
    \(C : Type) ->
    \(D : Type) ->
    \(E : Type) ->
    \(G : Type) ->
    \(f : A -> B -> C -> D -> E -> G) ->
    \(fa : F A) ->
    \(fb : F B) ->
    \(fc : F C) ->
    \(fd : F D) ->
    \(fe : F E) ->
      applicative.map2
        (E -> G)
        E
        G
        (\(eg : E -> G) -> eg)
        ( applicative.map2
            (D -> E -> G)
            D
            (E -> G)
            (\(deg : D -> E -> G) -> deg)
            ( applicative.map2
                (C -> D -> E -> G)
                C
                (D -> E -> G)
                (\(cdeg : C -> D -> E -> G) -> cdeg)
                (applicative.map2 A B (C -> D -> E -> G) f fa fb)
                fc
            )
            fd
        )
        fe
