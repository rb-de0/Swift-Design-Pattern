 
 protocol State{
    func run()
    func stop()
 }
 
 class HogeState: State{
    func run() {
        print("hoge run")
    }
    
    func stop() {
        print("hoge stop")
    }
 }
 
 class FooState: State{
    func run() {
        print("foo run")
    }
    
    func stop() {
        print("foo stop")
    }
 }
 
 var state: State
 
 state = HogeState()
 state.run() // => hoge run
 state.stop() // => hoge stop
 
 state = FooState()
 state.run() // => foo run
 state.stop() // => foo stop
 