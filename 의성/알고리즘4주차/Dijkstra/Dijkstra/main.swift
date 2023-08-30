//
//  main.swift
//  Dijkstra
//
//  Created by uiskim on 2023/08/30.
//

import Foundation

/// 다익스트라는 Heap이 있어야함

struct Heap<T: Comparable> {
    private var heap: [T] = []
    private var comparer: (T, T) ->  Bool
    
    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }
    
    mutating func insert(_ input: T) {
        /// 비어있다면
        if heap.isEmpty {
            heap.append(input)
            heap.append(input)
            return
        }
        /// 비어있지 않다면
        heap.append(input)
        isMoveUp(index: heap.count - 1)
        
    }
    
    private mutating func isMoveUp(index: Int) {
        var index = index
        /// 만약에 1번노드가 아니고 현재노드가 부모노드보다 ~ 하다면 반복
        while index > 1 && comparer(heap[index], heap[index/2]) {
            heap.swapAt(index, index/2)
            index /= 2
        }
    }
    
    /// removeFirst는 O(n)이기때문에
    /// removeLast를 사용하려면 1번노드랑 먼저 바꾸고나서 마지막걸 지워주면 된다
    mutating func pop() -> T? {
        if heap.count < 2 { return nil }
        heap.swapAt(1, heap.count - 1)
        /// 처음게 마지막으로 가서 지워지고 return
        let returnValue = heap.removeLast()
        isMoveDown(index: 1)
        return returnValue
    }
    
    private mutating func isMoveDown(index: Int) {
        var swapIndex = index
        let left = index * 2
        let right = index * 2 + 1
        var isSwap = false
        
        if left < heap.endIndex && comparer(heap[left], heap[swapIndex]) {
            swapIndex = left
            isSwap = true
        }
        
        if right < heap.endIndex && comparer(heap[right], heap[swapIndex]) {
            swapIndex = right
            isSwap = true
        }
        
        if isSwap {
            heap.swapAt(swapIndex, index)
            isMoveUp(index: swapIndex)
        }
        
    }
    
    var isEmpty: Bool {
        return heap.count < 2
    }
    
}

let graph: [String: [String: Int]] = [
    "A" : ["B": 9, "C" : 1, "D" : 15],
    "B" : ["E": 10],
    "C" : ["B": 5, "E" : 3],
    "D" : ["E": 10],
    "E" : ["F": 7],
    "F" : [:]
]

struct Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.priority > rhs.priority
    }
    var node = ""
    var priority = 0
}

//func dijkstra(graph: [String: [String: Int]], start: String) -> [String: Int] {
//    var distances: [String: Int] = [:]
//    var maxHeap = Heap<Node>(comparer: >)
//    maxHeap.insert(Node(node: start, priority: 0))
//
//    graph.keys.forEach { key in
//        let value = key == start ? 0 : 10000
//        distances.updateValue(value, forKey: key)
//    }
//
//    while !maxHeap.isEmpty {
//        guard let popValue = maxHeap.pop() else { break }
//        /// 더 멀리돌아갈 필요가없음
//        /// 현재저장된 거리 < 새로운경로의거리
//        if distances[popValue.node]! < popValue.priority { continue }
//
//        for (node, priority) in graph[popValue.node]! {
//            let distance = priority + popValue.priority
//            if distance < distances[node]! {
//                distances[node] = distance
//                maxHeap.insert(Node(node: node, priority: priority))
//            }
//        }
//    }
//    return distances
//}

func dijkstra(graph: [String: [String: Int]], start: String) ->  [String: Int] {
    var distances: [String: Int] = [:]
//    var priorityQueue = MaxHeap(NodePriority.init(node: start, priority: 0))
    var priorityQueue = Heap<Node>(comparer: >)
    priorityQueue.insert(Node(node: start, priority: 0))
    
    for key in graph.keys {
        let value = key == start ? 0 : 2147483647
        distances.updateValue(value, forKey: key)
    }
    
    while !priorityQueue.isEmpty {
        guard let popped = priorityQueue.pop() else { break }
        
        if distances[popped.node]! < popped.priority {
            continue
        }
        
        for (node, priority) in graph[popped.node]! {
            let distance = priority + popped.priority
            if distance < distances[node]! {
                distances[node] = distance
                priorityQueue.insert(Node.init(node: node, priority: distance))
            }
        }
    }
    return distances
}


print(dijkstra(graph: graph, start: "A"))
