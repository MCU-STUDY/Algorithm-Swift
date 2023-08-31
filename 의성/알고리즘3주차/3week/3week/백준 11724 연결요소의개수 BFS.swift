//
//  백준 11724 연결요소의개수 BFS.swift
//  3week
//
//  Created by uiskim on 2023/08/31.
//

import Foundation
/// 백준 11724
/// 연결 요소의 개수
/// BFS

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

func bfs(start: Int) {
    var queue = [start]
    var index = 0
    
    isVisited[start] = true
    
    while queue.count > index {
        let value = queue[index]
        
        for node in graph[value] {
            if !isVisited[node] {
                isVisited[node] = true
                queue.append(node)
            }
        }
        index += 1
    }
}

var result = 0

for i in 1...numberOfNodes {
    if !isVisited[i] {
        result += 1
        bfs(start: i)
    }
}

print(result)

