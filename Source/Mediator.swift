
protocol Mediator: class{
    func sendMessage(message: String)
}

protocol Colleague{
    weak var mediator: Mediator? { get set }
    
    init(mediator: Mediator)
    func didRecievedMessage(message: String)
}

extension Colleague{
    func bloadCast(message: String){
        mediator?.sendMessage(message)
    }
}

class HogeMediator: Mediator{
    private var colleagueList = [Colleague]()
    
    func addCollegue(collegue: Colleague...){
        collegue.forEach{colleagueList.append($0)}
    }
    
    func sendMessage(message: String) {
        colleagueList.forEach{$0.didRecievedMessage(message)}
    }
}

class HogeColleagueA: Colleague{
    weak var mediator: Mediator?
    
    required init(mediator: Mediator) {
        self.mediator = mediator
    }
    
    func didRecievedMessage(message: String) {
        print("A is recieved \(message)")
    }
}

class HogeColleagueB: Colleague{
    weak var mediator: Mediator?
    
    required init(mediator: Mediator) {
        self.mediator = mediator
    }
    
    func didRecievedMessage(message: String) {
        print("B is recieved \(message)")
    }
}

let mediator = HogeMediator()

let hogeA = HogeColleagueA(mediator: mediator)
let hogeB = HogeColleagueB(mediator: mediator)

mediator.addCollegue(hogeA, hogeB)

hogeA.bloadCast("A")

/* output

A is recieved A
B is recieved A

*/
