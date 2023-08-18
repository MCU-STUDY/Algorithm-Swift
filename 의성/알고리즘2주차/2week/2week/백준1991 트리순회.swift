//
//  백준1991 트리순회.swift
//  2week
//
//  Created by uiskim on 2023/08/18.
//

import Foundation

struct Node {
    var leftNode: String
    var rightNode: String
}

let count = Int(readLine()!)!
var tree: [String: Node] = [:]
for _ in 0..<count {
    let command = readLine()!.split(separator: " ").map{String($0)}
    tree[command[0]] = Node(leftNode: command[1], rightNode: command[2])
}

func preorderResult(_ rootValue: String) {
    guard rootValue != "." else { return }
    print(rootValue, terminator: " ")
    preorderResult(tree[rootValue]!.leftNode)
    preorderResult(tree[rootValue]!.rightNode)
}

func inorderResult(_ rootValue: String) {
    guard rootValue != "." else { return }
    inorderResult(tree[rootValue]!.leftNode)
    print(rootValue, terminator: " ")
    inorderResult(tree[rootValue]!.rightNode)
}

func postorderResult(_ rootValue: String) {
    guard rootValue != "." else { return }
    postorderResult(tree[rootValue]!.leftNode)
    postorderResult(tree[rootValue]!.rightNode)
    print(rootValue, terminator: " ")
}

preorderResult("A")
print()
inorderResult("A")
print()
postorderResult("A")

/*
7
A B C
B D .
C E F
E . .
F . G
D . .
G . .
*/

