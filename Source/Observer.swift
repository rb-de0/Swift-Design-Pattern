
protocol ObserverType{
    func update()
}

protocol SubjectType{
    var observerList: [ObserverType] { get }
    
    func addObserver(observer: ObserverType)
    func notify()
}
class Observer: ObserverType{
    func update() {
        print("update")
    }
}

class Subject: SubjectType{
    private(set) var observerList = [ObserverType]()
    
    func addObserver(observer: ObserverType) {
        observerList.append(observer)
    }
    
    func notify() {
        observerList.forEach{
            $0.update()
        }
    }
}

let subject = Subject()
subject.addObserver(Observer())
subject.notify() // => update
