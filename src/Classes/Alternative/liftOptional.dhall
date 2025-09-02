let Alternative = ./Type.dhall

let Prelude = ../../Prelude.dhall

in  \(F : Type -> Type) ->
    \(alternative : Alternative F) ->
    \(A : Type) ->
    \(optional : Optional A) ->
        Prelude.Optional.fold
          A
          optional
          (F A)
          (\(value : A) -> alternative.applicative.pure A value)
          (alternative.empty A)
      : F A
