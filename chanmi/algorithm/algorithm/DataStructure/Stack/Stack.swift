//
//  Stack.swift
//  algorithm
//
//  Created by 황찬미 on 2023/08/03.
//

import Foundation

struct Stack<T> {
    private var stack: [T] = []
    
    public var count: Int {
        stack.count
    }
    
    public var isEmpty: Bool {
        stack.isEmpty
    }
    
    public var top: T? {
        stack.last
    }
    
    public mutating func push(_ element: T) {
        stack.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> T? {
        stack.popLast()
    }
}

var stack = Stack<Int>()
stack.push(5)
stack.push(6)
stack.push(7)
stack.push(8)

stack.pop()     // 8
stack.top       // 7
stack.isEmpty   // false
stack.count     // 3

print(stack)    // [5, 6, 5]
