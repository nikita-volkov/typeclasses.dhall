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
    \(I : Type) ->
    \(J : Type) ->
    \(K : Type) ->
    \(L : Type) ->
    \(f : A -> B -> C -> D -> E -> G -> H -> I -> J -> K -> L) ->
    \(fa : F A) ->
    \(fb : F B) ->
    \(fc : F C) ->
    \(fd : F D) ->
    \(fe : F E) ->
    \(fg : F G) ->
    \(fh : F H) ->
    \(fi : F I) ->
    \(fj : F J) ->
    \(fk : F K) ->
      applicative.map2
        (K -> L)
        K
        L
        (\(kl : K -> L) -> kl)
        ( applicative.map2
            (J -> K -> L)
            J
            (K -> L)
            (\(jkl : J -> K -> L) -> jkl)
            ( applicative.map2
                (I -> J -> K -> L)
                I
                (J -> K -> L)
                (\(ijkl : I -> J -> K -> L) -> ijkl)
                ( applicative.map2
                    (H -> I -> J -> K -> L)
                    H
                    (I -> J -> K -> L)
                    (\(hijkl : H -> I -> J -> K -> L) -> hijkl)
                    ( applicative.map2
                        (G -> H -> I -> J -> K -> L)
                        G
                        (H -> I -> J -> K -> L)
                        (\(ghijkl : G -> H -> I -> J -> K -> L) -> ghijkl)
                        ( applicative.map2
                            (E -> G -> H -> I -> J -> K -> L)
                            E
                            (G -> H -> I -> J -> K -> L)
                            ( \(eghijkl : E -> G -> H -> I -> J -> K -> L) ->
                                eghijkl
                            )
                            ( applicative.map2
                                (D -> E -> G -> H -> I -> J -> K -> L)
                                D
                                (E -> G -> H -> I -> J -> K -> L)
                                ( \ ( deghijkl
                                    : D -> E -> G -> H -> I -> J -> K -> L
                                    ) ->
                                    deghijkl
                                )
                                ( applicative.map2
                                    (C -> D -> E -> G -> H -> I -> J -> K -> L)
                                    C
                                    (D -> E -> G -> H -> I -> J -> K -> L)
                                    ( \ ( cdeghijkl
                                        : C ->
                                          D ->
                                          E ->
                                          G ->
                                          H ->
                                          I ->
                                          J ->
                                          K ->
                                            L
                                        ) ->
                                        cdeghijkl
                                    )
                                    ( applicative.map2
                                        A
                                        B
                                        ( C ->
                                          D ->
                                          E ->
                                          G ->
                                          H ->
                                          I ->
                                          J ->
                                          K ->
                                            L
                                        )
                                        f
                                        fa
                                        fb
                                    )
                                    fc
                                )
                                fd
                            )
                            fe
                        )
                        fg
                    )
                    fh
                )
                fi
            )
            fj
        )
        fk
