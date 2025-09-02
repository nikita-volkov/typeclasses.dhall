\(Result : Type) ->
  let Self
      : Type
      = ./Type.dhall Result

  let default
      : Result -> Self
      = ./default.dhall Result

  in  { Type = Self, default }
