let Applicative = ./Type.dhall

in  \(F : Type -> Type) ->
    \(applicative : Applicative F) ->
    \(A : Type) ->
    \(a : A) ->
      applicative.pure A a
