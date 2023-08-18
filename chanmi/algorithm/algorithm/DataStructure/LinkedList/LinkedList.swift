//
//  LinkedList.swift
//  algorithm
//
//  Created by 황찬미 on 2023/08/06.
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

class LinkedList<T> {
    private var head: Node<T>?
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public func append(element: T) {
        if head == nil {
            head = Node(value: element, next: nil)
            return
        }
        
        var currentNode = head
        
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        
        currentNode?.next = Node(value: element, next: nil)
    }
    
    public func removeLast() {
        if head == nil {
            return
        }
        
        /// head를 삭제하는 경우
        if head?.next == nil {
            head = nil
            return
        }
        
        var currentNode = head
        
        while currentNode?.next?.next != nil {
            currentNode = currentNode?.next
        }
        
        currentNode?.next = nil
    }
    
    public func insertIndex(index: Int, element: T) {
        if head == nil {
            head = Node(value: element, next: nil)
            return
        }
        
        var currentNode = head
        
        if index == 0 {
            head = Node(value: element, next: currentNode)
            return
        }
        
        for _ in 0..<index-1 {
            if currentNode?.next == nil { break }
            currentNode = currentNode?.next
        }
        
        let nextNode = currentNode?.next
        currentNode?.next = Node(value: element, next: nextNode)
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
linkedList.append(element: 5)
linkedList.append(element: 1)
linkedList.disPlayListItems()
print("😀😀😀😀😀😀😀😀😀😀")
linkedList.insertIndex(index: 1, element: 5)
linkedList.insertIndex(index: 0, element: 4)
linkedList.insertIndex(index: 2, element: 6)
linkedList.insertIndex(index: 3, element: 7)
linkedList.disPlayListItems()
print("😀😀😀😀😀😀😀😀😀😀")
linkedList.removeIndex(index: 1)
linkedList.removeIndex(index: 2)
linkedList.disPlayListItems()

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
