
struct Hoge{
    let value: Int
}

class HogeGenerator: GeneratorType{
    private var hogeList: [Hoge]
    
    init(hogeList: [Hoge]){
        self.hogeList = hogeList.sort{$0.value < $1.value}
    }
    
    func next() -> Hoge? {
        return hogeList.isEmpty ? nil : hogeList.removeAtIndex(0)
    }
}

class HogeCollection: SequenceType{
    private let hogeList: [Hoge]
    
    init(hogeList: [Hoge]){
        self.hogeList = hogeList
    }
    
    func generate() -> HogeGenerator {
        return HogeGenerator(hogeList: hogeList)
    }
}

var hogeList = [
    Hoge(value: 30),
    Hoge(value: 15),
    Hoge(value: 7),
    Hoge(value: 20)
]

let collection = HogeCollection(hogeList: hogeList)
collection.forEach{
    print($0)
}

/* output

Hoge(value: 7)
Hoge(value: 15)
Hoge(value: 20)
Hoge(value: 30)

*/
