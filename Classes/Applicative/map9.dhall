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
    \(f : A -> B -> C -> D -> E -> G -> H -> I -> J -> K) ->
    \(fa : F A) ->
    \(fb : F B) ->
    \(fc : F C) ->
    \(fd : F D) ->
    \(fe : F E) ->
    \(fg : F G) ->
    \(fh : F H) ->
    \(fi : F I) ->
    \(fj : F J) ->
      applicative.map2
        (J -> K)
        J
        K
        (\(jk : J -> K) -> jk)
        ( applicative.map2
            (I -> J -> K)
            I
            (J -> K)
            (\(ijk : I -> J -> K) -> ijk)
            ( applicative.map2
                (H -> I -> J -> K)
                H
                (I -> J -> K)
                (\(hijk : H -> I -> J -> K) -> hijk)
                ( applicative.map2
                    (G -> H -> I -> J -> K)
                    G
                    (H -> I -> J -> K)
                    (\(ghijk : G -> H -> I -> J -> K) -> ghijk)
                    ( applicative.map2
                        (E -> G -> H -> I -> J -> K)
                        E
                        (G -> H -> I -> J -> K)
                        (\(eghijk : E -> G -> H -> I -> J -> K) -> eghijk)
                        ( applicative.map2
                            (D -> E -> G -> H -> I -> J -> K)
                            D
                            (E -> G -> H -> I -> J -> K)
                            ( \(deghijk : D -> E -> G -> H -> I -> J -> K) ->
                                deghijk
                            )
                            ( applicative.map2
                                (C -> D -> E -> G -> H -> I -> J -> K)
                                C
                                (D -> E -> G -> H -> I -> J -> K)
                                ( \ ( cdeghijk
                                    : C -> D -> E -> G -> H -> I -> J -> K
                                    ) ->
                                    cdeghijk
                                )
                                ( applicative.map2
                                    A
                                    B
                                    (C -> D -> E -> G -> H -> I -> J -> K)
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
