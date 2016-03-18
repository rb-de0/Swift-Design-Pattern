
class AbstractHoge{
    func cut(){
        fatalError()
    }
    
    func boil(){
        fatalError()
    }
}

class AHoge: AbstractHoge{
    override func cut() {
        print("A cut")
    }
    
    override func boil() {
        print("A boil")
    }
}

class BHoge: AbstractHoge{
    override func cut() {
        print("B cut")
    }
    
    override func boil() {
        print("B boil")
    }
}

let aHoge = AHoge()
aHoge.cut()
aHoge.boil()

let bHoge = BHoge()
bHoge.cut()
bHoge.boil()

/* output

A cut
A boil
B cut
B boil

*/