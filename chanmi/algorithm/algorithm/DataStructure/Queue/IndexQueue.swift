//
//  IndexQueue.swift
//  algorithm
//
//  Created by 황찬미 on 2023/08/04.
//

import Foundation

struct IndexQueue<T> {
    private var index = 0
    private var queue: [T] = []
    
    public var count: Int {
        queue.count-index
    }
    
    public var isEmpty: Bool {
        queue.count == index
    }
    
    public var front: T? {
        index < queue.count ? queue[index] : nil
    }
    
    public var last: T? {
        index < queue.count ? queue[index] : nil
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    /// O(1)
    /// deuque 메서드가 실행될 때, 맨 앞의 데이터가 제거되는 것이 아닌,
    /// 0부터 시작하는 index 값을 증가시키면서 인덱스가 가리키는 값을 리턴한다.
    /// queue의 개수보다 index의 값이 더 클 경우, queue가 비어 있는 것이기 때문에 nil 리턴.
    @discardableResult
    public mutating func dequeue() -> T? {
        if index < queue.count {
            let now = queue[index]
            index += 1
            return now
        } else {
            return nil
        }
    }
}

