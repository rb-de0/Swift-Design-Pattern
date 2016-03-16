
class DataManager{
    private var dataList = [String: Int]()
    
    func addData(dataList: (key: String, data: Int)...){
        dataList
            .filter{self.dataList[$0.key] == nil}
            .forEach{self.dataList.updateValue($0.data, forKey: $0.key)}
    }
    
    func dataForKey(key: String) -> Int?{
        return dataList[key]
    }
}

let manager = DataManager()

manager.addData(
    (key: "hoge1", data: 1),
    (key: "hoge2", data: 1),
    (key: "hoge3", data: 1),
    (key: "hoge1", data: 1),
    (key: "hoge2", data: 2)
)

print(manager.dataList.count) // => 3
