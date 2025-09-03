let Ordering = ../../Classes/Ordering/Type.dhall

let Order = ../../Classes/Ordering/Order/Type.dhall

let ordering
    : forall (A : Type) -> Ordering A -> Ordering (Optional A)
    = \(A : Type) ->
      \(ordA : Ordering A) ->
        let order =
              \(left : Optional A) ->
              \(right : Optional A) ->
                merge
                  { None =
                      merge
                        { None = Order.Equal, Some = \(_ : A) -> Order.Less }
                        right
                  , Some =
                      \(a : A) ->
                        merge
                          { None = Order.Greater
                          , Some = \(b : A) -> ordA.order a b
                          }
                          right
                  }
                  left

        in  { order }

in  ordering
