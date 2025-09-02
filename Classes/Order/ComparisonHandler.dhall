\(Result : Type) ->
\(defaultResult : Result) ->
  let Self = { Smaller : Result, Equal : Result, Greater : Result }

  let default
      : Self
      = { Smaller = defaultResult
        , Equal = defaultResult
        , Greater = defaultResult
        }

  in  { Type = Self, default }
