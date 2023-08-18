//
//  DoublyLinkedList.swift
//  algorithm
//
//  Created by 황찬미 on 2023/08/08.
//

import Foundation

/// 필요한 것: Node, LinkedList

class Node<T> {
    var value: T
    var previous: Node<T>?
    var next: Node<T>?
    
    init(value: T, previous: Node<T>?, next: Node<T>?) {
        self.value = value
        self.previous = previous
        self.next = next
    }
}

class DoublyLinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public func append(element: T) {
        /// head가 없을 경우
        if head == nil {
            head = Node(value: element, previous: nil, next: nil)
            tail = head
            return
        }
        
        let newNode = Node(value: element, previous: tail, next: nil)
        tail?.next = newNode
        tail = newNode
    }
    
    public func removeLast() {
        if head == nil {
            return
        }
        
        /// head를 삭제하는 경우
        if head?.next == nil {
            head = nil
            tail = nil
            return
        }
        
        /// tail 삭제
        tail?.previous?.next = nil
        tail = tail?.previous
    }
    
    /// head로부터 삽입
    public func headInsertIndex(index: Int, element: T) {
        if head == nil {
            head = Node(value: element, previous: nil, next: nil)
            return
        }
        
        var currentNode = head
        
        /// head에 삽입할 경우
        if index == 0 {
            let newNode = Node(value: element, previous: nil, next: currentNode)
            currentNode?.previous = newNode
            head = newNode
            return
        }
        
        for _ in 0..<index-1 {
            if currentNode?.next == nil { break }
            currentNode = currentNode?.next
        }
        
        let newNode = Node(value: element, previous: currentNode, next: currentNode?.next)
        currentNode?.next = newNode
        currentNode?.next?.previous = newNode
        
        /// 마지막 노드일 경우 tail
        if currentNode?.next == nil {
            tail = currentNode
        }
    }
    
    /// tail로부터 삽입
    public func tailInsertIndex(index: Int, element: T) {
        if head == nil {
            head = Node(value: element, previous: nil, next: nil)
            return
        }
        
        var currentNode = tail
        
        /// tail에 삽입할 경우
        if index == 0 {
            let newNode = Node(value: element, previous: currentNode?.next, next: nil)
            currentNode?.next = newNode
            tail = newNode
            return
        }
        
        for _ in 0..<index-1 {
            if currentNode?.previous == nil { break }
            currentNode = currentNode?.previous
        }
        
        let newNode = Node(value: element, previous: currentNode, next: currentNode?.next)
        currentNode?.next = newNode
        currentNode?.next?.previous = newNode
        
        /// 마지막 노드일 경우 head
        if currentNode?.previous == nil {
            head = currentNode
        }
    }
    
    public func removeIndex(index: Int) {
        if head == nil {
            return
        }
        
        var currentNode = head
        
        if index == 0 {
            head = currentNode?.next
            return
        }
        
        for _ in 0..<index-1 {
            if currentNode?.next?.next == nil { break }
            currentNode = currentNode?.next
        }
        
        currentNode?.next = currentNode?.next?.next
    }
    
    public func disPlayListItems() {
        var current = head
        while current != nil {
            print(current?.value ?? "")
            current = current?.next
        }
    }
}

let linkedList = LinkedList<Int>()
linkedList.append(element: 5)
linkedList.append(element: 1)
linkedList.disPlayListItems()
print("😀😀😀😀😀😀😀😀😀😀")
linkedList.headInsertIndex(index: 1, element: 5)
linkedList.headInsertIndex(index: 0, element: 4)
linkedList.headInsertIndex(index: 2, element: 6)
linkedList.headInsertIndex(index: 3, element: 7)
linkedList.disPlayListItems()
print("😀😀😀😀😀😀😀😀😀😀")
linkedList.tailInsertIndex(index: 1, element: 5)
linkedList.tailInsertIndex(index: 2, element: 5)
linkedList.tailInsertIndex(index: 3, element: 5)
linkedList.disPlayListItems()
print("😀😀😀😀😀😀😀😀😀😀")

/*
 5
 1
 5
 1
 😀😀😀😀😀😀😀😀😀😀
 4
 5
 6
 7
 5
 1
 5
 1
 😀😀😀😀😀😀😀😀😀😀
 4
 6
 5
 1
 5
 1
 */

