let Applicative = ./Type.dhall

let Prelude = ../../Prelude.dhall

in  \(F : Type -> Type) ->
    \(applicative : Applicative F) ->
    \(A : Type) ->
    \(B : Type) ->
    \(C : Type) ->
    \(f : A -> B -> C) ->
    \(fa : F A) ->
    \(fb : F B) ->
      applicative.map2 A B C f fa fb
