//
//  BinarySearchTree.swift
//  algorithm
//
//  Created by 황찬미 on 2023/08/11.
//

import Foundation

final class Node<T: Comparable> {
    var data: T
    var left: Node?
    var right: Node?
    
    init(data: T, left: Node? = nil, right: Node? = nil) {
        self.data = data
    }
}

final class BinarySearchTree<T: Comparable> {
    var root: Node<T>?
    
    // insert
    public func insert(_ element: T) {
        guard let root = self.root else {
            return root = Node(data: element)
        }
        
        var currentNode = root
        
        while true {
            if currentNode.data > element {
                guard let leftNode = currentNode.left else {
                    // leftNode가 없을 경우
                    return currentNode.left = Node(data: element)
                }
                currentNode = leftNode
            } else {
                guard let rightNode = currentNode.right else {
                    // rightNode가 없을 경우
                    return currentNode.right = Node(data: element)
                }
                currentNode = rightNode
            }
        }
    }
    
    public func search(_ element: T) -> Bool {
        guard let root = self.root else {
            return false
        }
        
        var currentNode = root
        
        while true {
            if currentNode.data == element {
                return true
            }
            
            if currentNode.data > element {
                guard let leftNode = currentNode.left else {
                    return false
                }
                currentNode = leftNode
            } else {
                guard let rightNode = currentNode.right else {
                    return false
                }
                currentNode = rightNode
            }
        }
    }
    
    public func delete(_ element: T) -> Bool {
        guard let root = self.root else {
            print("root가 없습니다")
            return false
        }
        
        var parentNode = root
        var currentNode: Node? = root
        
        // nil일 때 while문 통과
        while let node = currentNode {
            if node.data == element {
                // 값을 찾음
                break
            }
            
            if node.data > element {
                // left
                currentNode = node.left
            } else {
                // right
                currentNode = node.right
            }
            parentNode = node
        }
        
        guard let deleteNode = currentNode else {
            print("찾으려는 값 없음")
            return false
        }
        
        // 자식 노드가 없는 경우
        if deleteNode.left == nil && deleteNode.right == nil {
            if parentNode.data > element {
                // left
                parentNode.left = nil
            } else {
                parentNode.right = nil
            }
            return true
        }
        
        // 자식 노드가 하나만 있는 경우
        // left만 있는 경우
        if deleteNode.left != nil && deleteNode.right == nil {
            if parentNode.data > element {
                parentNode.left = deleteNode.left
            } else {
                parentNode.right = deleteNode.right
            }
            return true
        }
        
        // right만 있는 경우
        if deleteNode.left == nil && deleteNode.right != nil {
            if parentNode.data > element {
                parentNode.left = deleteNode.left
            } else {
                parentNode.right = deleteNode.right
            }
            return true
        }
        
        // 자식 노드가 모두 있는 경우
        guard let rightNode = deleteNode.right else {
            print("rightNode가 없습니다")
            return false
        }
        
        var changeNode = rightNode
        var changeParentNode = rightNode
        
        while let node = changeNode.left {
            changeParentNode = changeNode
            changeNode = node
        }
        
        // changeNode의 자식 노드가 없는 경우
        if let rightNode = changeNode.right {
            // right 자식이 있는 경우
            changeParentNode.left = rightNode
        } else {
            // 자식이 없는 경우
            changeParentNode.left = nil
        }
        
        if parentNode.data > element {
            parentNode.left = changeNode
        } else {
            parentNode.right = changeNode
        }
        
        // 값 연결
        changeNode.left = deleteNode.left
        changeNode.right = deleteNode.right
        
        return true
    }
    
    // 전위 순회
    public func preOrder() {
        guard let node = self.root else {
            return
        }
        
        print(node.data)
        preOrder(node: node.left)
        preOrder(node: node.right)
    }
    
    // 중위 순회
    public func inOrder() {
        guard let node = self.root else {
            return
        }
        
        print(node.data)
        inOrder(node: node.left)
        inOrder(node: node.right)
    }
    
    // 후위 순회
    public func postOrder() {
        guard let node = self.root else {
            return
        }
        
        print(node.data)
        postOrder(node: node.left)
        postOrder(node: node.right)
    }
    
    func drawDiagram() {
        print(diagram(for: self.root))
    }
     
    private func diagram(for node: Node<T>?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
       guard let node = node else {
            return root + "nil\n"
        }
        if node.left == nil && node.right == nil {
            return root + "\(node.data)\n"
        }
        return diagram(for: node.right, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.data)\n"
            + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}


let BST = BinarySearchTree<Int>()
BST.insert(35)
BST.insert(10)
BST.insert(40)
BST.insert(7)
BST.insert(30)
BST.insert(25)
BST.insert(32)
BST.insert(16)
BST.insert(28)
BST.insert(34)
BST.insert(18)
 
print(BST.delete(10))
BST.preOrder()

/*
 true
 false
 true
 true
  ┌──31
 ┌──10
 │ └──8
 3
 └──2
 */

