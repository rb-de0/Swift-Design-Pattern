
protocol Testable{
    func test() -> String
}

class UnitTest: Testable{
    func test() -> String{
        return "run unit test"
    }
}

class IntergrationTest: Testable{
    func test() -> String{
        return "run integration test"
    }
}

class FastTest{
    private let testable: Testable
    
    init(testable: Testable){
        self.testable = testable
    }
    
    func test(){
        print(self.testable.test() + " fast")
    }
}

let fastUnitTest = FastTest(testable: UnitTest())
fastUnitTest.test() // => run unit test fast

let fastIntegrationTest = FastTest(testable: IntergrationTest())
fastIntegrationTest.test() // => run integration test fast
