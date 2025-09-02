let Alternative = ./Type.dhall

let Prelude = ../../Prelude.dhall

in  \(F : Type -> Type) ->
    \(alternative : Alternative F) ->
    \(A : Type) ->
    \(f : F A) ->
        alternative.or
          (Optional A)
          ( alternative.applicative.functor.map
              A
              (Optional A)
              (\(a : A) -> Some a)
              f
          )
          (alternative.applicative.pure (Optional A) (None A))
      : F (Optional A)
