
class Task{
    let name: String
    
    init(name: String){
        self.name = name
    }
}

protocol Responsible: class{
    var next: Responsible? { get set }
    
    func isEnableToDoTask(task: Task) -> Bool
    func doTask(task: Task)
}

extension Responsible{
    private func setNext(next: Responsible) -> Responsible{
        self.next = next
        return self
    }
    
    func putTask(task: Task){
        if isEnableToDoTask(task){
            doTask(task)
        }else if let nextObject = next{
            nextObject.putTask(task)
        }else{
            print("inexcutable task")
        }
    }
}

class Hoge: Responsible{
    var next: Responsible?
    
    func isEnableToDoTask(task: Task) -> Bool {
        return true
    }
    
    func doTask(task: Task) {
        print("do")
    }
}

let hoge1 = Hoge()
let hoge2 = Hoge()
let hoge3 = Hoge()

hoge1.setNext(hoge2).setNext(hoge3)
hoge1.putTask(Task(name: "task"))
