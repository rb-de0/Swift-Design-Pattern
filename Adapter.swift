
protocol Adapter{
    typealias ObjectType
    func createObject() -> ObjectType
}

class ViewFactory{
    func createView() -> String{
        return "NewView"
    }
}

class AdaptedViewFactory: ViewFactory, Adapter{
    func createObject() -> String{
        return super.createView()
    }
}

let factory = AdaptedViewFactory()
print(factory.createObject()) // => NewView
