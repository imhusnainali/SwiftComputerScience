//
//  CountedSet.swift
//  DataStructures
//
//  Created by Rogelio Gudino on 2/5/17.
//  Copyright © 2017 Rogelio Gudino. All rights reserved.
//

public struct CountedSet<T: Hashable> {
    private var dictionary = Dictionary<T, Int>()
    
    public mutating func incrementCountForElement(element: T) -> Int {
        let updatedCount: Int
        if let currentCount = dictionary[element] {
            updatedCount = currentCount + 1
        } else {
            updatedCount = 1
        }
        dictionary[element] = updatedCount
        return updatedCount
    }
    
    public mutating func decrementCountForElement(element: T) -> Int {
        guard let currentCount = dictionary[element] else {
            return 0
        }
        let updatedCount = currentCount - 1
        if updatedCount == 0 {
            dictionary.removeValue(forKey: element)
        } else {
            dictionary[element] = updatedCount
        }
        return updatedCount
    }
    
    public func countForElement(element: T) -> Int {
        guard let currentCount = dictionary[element] else {
            return 0
        }
        return currentCount
    }
    
    public func elements() -> LazyMapCollection<[T : Int], T> {
        return dictionary.keys
    }
}
