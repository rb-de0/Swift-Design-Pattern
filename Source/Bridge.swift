
protocol Runnable{
    func run()
}

class Runner{
    private let runnable: Runnable
    
    init(runnable: Runnable){
        self.runnable = runnable
    }
    
    func run() {
        runnable.run()
    }
}

class RunnableA: Runnable{
    func run(){
        print("run a")
    }
}

class RunnableB: Runnable{
    func run(){
        print("run b")
    }
}

var runner: Runner

runner = Runner(runnable: RunnableA())
runner.run() // => run a

runner = Runner(runnable: RunnableB())
runner.run() // => run b
