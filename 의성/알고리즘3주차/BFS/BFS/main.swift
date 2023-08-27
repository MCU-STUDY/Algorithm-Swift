//
//  main.swift
//  BFS
//
//  Created by uiskim on 2023/08/25.
//

import Foundation

let graph: [[Int]] = [
    [],
    [2,3],
    [1,4,5],
    [1,6],
    [2],
    [2],
    [3]
]

func bfs(graph: [[Int]], start: Int) -> [Int] {
    var visitedQueue: [Int] = []
//    var willVisitedQueue: [Int] = [start]
    var willVisitedQueue = Queue()
    willVisitedQueue.enqueue(start)
    
    while !willVisitedQueue.queue.isEmpty {
        /// removeFirst하는 queue는 array가 아니라 queue로 구현해주는게 좋다
        //let node = willVisitedQueue.removeFirst()
        /// 문제가 항상 queue에는 nil이 하나는 들어있기때문에 isEmpty가 항상 false임
        /// 그러면 node가 nil이 되기때문에 항상 return으로 빠짐
        guard let node = willVisitedQueue.dequeue() else { return visitedQueue }
        if visitedQueue.contains(node) {
            continue
        }
        visitedQueue.append(node)
        /// visitedQueue에 append된 노드에서 연결된 노드들을 willVisitedQueue에 넣어준다
        willVisitedQueue.queue += graph[node]
    }
    return visitedQueue
}

print(bfs(graph: graph, start: 1))

struct Queue {
    var queue: [Int?] = []
    var head = 0
    
    mutating func enqueue(_ element: Int) {
        queue.append(element)
    }
    
    mutating func dequeue() -> Int? {
        guard head < queue.count else { return nil }
        let element = queue[head]
        queue[head] = nil
        head += 1
        return element
    }
}
