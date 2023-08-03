//
//  Queue.swift
//  algorithm
//
//  Created by 황찬미 on 2023/08/03.
//

import Foundation

struct Queue<T> {
    private var queue: [T] = []
    
    public var count: Int {
        queue.count
    }
    
    public var isEmpty: Bool {
        queue.isEmpty
    }
    
    public var front: T? {
        queue.first
    }
    
    public var last: T? {
        queue.last
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    /// O(n)
    @discardableResult
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
}
