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
    \(f : A -> B -> C -> D -> E -> G -> H -> I) ->
    \(fa : F A) ->
    \(fb : F B) ->
    \(fc : F C) ->
    \(fd : F D) ->
    \(fe : F E) ->
    \(fg : F G) ->
    \(fh : F H) ->
      applicative.map2
        (H -> I)
        H
        I
        (\(hi : H -> I) -> hi)
        ( applicative.map2
            (G -> H -> I)
            G
            (H -> I)
            (\(ghi : G -> H -> I) -> ghi)
            ( applicative.map2
                (E -> G -> H -> I)
                E
                (G -> H -> I)
                (\(eghi : E -> G -> H -> I) -> eghi)
                ( applicative.map2
                    (D -> E -> G -> H -> I)
                    D
                    (E -> G -> H -> I)
                    (\(deghi : D -> E -> G -> H -> I) -> deghi)
                    ( applicative.map2
                        (C -> D -> E -> G -> H -> I)
                        C
                        (D -> E -> G -> H -> I)
                        (\(cdeghi : C -> D -> E -> G -> H -> I) -> cdeghi)
                        ( applicative.map2
                            A
                            B
                            (C -> D -> E -> G -> H -> I)
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
