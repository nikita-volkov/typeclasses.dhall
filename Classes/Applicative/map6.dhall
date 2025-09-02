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
    \(H : Type) ->
    \(f : A -> B -> C -> D -> E -> G -> H) ->
    \(fa : F A) ->
    \(fb : F B) ->
    \(fc : F C) ->
    \(fd : F D) ->
    \(fe : F E) ->
    \(fg : F G) ->
      applicative.map2
        (G -> H)
        G
        H
        (\(gh : G -> H) -> gh)
        ( applicative.map2
            (E -> G -> H)
            E
            (G -> H)
            (\(egh : E -> G -> H) -> egh)
            ( applicative.map2
                (D -> E -> G -> H)
                D
                (E -> G -> H)
                (\(degh : D -> E -> G -> H) -> degh)
                ( applicative.map2
                    (C -> D -> E -> G -> H)
                    C
                    (D -> E -> G -> H)
                    (\(cdegh : C -> D -> E -> G -> H) -> cdegh)
                    (applicative.map2 A B (C -> D -> E -> G -> H) f fa fb)
                    fc
                )
                fd
            )
            fe
        )
        fg
