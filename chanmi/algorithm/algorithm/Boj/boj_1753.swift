//
//  boj_1753.swift
//  algorithm
//
//  Created by 황찬미 on 2023/09/01.
//
//  최단경로
//  https://www.acmicpc.net/problem/1753

// 다익스트라 구현하기

import Foundation

struct Heap<T: Comparable> {
    private var heap: [T] = []

    public mutating func getParentNodeIndex(childNodeIndex: Int) -> Int {
        return childNodeIndex/2
    }
    
    public mutating func getLeftChildNodeIndex(parentNodeIndex: Int) -> Int {
        return parentNodeIndex*2
    }
    
    public mutating func getRightChildNodeIndex(parentNodeIndex: Int) -> Int {
        return parentNodeIndex*2+1
    }
    
    public mutating func insert(element: T) {
        if heap.isEmpty {
            // 0번째 index
            heap.append(element)
            // rootNode
            heap.append(element)
            
            return
        }
        
        // 가장 마지막 값으로 삽입함
        heap.append(element)
        
        var currentNodeIndex = heap.count-1
        var parentNodeIndex = getParentNodeIndex(childNodeIndex: currentNodeIndex)
        
        // 자식 노드의 값이 부모 노드보다 클 경우
        while heap[currentNodeIndex] > heap[parentNodeIndex] && parentNodeIndex != 0 {
            heap.swapAt(currentNodeIndex, parentNodeIndex)
            
            // 현재 노드, 부모 노드 index 변경
            currentNodeIndex = parentNodeIndex
            parentNodeIndex = getParentNodeIndex(childNodeIndex: currentNodeIndex)
        }
    }
    
    public mutating func pop() -> T? {
        if heap.isEmpty || heap.count == 1 {
            return nil
        }
        
        // 가장 큰 값과 마지막 값 swap
        heap.swapAt(1, heap.count-1)
        
        // 가장 큰값 삭제
        let result = heap.removeLast()
        
        // 시작 index (root)
        var currentIndex = 1
          
          while true {
              // 가장 큰 자식 노드
              var largerChildIndex = currentIndex
              let leftChildIndex = getLeftChildNodeIndex(parentNodeIndex: currentIndex)
              let rightChildIndex = getRightChildNodeIndex(parentNodeIndex: currentIndex)
              
              // 배열의 범위를 벗어나지 않고, 왼쪽 노드가 더 큰 경우
              if leftChildIndex < heap.count && heap[leftChildIndex] > heap[largerChildIndex] {
                  largerChildIndex = leftChildIndex
              }
              
              // 배열의 범위를 벗어나지 않고, 오른쪽 노드가 더 큰 경우
              if rightChildIndex < heap.count && heap[rightChildIndex] > heap[largerChildIndex] {
                  largerChildIndex = rightChildIndex
              }
              
              // 자식들보다 크거나 같은 상태
              if largerChildIndex == currentIndex {
                  break
              }
              
              heap.swapAt(currentIndex, largerChildIndex)
              currentIndex = largerChildIndex
          }
        
        return result
    }
}

let input = readLine()!.split(separator: " ").map{Int($0)!}
let node = input[0]
let branch = input[1]
let startNode = Int(readLine()!)!

// 1부터 시작하기 때문
let INF = Int.max
var graph = Array(repeating: Array(repeating: INF, count: node+1), count: node+1)

for _ in 0..<branch {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    graph[input[0]][input[1]] = input[2]
}

var priorityQueue = Heap<Int>()
var distance = Array(repeating: INF, count: node+1)

// 시작 지점에서 가중치를 계산할 때
distance[startNode] = 0
priorityQueue.insert(element: startNode)

while let currentNode = priorityQueue.pop() {
    for destNode in 0..<graph[currentNode].count {
        if graph[currentNode][destNode] == INF || graph[currentNode][destNode] == 0 { continue }

        let nowDest = distance[currentNode] + graph[currentNode][destNode]
        if nowDest < distance[destNode] {
            distance[destNode] = nowDest
            priorityQueue.insert(element: destNode)
        }
    }
}

for i in 1...node {
    distance[i] == INF ? print("INF") : print(distance[i])
}
