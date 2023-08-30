//
//  백준 1753 최단경로.swift
//  4week
//
//  Created by uiskim on 2023/08/30.
//

import Foundation

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
            isMoveDown(index: swapIndex)
        }
        
    }
    
    var isEmpty: Bool {
        return heap.count < 2
    }
    
}

struct Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.priority < rhs.priority
    }
    var node = 0
    var priority = 0
}

let commands = readLine()!.split(separator: " ").map{Int(String($0))!}
let numberOfNodes = commands[0]
let numberOfLines = commands[1]
let start = Int(readLine()!)!

var graph: [[Node]] = Array(repeating: [], count: numberOfNodes+1)
for _ in 0..<numberOfLines {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let start = input[0]
    let end = input[1]
    let weight = input[2]
    graph[start].append(Node(node: end, priority: weight))
}

var distances: [Int] = Array(repeating: Int.max, count: numberOfNodes+1)

func solution(start: Int) {
    var heap = Heap<Node>(comparer: <)
    distances[start] = 0
    heap.insert(Node(node: start, priority: 0))
    
    while !heap.isEmpty {
        guard let pop = heap.pop() else { break }
        if distances[pop.node] < pop.priority {
            continue
        }
        
        for next in graph[pop.node] {
            let distance = pop.priority + next.priority
            if distance < distances[next.node] {
                distances[next.node] = distance
                heap.insert(Node(node: next.node, priority: distance))
            }
        }
        
    }
}

solution(start: start)

distances[1...].forEach { element in
    if element == Int.max {
        print("INF")
    } else {
        print(element)
    }
}
