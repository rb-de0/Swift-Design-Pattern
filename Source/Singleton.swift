
class Hoge{
    static let sharedInstance = Hoge()
    
    func run(){
        print("hoge hoge")
    }
}

Hoge.sharedInstance.run() // => hoge hoge
