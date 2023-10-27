//
//  길찾기게임.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/25/23.
//

import Foundation

final class Node {
    var value: [Int]
    var left: Node?
    var right: Node?

    init(_ value: [Int], left: Node? = nil, right: Node? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

final class BT {
    var root: Node?
    
    func insert(_ value: [Int]) {
        self.root = insertHelper(value, self.root)
    }
    
    func insertHelper(_ value: [Int], _ rt: Node?) -> Node? {
        guard let root = rt else {
            return Node(value)
        }
        let x = value[0]
        // let y = value[1]
        
        if x < root.value[0] {
            let newNode = insertHelper(value, root.left)
            root.left = newNode
        } else if x > root.value[0] {
            let newNode = insertHelper(value, root.right)
            root.right = newNode
        }
        return root
    }
    
}

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    // [x, y]
    let bstDict: [[Int]: [[Int]]] = [:]
    
    

    var nodeNum = 0
    var nodes: [[Int]] = nodeinfo.map { // [x, y, nodeNum]
        nodeNum += 1
        return $0 + [nodeNum]
    }.sorted { a, b in
              return a[1] > b[1]
    }
    
    var bt = BT()
    for node in nodes {
        bt.insert(node)
    }
    
    
    var pre: [Int] = []
    func preorder(_ root: Node?) {
        guard let root = root else { return }
        pre.append(root.value[2])
        preorder(root.left)
        preorder(root.right)
    }

    var post: [Int] = []
    func postorder(_ root: Node?) {
        guard let root = root else { return }

        postorder(root.left)
        postorder(root.right)
        post.append(root.value[2])
    }
    
    preorder(bt.root)
    postorder(bt.root)
    
    return [pre, post]
}
