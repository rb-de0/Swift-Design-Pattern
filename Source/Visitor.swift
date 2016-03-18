
protocol Country{
    func giveSouvenir() -> String
}

protocol Visitor{
    func visitCountry(country: Country)
}

protocol Acceptable{
    func accept(visitor: Visitor)
}

class AmericanVisitor: Visitor{
    private var souvenirList = [String]()
    
    func visitCountry(country: Country) {
        souvenirList.append(country.giveSouvenir())
    }
}

class Japan: Acceptable, Country{
    
    func giveSouvenir() -> String {
        return "緑茶"
    }
    
    func accept(visitor: Visitor) {
        visitor.visitCountry(self)
    }
}

let japan = Japan()
let american = AmericanVisitor()

japan.accept(american)
