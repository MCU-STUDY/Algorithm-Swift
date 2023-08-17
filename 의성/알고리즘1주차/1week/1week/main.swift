//
//  main.swift
//  1week
//
//  Created by uiskim on 2023/08/03.
//

import Foundation

class CircularLinkedListNode {
    var next: CircularLinkedListNode?
    var prev: CircularLinkedListNode?
    var value: Int?
    
    init(next: CircularLinkedListNode? = nil, prev: CircularLinkedListNode? = nil, value: Int?) {
        self.next = next
        self.prev = prev
        self.value = value
    }
}

struct CircularLinkedList {
    var head: CircularLinkedListNode?
    var tail: CircularLinkedListNode?
    
    var result: Int = 0
    mutating func append(_ value: Int) {
        if head == nil {
            let newNode = CircularLinkedListNode(value: value)
            head = newNode
            tail = newNode
            return
        }
        
        let newNode = CircularLinkedListNode(value: value)
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
        
        tail?.next = head
        head?.prev = tail
    }
    
    mutating func removeHead() {
        let nextHead = head?.next
        nextHead?.prev = tail
        tail?.next = nextHead
        head = nextHead
    }
    
    func lastNodeIndex() -> Int {
        var count = 0
        var currentNode = head
        while currentNode?.value != tail?.value {
            currentNode = currentNode?.next
            count += 1
        }
        return count
    }

    func findIndex(from value: Int) -> Int {
        var count = 0
        var currentNode = head
        while currentNode?.value != value {
            currentNode = currentNode?.next
            count += 1
        }
        return count
    }

    mutating func turnLeft() {
        head = head?.next
        tail = tail?.next
        result += 1
    }
    
    mutating func turnRight() {
        head = head?.prev
        tail = tail?.prev
        result += 1
    }
    
}

func solution(size: Int, values: [Int]) {
    var testCircularLinkedList = CircularLinkedList()
    for i in 1...size {
        testCircularLinkedList.append(i)
    }
    
    for value in values {
        /// O(n) -> O(1)
        let lastNodeIndex = testCircularLinkedList.lastNodeIndex()
        let indexCenter = lastNodeIndex / 2
        let valueIndex = testCircularLinkedList.findIndex(from: value)
        if indexCenter < valueIndex {
            for _ in 0..<(lastNodeIndex - valueIndex + 1) {
                testCircularLinkedList.turnRight()
            }
        } else {
            for _ in 0..<valueIndex {
                testCircularLinkedList.turnLeft()
            }
        }
        testCircularLinkedList.removeHead()
    }
    print(testCircularLinkedList.result)
}

var input = readLine()!.split(separator: " ").map{ Int($0)! }
var inputValues = readLine()!.split(separator: " ").map{ Int($0)! }
solution(size: input[0], values: inputValues)
