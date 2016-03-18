
class Context{
    private(set) var tokens: [Character]
    private(set) var currentToken: Character
    
    init?(tokens: String){
        self.currentToken = tokens.isEmpty ? Character("") : tokens.characters.first!
        self.tokens = tokens.characters.map{$0}
        next()
        
        if tokens.isEmpty{
            return nil
        }
    }
    
    func next(){
        if hasNext(){
            self.currentToken = self.tokens.removeFirst()
        }
    }
    
    func hasNext() -> Bool{
        return self.tokens.count > 0
    }
}

protocol Expression{
    func interpret(context: Context) -> String
}

class TerminalExpression: Expression{
    private(set) var targetToken = ""
    
    func interpret(context: Context) -> String{
        let token = context.currentToken
        targetToken = String(token)
        context.next()
        return String(token)
    }
}

class NonterminalExpression: Expression{
    private let startTag: Character = "?"
    private let endTag: Character = "/"
    
    private var childExpressionList = [Expression?]()
    private var result = ""
    
    func interpret(context: Context) -> String {
        context.next()
        
        while context.hasNext(){
            var childExpression: Expression?
            
            let token = context.currentToken
            
            if token == startTag{
                result +=  " [ "
                childExpression = NonterminalExpression()
            }else if token == endTag{
                result +=  " ] "
                context.next()
                break
            }else{
                childExpression = TerminalExpression()
            }
            
            result += childExpression?.interpret(context) ?? ""
            childExpressionList.append(childExpression)
            
        }
        
        return result
    }
}

if let context = Context(tokens: "?akari?ichigo?aoi/ran/yurika/"){
    let expression = NonterminalExpression()
    print(expression.interpret(context)) // => akari [ ichigo [ aoi ] ran ] yurika
}
