//
//  BoyerMoore.swift
//  StringSearching
//
//  Created by Rogelio Gudino on 8/28/16.
//  Copyright © 2016 Rogelio Gudino. All rights reserved.
//

private func badCharacterRuleTableForPattern(pattern: String) -> [Character: Int] {
    var table = [Character: Int]()
    let lastCharacterIndex = pattern.characters.count - 1
    for (index, character) in pattern.characters.enumerate() {
        table[character] = lastCharacterIndex - index
    }
    return table
}

private func goodSuffixRuleTableForPattern(pattern: String) -> [Character: Int] {
    // TODO: Implement
    return [Character: Int]()
}

public struct BoyerMoorePattern {
    public let string: String
    private let characterCount: Int
    private let badCharacterRuleTable: [Character: Int]
    private let goodSuffixRuleTable: [Character: Int]
    
    public init(string: String) {
        self.string = string
        self.characterCount = string.characters.count
        self.badCharacterRuleTable = badCharacterRuleTableForPattern(string)
        self.goodSuffixRuleTable = goodSuffixRuleTableForPattern(string)
    }
    
    internal func badCharacterRuleShift(character: Character) -> Int {
        if let index = self.badCharacterRuleTable[character] {
            return index
        }
        return self.characterCount
    }
    
    internal func goodSuffixRuleShift(character: Character) -> Int {
        // TODO: Implement
        return 0
    }
}

public func boyerMooreStringSearch(pattern: BoyerMoorePattern, document: String) -> [Range<Int>] {
    if pattern.string.characters.count < 1 || document.characters.count < 1 {
        return []
    }
    
    if pattern.string.characters.count > document.characters.count {
        return []
    }
    
    var ranges = [Range<Int>]()
    var currentDocumentIndex = document.startIndex
    let patternCharacterCount = pattern.characterCount
    let endIndex = document.endIndex.advancedBy(-patternCharacterCount)
    
    while true {
        var shift = 1
        var match = true
        
        for index in (patternCharacterCount - 1).stride(to: 0, by: -1) {
            let documentIndex = currentDocumentIndex.advancedBy(index)
            let patternIndex = pattern.string.startIndex.advancedBy(index)
            
            let documentCharacter = document[documentIndex]
            let patternCharacter = pattern.string[patternIndex]
            
            if documentCharacter != patternCharacter {
                let badCharacterShift = pattern.badCharacterRuleShift(documentCharacter)
                let goodSuffixShift = pattern.goodSuffixRuleShift(documentCharacter)
                shift = max(max(badCharacterShift, goodSuffixShift), shift)
                match = false
                break
            }
        }
        
        if match == true {
            let start = document.startIndex.distanceTo(currentDocumentIndex)
            let end = document.startIndex.distanceTo(currentDocumentIndex.advancedBy(patternCharacterCount))
            let range = start..<end
            ranges.append(range)
        }
        
        if currentDocumentIndex == endIndex {
            break
        }
        
        currentDocumentIndex = currentDocumentIndex.advancedBy(shift, limit: endIndex)
    }
    
    return ranges
}
