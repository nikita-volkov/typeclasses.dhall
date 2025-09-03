let Equality = ../../Classes/Equality/Type.dhall

let equality
    : forall (A : Type) -> Equality A -> Equality (Optional A)
    = \(A : Type) ->
      \(eqA : Equality A) ->
        let equal =
              \(left : Optional A) ->
              \(right : Optional A) ->
                merge
                  { None = merge { None = True, Some = \(_ : A) -> False } right
                  , Some =
                      \(a : A) ->
                        merge
                          { None = False, Some = \(b : A) -> eqA.equal a b }
                          right
                  }
                  left

        in  { equal }

in  equality
