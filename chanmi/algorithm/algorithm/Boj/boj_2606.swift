//
//  boj_2606.swift
//  algorithm
//
//  Created by 황찬미 on 2023/08/25.
//
//  바이러스
//  https://www.acmicpc.net/problem/2606

let computerCount = Int(readLine()!)!
let number = Int(readLine()!)!
var graph = Array(repeating: Array(repeating: 0, count: 0), count: computerCount+1)
var visited = Array(repeating: false, count: computerCount+1)
var count = 0

for _ in 0..<number {
    let num = readLine()!.split(separator: " ").map{Int($0)!}
    graph[num[0]].append(num[1])
    graph[num[1]].append(num[0])
}

func dfs(start: Int) {
    visited[start] = true
    
    for node in graph[start] {
        if !visited[node] {
            visited[node] = true
            dfs(start: node)
            count += 1
        }
    }
}

bfs(start: 1)

print(count)

// 메모리 : 69108 KB, 시간 : 8 ms
