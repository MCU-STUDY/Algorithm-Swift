//
//  boj_11724.swift
//  algorithm
//
//  Created by 황찬미 on 2023/08/24.
//
//  연결요소의 개수
//  https://www.acmicpc.net/problem/11724

let input = readLine()!.split(separator: " ").map{Int($0)!}
let node = input[0]
let branch = input[1]
var graph = Array(repeating: Array(repeating: 0, count: 0), count: node+1)
var visited = Array(repeating: false, count: node+1)

for _ in 0..<branch {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

var queue: [Int] = []
var index = 0
var result = 0

func bfs(start: Int) {
    queue.append(start)
    
    while queue.count > index {
        let nowNode = queue[index]
        index += 1
        
        for i in graph[nowNode] {
            if !visited[i] {
                visited[i] = true
                queue.append(i)
            }
        }
    }
}

for i in 1...node {
    if !visited[i] {
        bfs(start: i)
        result += 1
    }
}

print(result)

// 메모리 : 77792 KB, 시간 : 640 ms

