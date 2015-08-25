//
//  ArrayDequeTests.swift
//  ArrayDequeTests
//
//  Created by Rogelio Gudino on 7/9/15.
//  Copyright © 2015 Rogelio Gudino. All rights reserved.
//

import ArrayDeque
import XCTest

class ArrayDequeTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAddAndRemoveElements() {
        var arrayDeque = ArrayDeque<Int>()
        XCTAssert(arrayDeque.count() == 0)
        
        arrayDeque.appendElement(1)
        XCTAssert(arrayDeque.count() == 1)
        
        arrayDeque.appendElement(2)
        XCTAssert(arrayDeque.count() == 2)
        
        arrayDeque.prependElement(0)
        XCTAssert(arrayDeque.count() == 3)
        
        XCTAssert(arrayDeque[0] != .None)
        XCTAssert(arrayDeque[1] != .None)
        XCTAssert(arrayDeque[2] != .None)
        XCTAssert(arrayDeque[0]! == 0)
        XCTAssert(arrayDeque[1]! == 1)
        XCTAssert(arrayDeque[2]! == 2)
        
        XCTAssert(arrayDeque.removeFirstElement()! == 0)
        XCTAssert(arrayDeque.count() == 2)
        
        XCTAssert(arrayDeque.removeLastElement()! == 2)
        XCTAssert(arrayDeque.count() == 1)
    }
    
    func testInitializeWithArray() {
        let arrayDeque = ArrayDeque<Int>(array: [1, 2, 3])
        XCTAssert(arrayDeque.count() == 3)
        
        XCTAssert(arrayDeque[0] != .None)
        XCTAssert(arrayDeque[1] != .None)
        XCTAssert(arrayDeque[2] != .None)
        XCTAssert(arrayDeque[0]! == 1)
        XCTAssert(arrayDeque[1]! == 2)
        XCTAssert(arrayDeque[2]! == 3)
    }
    
    func testCircularPrepending() {
        var arrayDeque = ArrayDeque<Int>()
        
        arrayDeque.prependElement(0)
        XCTAssert(arrayDeque.count() == 1)
        XCTAssert(arrayDeque[0] != .None)
        XCTAssert(arrayDeque[0]! == 0)
        
        arrayDeque.prependElement(1)
        XCTAssert(arrayDeque.count() == 2)
        XCTAssert(arrayDeque[0] != .None)
        XCTAssert(arrayDeque[0]! == 1)
        
        arrayDeque.prependElement(2)
        XCTAssert(arrayDeque.count() == 3)
        XCTAssert(arrayDeque[0] != .None)
        XCTAssert(arrayDeque[0]! == 2)
        
        arrayDeque.prependElement(3)
        XCTAssert(arrayDeque.count() == 4)
        XCTAssert(arrayDeque[0] != .None)
        XCTAssert(arrayDeque[0]! == 3)
        
        arrayDeque.prependElement(4)
        XCTAssert(arrayDeque.count() == 5)
        XCTAssert(arrayDeque[0] != .None)
        XCTAssert(arrayDeque[0]! == 4)
    }
    
    func testCopy() {
        var first = ArrayDeque<Int>()
        first.appendElement(0)
        first.appendElement(1)
        
        var second = first
        XCTAssert(second.count() == 2)
        
        second.removeLastElement()
        XCTAssert(first.count() == 2)
        XCTAssert(second.count() == 1)
        XCTAssert(second[0] != .None)
        XCTAssert(second[0] == 0)
    }
    
    func testDoublePrependAndRemoveLast() {
        var arrayDeque = ArrayDeque<Int>()
        arrayDeque.prependElement(2)
        arrayDeque.prependElement(1)
        
        var element = arrayDeque.removeLastElement()
        XCTAssert(element != .None)
        XCTAssert(element! == 2)
        
        element = arrayDeque.removeLastElement()
        XCTAssert(element != .None)
        XCTAssert(element! == 1)
        
        element = arrayDeque.removeLastElement()
        XCTAssert(element == .None)
    }
    
    func testDoublePrependAndRemoveFirst() {
        var arrayDeque = ArrayDeque<Int>()
        arrayDeque.prependElement(2)
        arrayDeque.prependElement(1)
        
        var element = arrayDeque.removeFirstElement()
        XCTAssert(element != .None)
        XCTAssert(element! == 1)
        
        element = arrayDeque.removeFirstElement()
        XCTAssert(element != .None)
        XCTAssert(element! == 2)
        
        element = arrayDeque.removeFirstElement()
        XCTAssert(element == .None)
    }
    
    func testDoubleAppendAndRemoveFirst() {
        var arrayDeque = ArrayDeque<Int>()
        arrayDeque.appendElement(1)
        arrayDeque.appendElement(2)
        
        var element = arrayDeque.removeFirstElement()
        XCTAssert(element != .None)
        XCTAssert(element! == 1)
        
        element = arrayDeque.removeFirstElement()
        XCTAssert(element != .None)
        XCTAssert(element! == 2)
        
        element = arrayDeque.removeFirstElement()
        XCTAssert(element == .None)
    }
    
    func testDoubleAppendAndRemoveLast() {
        var arrayDeque = ArrayDeque<Int>()
        arrayDeque.appendElement(1)
        arrayDeque.appendElement(2)
        
        var element = arrayDeque.removeLastElement()
        XCTAssert(element != .None)
        XCTAssert(element! == 2)
        
        element = arrayDeque.removeLastElement()
        XCTAssert(element != .None)
        XCTAssert(element! == 1)
        
        element = arrayDeque.removeLastElement()
        XCTAssert(element == .None)
    }
}
