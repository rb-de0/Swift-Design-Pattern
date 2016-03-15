
class Factory{
    
    func source() -> [String]{
        fatalError()
    }
    
    func tool() -> String{
        fatalError()
    }
    
    class func createFactory(age: Int) -> Factory?{
        switch age{
        case 0...15:
            return CakeFactory()
        case 16...80:
            return KaraageFactory()
        default:
            return nil
        }
    }
}

class KaraageFactory: Factory{
    override func source() -> [String] {
        return ["Chicken"]
    }
    
    override func tool() -> String {
        return "Hand"
    }
}

class CakeFactory: Factory{
    override func source() -> [String] {
        return ["Flour", "Egg", "Milk"]
    }
    
    override func tool() -> String {
        return "Hand"
    }
}

if let factory = Factory.createFactory(20){
    print(factory.source())
    print(factory.tool())
}

if let factory = Factory.createFactory(10){
    print(factory.source())
    print(factory.tool())
}

/* output

["Chicken"]
Hand
["Flour", "Egg", "Milk"]
Hand

*/
