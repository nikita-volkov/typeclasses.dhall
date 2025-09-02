\(Result : Type) ->
  let Self = { Less : Result, Equal : Result, Greater : Result }

  let default
      : Result -> Self
      = \(defaultResult : Result) ->
          { Less = defaultResult
          , Equal = defaultResult
          , Greater = defaultResult
          }

  in  { Type = Self, default }
