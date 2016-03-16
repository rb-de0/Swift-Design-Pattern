
protocol Parser{
    func parse(data: String)
}

class JSONParser: Parser{
    func parse(data: String) {
        print("parse json, \(data)")
    }
}

class XMLParser: Parser{
    func parse(data: String) {
        print("parse xml, \(data)")
    }
}

let json = "{\"hoge\": \"hogehoge\"}"
let xml = "<hoge>hogehoge</hoge>"

var parser: Parser

parser = JSONParser()
parser.parse(json) // => parse json, {"hoge": "hogehoge"}

parser = XMLParser()
parser.parse(xml) // => parse xml, <hoge>hogehoge</hoge>
