//
//  boj_1991.swift
//  algorithm
//
//  Created by 황찬미 on 2023/08/18.
//
//  트리 순회
//  https://www.acmicpc.net/problem/1991

import Foundation

struct Node {
    let data: String
    let left: String
    let right: String
}

var dic: [String:(Node)] = [:]
let input = Int(readLine()!)!

for _ in 0..<input {
    let str = readLine()!.split(separator: " ").map{String($0)}
    
    dic[str[0]] = Node(data: str[0], left: str[1], right: str[2])
}

func preOrder(startNode: Node) {
    print(startNode.data, terminator: "")
    
    if startNode.left != "." {
        preOrder(startNode: dic[startNode.left]!)
    }
    
    if startNode.right != "." {
        preOrder(startNode: dic[startNode.right]!)
    }
}

func inOrder(startNode: Node) {
    // 왼쪽 노드부터
    if startNode.left != "." {
        inOrder(startNode: dic[startNode.left]!)
    }
    
    print(startNode.data, terminator: "")
    
    if startNode.right != "." {
        inOrder(startNode: dic[startNode.right]!)
    }
}

func postOrder(startNode: Node) {
    // 왼쪽 노드부터
    if startNode.left != "." {
        postOrder(startNode: dic[startNode.left]!)
    }
    
    // 그 다음 오른쪽
    if startNode.right != "." {
        postOrder(startNode: dic[startNode.right]!)
    }
    
    print(startNode.data, terminator: "")
}

preOrder(startNode: dic["A"]!)
print("")
inOrder(startNode: dic["A"]!)
print("")
postOrder(startNode: dic["A"]!)

// 메모리 : 79524 KB, 시간 : 12 ms
