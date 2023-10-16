//
//  CircleLinkedList.swift
//  algorithm
//
//  Created by 황찬미 on 2023/08/09.
//

import Foundation

/// 필요한 것: Node, LinkedList

class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T, next: Node<T>?) {
        self.value = value
        self.next = next
    }
}

extension Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.next == rhs.next
    }
}

class CircularLinkedList<T> {
    private var head: Node<T>?
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public func append(element: T) {
        // head가 없을 경우
        if head == nil {
            head = Node(value: element, next: head)
            return
        }
        
        var currentNode = head
        
        // 마지막 노드까지 탐색
        while currentNode?.next == head {
            currentNode = currentNode?.next
        }
        
        let newNode = Node(value: element, next: head)
        currentNode?.next = newNode
    }
    
    public func removeFirst() {
        // head가 없을 경우
        if head == nil {
            return
        }
        
        var currentNode = head
        currentNode?.next = nil
        head = currentNode
    }
    
    public func removeLast() {
        // head가 없을 경우
        if head == nil {
            return
        }
        
        var currentNode = head
        
        // 마지막 노드까지 탐색
        while currentNode?.next != head {
            currentNode = currentNode?.next
        }
        
        currentNode?.next = head
    }
    
    public func disPlayListItems() {
        var current = head
        while current != nil {
            print(current?.value ?? "")
            current = current?.next
        }
    }
}

extension CircularLinkedList: Equatable {
    static func == (lhs: CircularLinkedList, rhs: CircularLinkedList) -> Bool {
        return lhs.head == rhs.head && lhs.head?.next == rhs.head?.next
    }
}

let linkedList = CircularLinkedList<Int>()
linkedList.append(element: 3)
linkedList.append(element: 4)
linkedList.append(element: 5)
linkedList.disPlayListItems()
print("😀😀😀😀😀😀😀😀😀😀")
linkedList.removeFirst()
linkedList.removeFirst()
linkedList.removeFirst()
linkedList.disPlayListItems()
print("😀😀😀😀😀😀😀😀😀😀")
linkedList.removeLast()
linkedList.removeLast()
linkedList.removeLast()
linkedList.disPlayListItems()
print("😀😀😀😀😀😀😀😀😀😀")

/*
 3
 4
 😀😀😀😀😀😀😀😀😀😀
 5
 6
 7
 8
 3
 4
 😀😀😀😀😀😀😀😀😀😀
 3
 4
 😀😀😀😀😀😀😀😀😀😀
 */

