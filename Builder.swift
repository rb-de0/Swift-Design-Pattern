
class Hoge{
    var a: Double?
    var b: Double?
    var c: Double?
    
    init(_ build: (Hoge -> Void)){
        build(self)
    }
}

let hoge = Hoge{
    $0.a = 1.0
    $0.b = 1.0
}

