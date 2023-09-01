//
//  백준 11724 연결요소의개수 DFS.swift
//  3week
//
//  Created by uiskim on 2023/08/31.
//

import Foundation
/// 백준 11724
/// 연결 요소의 개수
/// DFS

let commands = readLine()!.split(separator: " ").map{Int(String($0))!}
let numberOfNodes = commands[0]
let numberOfLines = commands[1]

var isVisited: [Bool] = Array(repeating: false, count: numberOfNodes + 1)
var graph: [[Int]] = Array(repeating: [], count: numberOfNodes + 1)

for _ in 0..<numberOfLines {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

var result = 0

func dfs(startIndex: Int) {
    isVisited[startIndex] = true
    
    for node in graph[startIndex] {
        if !isVisited[node] {
            dfs(startIndex: node)
        }
    }
}

for i in 1...numberOfNodes {
    if !isVisited[i] {
        dfs(startIndex: i)
        result += 1
    }
}
print(result)
