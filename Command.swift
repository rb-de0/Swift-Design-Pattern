
import Foundation

class System{
    private var isRunning = false
    private var data = [String]()
    
    static let sharedSystem = System()
    
    func shotDown(){
        NSThread.sleepForTimeInterval(2)
        isRunning = false
        data.removeAll()
        
        print("shotdown")
    }
    
    func boot(){
        NSThread.sleepForTimeInterval(2)
        isRunning = false
        data.append("init")
        
        print("boot")
    }
    
    func reboot(){
        shotDown()
        boot()
        
        print("reboot")
    }
}

protocol SystemCommand{
    var system: System{ get }
    
    init(system: System)
    func run()
}

class SystemBootCommand: SystemCommand{
    let system: System
    
    required init(system: System){
        self.system = system
    }
    
    func run(){
        system.boot()
    }
}

class SystemShotDownCommand: SystemCommand{
    let system: System
    
    required init(system: System){
        self.system = system
    }
    
    func run(){
        system.shotDown()
    }
}

class SystemRebootCommand: SystemCommand{
    let system: System
    
    required init(system: System){
        self.system = system
    }
    
    func run(){
        system.reboot()
    }
}


let shotDown = SystemShotDownCommand(system: System.sharedSystem)
let boot = SystemBootCommand(system: System.sharedSystem)
let reboot = SystemRebootCommand(system: System.sharedSystem)

shotDown.run()
boot.run()
reboot.run()

/* output

shotdown
boot
shotdown
boot
reboot

*/
