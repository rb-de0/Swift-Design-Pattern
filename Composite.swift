
protocol Object{
    var name: String { get }
    func open()
}

struct File: Object{
    let name: String
    
    func open() {
        print("\(name) was opened")
    }
}

struct Directory: Object {
    let fileList: [Object]
    let name: String
    
    func open() {
        print("\(name) was opened")
        fileList.forEach{
            $0.open()
        }
    }
}

let objectList: [Object] = [
    File(name: "file01"),
    File(name: "file02"),
    File(name: "file03"),
    Directory(fileList: [
        File(name: "dir01_file01"),
        File(name: "dir01_file02"),
        File(name: "dir01_file02"),
    ], name: "directory01")
]


objectList.forEach{
    $0.open()
}

/* output

file01 was opened
file02 was opened
file03 was opened
directory01 was opened
dir01_file01 was opened
dir01_file02 was opened
dir01_file02 was opened

*/
