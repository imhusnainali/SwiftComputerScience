
// TODO: Convert into a framework with unit tests and use the DataStructures’ Stack.

public struct Stack<T> {
    private var array = Array<T>()
    
    public init() {
    }
    
    public init(elements: [T]) {
        self.array = elements
    }
    
    public func count() -> Int {
        return self.array.count
    }
    
    public func peek() -> T? {
        return self.array.last
    }
    
    public mutating func push(object: T) {
        self.array.append(object)
    }
    
    public mutating func pop() -> T {
        return self.array.removeLast()
    }
}

extension String {
    func reversed1() -> String {
        var s = Stack<Character>()
        let chars = self.characters
        for c in chars {
            s.push(object: c)
        }
        var r = [Character]()
        while s.peek() != nil {
            r.append(s.pop())
        }
        return String(r)
    }
    
    func reversed2() -> String {
        var r = [Character]()
        var chars = self.characters
        while chars.last != nil {
            r.append(chars.last!)
            chars.removeLast()
        }
        return String(r)
    }
    
    func reversed3() -> String {
        if self.characters.count == 0 {
            return ""
        }
        
        var r = Array(self.characters)
        var leftIndex = 0
        var rightIndex = r.count - 1
        
        while leftIndex < rightIndex {
            let leftC = r[leftIndex]
            let rightC = r[rightIndex]
            r[leftIndex] = rightC
            r[rightIndex] = leftC
            leftIndex += 1
            rightIndex -= 1
        }
        
        return String(r)
    }
    
    mutating func reverse() {
        var leftIndex = self.startIndex
        var rightIndex = self.index(self.endIndex, offsetBy: -1)
        while leftIndex < rightIndex {
            let leftChar = self[leftIndex]
            let rightChar = self[rightIndex]
            self.replaceSubrange(leftIndex ..< self.index(leftIndex, offsetBy: 1), with: String(rightChar))
            self.replaceSubrange(rightIndex ..< self.index(rightIndex, offsetBy: 1), with: String(leftChar))
            leftIndex = self.index(leftIndex, offsetBy: 1)
            rightIndex = self.index(rightIndex, offsetBy: -1)
        }
    }
}

let first = "Rogelio".reversed1()
let second = "Rogelio".reversed2()
let third = "Rogelio".reversed3()
var mutant = "Rogelio"
mutant.reverse()
