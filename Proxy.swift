
import Foundation

protocol RequestManagerType{
    func sendRequest(data: String)
}

class RequestManager: RequestManagerType{
    func sendRequest(data: String) {
        print("sending \(data)")
    }
}

class RequestManagerProxy: RequestManagerType{
    private let original: RequestManagerType
    
    init(original: RequestManagerType){
        self.original = original
    }
    
    func sendRequest(data: String) {
        if data.isEmpty{
            return
        }
        
        original.sendRequest(data)
    }
}

let managerProxy = RequestManagerProxy(original: RequestManager())

managerProxy.sendRequest("") // -> ""
managerProxy.sendRequest("data") // -> sending data
