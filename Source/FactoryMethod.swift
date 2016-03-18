
protocol Computer{
    func cpu() -> String
    func ram() -> String
}

class MacBookAir: Computer{
    func cpu() -> String {
        return "Intel Core i5-4250U"
    }
    
    func ram() -> String {
        return "8GB"
    }
}

class MacBookPro: Computer{
    func cpu() -> String {
        return "Intel Core i7-5557U"
    }
    
    func ram() -> String {
        return "16GB"
    }
}

class ComputerFactory{
    class func createComputer(age: Int) -> Computer?{
        switch age{
        case 0...15, 41...80:
            return MacBookAir()
        case 16...40:
            return MacBookPro()
        default:
            return nil
        }
    }
}

let mycom = ComputerFactory.createComputer(10)
print(mycom?.cpu())
print(mycom?.ram())

let yourcom = ComputerFactory.createComputer(20)
print(yourcom?.cpu())
print(yourcom?.ram())

/* output

Optional("Intel Core i5-4250U")
Optional("8GB")
Optional("Intel Core i7-5557U")
Optional("16GB")

*/
