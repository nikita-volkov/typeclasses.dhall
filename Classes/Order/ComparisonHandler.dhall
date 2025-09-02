\(Result : Type) ->
\(defaultResult : Result) ->
  let Self = { Less : Result, Equal : Result, Greater : Result }

  let default
      : Self
      = { Less = defaultResult, Equal = defaultResult, Greater = defaultResult }

  in  { Type = Self, default }
