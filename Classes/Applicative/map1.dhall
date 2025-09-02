let Applicative = ./Type.dhall

in  \(F : Type -> Type) ->
    \(applicative : Applicative F) ->
    \(A : Type) ->
    \(B : Type) ->
    \(f : A -> B) ->
    \(fa : F A) ->
      applicative.functor.map A B f fa
