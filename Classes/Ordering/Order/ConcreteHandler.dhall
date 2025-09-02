-- A functor in the OCaml terminology.
-- Constructs a module with non-polymorphic definitions based on the provided type.
let Handler = ./Handler/package.dhall

in  \(Result : Type) ->
      let Self
          : Type
          = Handler.Type Result

      let default
          : Result -> Self
          = Handler.default Result

      in  { Type = Self, default }
