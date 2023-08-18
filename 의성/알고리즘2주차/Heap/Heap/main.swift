//
//  main.swift
//  Heap
//
//  Created by uiskim on 2023/08/18.
//

import Foundation

struct MaxHeap {
    var heap: [Int] = []
    
    init() {}
    init(data: Int) {
        heap.append(data)
        heap.append(data)
    }
    
    /// 1. 데이터 넣기
    mutating func insert(_ data: Int) {
        if heap.count == 0 {
            heap.append(data)
            heap.append(data)
            return
        }
        
        heap.append(data)
        
        func isMoveUp(appendedElementIndex: Int) -> Bool {
            if appendedElementIndex <= 1 {
                return false
            }
            
            let parentIndex = appendedElementIndex/2
            return heap[parentIndex] > heap[appendedElementIndex] ? false : true
        }
        
        var insertIndex = heap.count - 1
        while isMoveUp(appendedElementIndex: insertIndex) {
            let parentIndex: Int = insertIndex / 2
            heap.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
        }
    }
    
    enum MoveDownState { case none, left, right }
    
    /// 2. 데이터뺴기(맨앞에거, pop)
    mutating func pop() -> Int? {
        if heap.count <= 1 { return nil }
        
        /// 맨위의 데이터를 따로 저장하고
        let returnData = heap[1]
        
        /// 다시 최대힙 정렬을 위한 준비를한다
        /// 마지막요소를 root index로 보내줌
        heap.swapAt(1, heap.count - 1)
        heap.removeLast()
        
        
        func isMoveDown(popedElementIndex: Int) -> MoveDownState {
            let leftChildIndex = popedElementIndex * 2
            let rightChildIndex = (popedElementIndex * 2) + 1
            
            /// 왼쪽 노드가 없는 경우, 완전이진트리이기때문에 왼쪽에 노드가없으면 오른쪽엔 당연히 없음
            if leftChildIndex >= heap.count {
                return .none
            }
            
            /// 오른쪽 노드가 없는 경우
            if rightChildIndex >= heap.count {
                return heap[popedElementIndex] < heap[leftChildIndex] ? .left : .none
            }
            
            if heap[leftChildIndex] < heap[popedElementIndex] && heap[rightChildIndex] < heap[popedElementIndex] {
                return .none
            }
            
            if heap[leftChildIndex] > heap[popedElementIndex] && heap[rightChildIndex] > heap[popedElementIndex] {
                return heap[leftChildIndex] > heap[rightChildIndex] ? .left : .right
            }
            
            return heap[leftChildIndex] > heap[rightChildIndex] ? .left : .right
        }
        
        var poppedIndex = 1
        while true {
            switch isMoveDown(popedElementIndex: poppedIndex) {
            case .none:
                return returnData
            case .left:
                let leftChildIndex = poppedIndex * 2
                heap.swapAt(poppedIndex, leftChildIndex)
                poppedIndex = leftChildIndex
            case .right:
                let rightChildIndex = (poppedIndex * 2) + 1
                heap.swapAt(poppedIndex, rightChildIndex)
                poppedIndex = rightChildIndex
                
            }
        }
    }
}


var heap = MaxHeap.init(data: 30)
heap.insert(20)
heap.insert(18)
heap.insert(9)
heap.insert(6)
heap.insert(50)

print(heap)
print("지워진 최대값(root data) == \(heap.pop()!)")
print(heap)

struct MinHeap {
    var heap: [Int] = []
    
    init() {}
    init(data: Int) {
        heap.append(data)
        heap.append(data)
    }
    
    /// 1. 데이터 넣기
    mutating func insert(_ data: Int) {
        if heap.count == 0 {
            heap.append(data)
            heap.append(data)
            return
        }
        
        heap.append(data)
        
        func isMoveUp(appendedElementIndex: Int) -> Bool {
            if appendedElementIndex <= 1 {
                return false
            }
            
            let parentIndex = appendedElementIndex/2
            return heap[parentIndex] < heap[appendedElementIndex] ? false : true
        }
        
        var insertIndex = heap.count - 1
        while isMoveUp(appendedElementIndex: insertIndex) {
            let parentIndex: Int = insertIndex / 2
            heap.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
        }
    }
    
    enum MoveDownState { case none, left, right }
    
    /// 2. 데이터뺴기(맨앞에거, pop)
    mutating func pop() -> Int? {
        if heap.count <= 1 { return nil }
        
        /// 맨위의 데이터를 따로 저장하고
        let returnData = heap[1]
        
        /// 다시 최대힙 정렬을 위한 준비를한다
        /// 마지막요소를 root index로 보내줌
        heap.swapAt(1, heap.count - 1)
        heap.removeLast()
        
        
        func isMoveDown(popedElementIndex: Int) -> MoveDownState {
            let leftChildIndex = popedElementIndex * 2
            let rightChildIndex = (popedElementIndex * 2) + 1
            
            /// 왼쪽 노드가 없는 경우, 완전이진트리이기때문에 왼쪽에 노드가없으면 오른쪽엔 당연히 없음
            if leftChildIndex >= heap.count {
                return .none
            }
            
            /// 오른쪽 노드가 없는 경우
            if rightChildIndex >= heap.count {
                return heap[popedElementIndex] > heap[leftChildIndex] ? .left : .none
            }
            
            if heap[leftChildIndex] > heap[popedElementIndex] && heap[rightChildIndex] > heap[popedElementIndex] {
                return .none
            }
            
            if heap[leftChildIndex] < heap[popedElementIndex] && heap[rightChildIndex] < heap[popedElementIndex] {
                return heap[leftChildIndex] < heap[rightChildIndex] ? .left : .right
            }
            
            return heap[leftChildIndex] < heap[rightChildIndex] ? .left : .right
        }
        
        var poppedIndex = 1
        while true {
            switch isMoveDown(popedElementIndex: poppedIndex) {
            case .none:
                return returnData
            case .left:
                let leftChildIndex = poppedIndex * 2
                heap.swapAt(poppedIndex, leftChildIndex)
                poppedIndex = leftChildIndex
            case .right:
                let rightChildIndex = (poppedIndex * 2) + 1
                heap.swapAt(poppedIndex, rightChildIndex)
                poppedIndex = rightChildIndex
                
            }
        }
    }
}

var minHeap = MinHeap.init(data: 30)
minHeap.insert(20)
minHeap.insert(18)
minHeap.insert(9)
minHeap.insert(6)
minHeap.insert(50)

print(minHeap)
print("지워진 최대값(root data) == \(minHeap.pop()!)")
print(minHeap)
