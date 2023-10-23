//
//  pg_42892.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/24.
//
//  길 찾기 게임
//  https://school.programmers.co.kr/learn/courses/30/lessons/42892

import Foundation

class Node {
    var index: Int
    var node: Int
    var left: Node?
    var right: Node?
        
    init(index: Int, node: Int, left: Node? = nil, right: Node? = nil) {
        self.index = index
        self.node = node
    }
}

class BinayTree {
    private var root: Node?
    
    func insert(nowNode: Node) {
        // root가 없을 경우
        if self.root == nil {
            self.root = Node(index: nowNode.index, node: nowNode.node)
            return
        }
        
        insert(nowNode: nowNode, parent: self.root!)
    }
    
    private func insert(nowNode: Node, parent: Node) {
        if parent.node < nowNode.node {
            if parent.right == nil {
                parent.right = nowNode
            } else {
                insert(nowNode: nowNode, parent: parent.right!)
            }
        } else {
            if parent.left == nil {
                parent.left = nowNode
            } else {
                insert(nowNode: nowNode, parent: parent.left!)
            }
        }
    }
    
    func preorder() -> [Int] {
        var preArray = [Int]()
        preorder(nowNode: self.root, array: &preArray)
        return preArray
    }
    
    private func preorder(nowNode: Node?, array: inout [Int]) {
        if nowNode == nil {
            return
        }
        
        array.append(nowNode!.index)
        preorder(nowNode: nowNode!.left, array: &array)
        preorder(nowNode: nowNode!.right, array: &array)
    }
    
    func postorder() -> [Int] {
        var postArray = [Int]()
        postorder(nowNode: self.root, array: &postArray)
        return postArray
    }
    
    private func postorder(nowNode: Node?, array: inout [Int]) {
        if nowNode == nil {
            return
        }
        
        postorder(nowNode: nowNode!.left, array: &array)
        postorder(nowNode: nowNode!.right, array: &array)
        array.append(nowNode!.index)
    }
}


func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    
    // [[5,3],[11,5],[13,3],[3,5],[6,1],[1,3],[8,6],[7,2],[2,2]]
    
    var preArray = [Int]()
    var postArray = [Int]()
    
    var nodeinfo = nodeinfo
    
    // index 추가
    for i in 0..<nodeinfo.count {
        nodeinfo[i].append(i+1)
    }
    
    let newNodeinfo = nodeinfo.sorted {
        return $0[1] > $1[1]
    }
    
    let tree = BinayTree()
    
    for node in newNodeinfo {
        tree.insert(nowNode: Node(index: node[2], node: node[0]))
    }
    
    return [tree.preorder(), tree.postorder()]
}

print(solution([[5,3],[11,5],[13,3],[3,5],[6,1],[1,3],[8,6],[7,2],[2,2]]))

