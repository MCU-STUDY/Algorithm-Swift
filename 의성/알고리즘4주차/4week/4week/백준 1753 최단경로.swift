//
//  백준 1753 최단경로.swift
//  4week
//
//  Created by uiskim on 2023/08/30.
//

import Foundation

/// 백준 최단경로
/// 다익스트라

struct Heap<T: Comparable> {
    private var heap: [T] = []
    private var comparer: (T, T) -> Bool
    
    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }
    
    mutating func insert(_ input: T) {
        if heap.isEmpty {
            heap.append(input)
            heap.append(input)
            return
        }
        
        heap.append(input)
        isMoveUp(index: heap.count - 1)
    }
    
    private mutating func isMoveUp(index: Int) {
        var currentindex = index
        /// ✅
        while currentindex > 1 && comparer(heap[currentindex], heap[currentindex / 2]) {
            heap.swapAt(currentindex, currentindex / 2)
            currentindex /= 2
        }
    }
    
    mutating func pop() -> T? {
        if heap.count < 2 {
            return nil
        }
        heap.swapAt(1, heap.count - 1)
        let returnValue = heap.removeLast()
        isMoveDown(index: 1)
        return returnValue
    }
    
    private mutating func isMoveDown(index: Int) {
        var currentIndex = index
        let left = currentIndex * 2
        let right = currentIndex * 2 + 1
        /// ✅
        var isSwap = false
        
        if left < heap.endIndex && comparer(heap[left], heap[currentIndex]) {
            currentIndex = left
            isSwap = true
        }
        
        if right < heap.endIndex && comparer(heap[right], heap[currentIndex]) {
            currentIndex = right
            isSwap = true
        }
        
        /// ✅
        if isSwap {
            heap.swapAt(index, currentIndex)
            isMoveDown(index: currentIndex)
        }
    }
    
    var isEmpty: Bool {
        return heap.count < 2
    }
}

struct Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        lhs.weight < rhs.weight
    }
    
    var value = 0
    var weight = 0
}

let commands = readLine()!.split(separator: " ").map{Int(String($0))!}
let numberOfNodes = commands[0]
let numberOfLines = commands[1]
let start = Int(readLine()!)!

var graph: [[Node]] = Array(repeating: [], count: numberOfNodes + 1)

for _ in 0..<numberOfLines {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let start = input[0]
    let end = input[1]
    let weight = input[2]
    graph[start].append(Node(value: end, weight: weight))
}

var distances: [Int] = Array(repeating: Int.max, count: numberOfNodes + 1)

func dijkstra(start: Int) {
    /// ✅ 다익스트라는 최소힙
    var maxHeap = Heap<Node>(comparer: <)
    distances[start] = 0
    maxHeap.insert(Node(value: start, weight: 0))

    while !maxHeap.isEmpty {
        guard let popped = maxHeap.pop() else { break }
        if distances[popped.value] < popped.weight {
            continue
        }

        for nextNode in graph[popped.value] {
            let distance = nextNode.weight + popped.weight
            if distance < distances[nextNode.value] {
                distances[nextNode.value] = distance
                maxHeap.insert(Node(value: nextNode.value, weight: distance))
            }
        }
    }
}

dijkstra(start: start)

distances[1...].forEach { element in
    if element == Int.max {
        print("INF")
    } else {
        print(element)
    }
}
