\(Result : Type) ->
  let Self = ./Type.dhall Result

  let default
      : Result -> Self
      = ./default.dhall Result

  in  { Type = Self, default }
