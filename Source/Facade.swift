
import Foundation

class DataStore{
    static let userDetault = NSUserDefaults.standardUserDefaults()
    
    class func storeObjectForKey(value: AnyObject, key: String){
        userDetault.setObject(value, forKey: key)
        userDetault.synchronize()
    }
    
    class func objectForKey(key: String) -> AnyObject?{
        return userDetault.objectForKey(key)
    }
}

let value = 10
DataStore.storeObjectForKey(value, key: "value")
DataStore.objectForKey("value") // => Playgroundだとnilになるが10が出力される
