
class Memento<T>{
    let value: T
    
    init(value: T){
        self.value = value
    }
}

class Calc{
    private(set) var value: Int
    
    init(value: Int){
        self.value = value
    }
    
    init(memento: Memento<Int>){
        value = memento.value
    }
    
    func plus(plus: Int){
        value += plus
    }
    
    func createMemento() -> Memento<Int>{
        return Memento(value: value)
    }
    
    func setMemento(memento: Memento<Int>){
        value = memento.value
    }
}

let calc = Calc(value: 0)

Array(1...5).forEach{calc.plus($0)}
print(calc.value) // => 15

let mem1_5 = calc.createMemento()

let calc2 = Calc(memento: mem1_5)

Array(6...10).forEach{calc.plus($0)}
print(calc.value) // => 55
