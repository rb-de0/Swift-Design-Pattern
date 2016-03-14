
protocol Cloneable{
    func clone() -> Self
    init(clone: Self)
}

class Human: Cloneable{
    var age: Int?
    var weight: Double?
    var height: Double?
    
    init(){}
    
    required init(clone: Human) {
        self.age = clone.age
        self.weight = clone.weight
        self.height = clone.height
    }
    
    func clone() -> Self {
        return self.dynamicType.init(clone: self)
    }
}

let human = Human()
human.age = 21
human.weight = 61.7
human.height = 171.2

let clone = human.clone()

print(clone.age) // => Optional(21)
