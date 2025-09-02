let Prelude = ../../Prelude.dhall

let Equality = ../../Classes/Equality/Type.dhall

let ListExtensions = ../List/package.dhall

in  \(Element : Type) ->
    \(elementEquality : Equality Element) ->
      let equal =
            \(x : Prelude.NonEmpty.Type Element) ->
            \(y : Prelude.NonEmpty.Type Element) ->
                  elementEquality.equal x.head y.head
              &&  (ListExtensions.equality Element elementEquality).equal
                    x.tail
                    y.tail

      in  { equal } : Equality (Prelude.NonEmpty.Type Element)
