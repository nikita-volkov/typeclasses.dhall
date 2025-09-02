let Self = ./Type.dhall

let Handler = ./Handler/package.dhall

let ConcreteHandler = ./ConcreteHandler.dhall

in  { Type = Self, Handler, ConcreteHandler }
