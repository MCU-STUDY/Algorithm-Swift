//
//  DoubleArrayQueue.swift
//  algorithm
//
//  Created by 황찬미 on 2023/08/04.
//

import Foundation

struct DoubleArrayQueue<T> {
    private var left: [T] = []
    private var right: [T] = []
    
    public var count: Int {
        left.count+right.count
    }
    
    public var isEmpty: Bool {
        left.isEmpty && right.isEmpty
    }
    
    public var front: T? {
        right.isEmpty ? left.first : right.last
    }
    
    public var last: T? {
        left.isEmpty ? right.first : left.last
    }
    
    public mutating func enqueue(_ element: T) {
        left.append(element)
    }

    /// O(1)
    /// reversed()의 시간복잡도가 O(1)이기 때문.
    @discardableResult
    public mutating func dequeue() -> T? {
        if right.isEmpty {
            right = left.reversed()
            left.removeAll()
        }
        return right.popLast()
    }
}
