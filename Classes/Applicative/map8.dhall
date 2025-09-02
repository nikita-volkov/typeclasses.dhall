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
    \(f : A -> B -> C -> D -> E -> G -> H -> I -> J) ->
    \(fa : F A) ->
    \(fb : F B) ->
    \(fc : F C) ->
    \(fd : F D) ->
    \(fe : F E) ->
    \(fg : F G) ->
    \(fh : F H) ->
    \(fi : F I) ->
      applicative.map2
        (I -> J)
        I
        J
        (\(ij : I -> J) -> ij)
        ( applicative.map2
            (H -> I -> J)
            H
            (I -> J)
            (\(hij : H -> I -> J) -> hij)
            ( applicative.map2
                (G -> H -> I -> J)
                G
                (H -> I -> J)
                (\(ghij : G -> H -> I -> J) -> ghij)
                ( applicative.map2
                    (E -> G -> H -> I -> J)
                    E
                    (G -> H -> I -> J)
                    (\(eghij : E -> G -> H -> I -> J) -> eghij)
                    ( applicative.map2
                        (D -> E -> G -> H -> I -> J)
                        D
                        (E -> G -> H -> I -> J)
                        (\(deghij : D -> E -> G -> H -> I -> J) -> deghij)
                        ( applicative.map2
                            (C -> D -> E -> G -> H -> I -> J)
                            C
                            (D -> E -> G -> H -> I -> J)
                            ( \(cdeghij : C -> D -> E -> G -> H -> I -> J) ->
                                cdeghij
                            )
                            ( applicative.map2
                                A
                                B
                                (C -> D -> E -> G -> H -> I -> J)
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
