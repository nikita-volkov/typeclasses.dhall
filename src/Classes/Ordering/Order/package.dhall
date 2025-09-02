let Order = ./Type.dhall

let Handler = ./Handler/package.dhall

let ConcreteHandler
    : forall (Result : Type) -> Handler.Type Result
    = ./ConcreteHandler.dhall

in  { Type = Order, Handler, ConcreteHandler }
