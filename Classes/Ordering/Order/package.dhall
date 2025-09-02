let Order = ./Type.dhall

let Handler = ./Handler/package.dhall

let ConcreteHandler = ./ConcreteHandler.dhall

in  { Type = Order, Handler, ConcreteHandler }
