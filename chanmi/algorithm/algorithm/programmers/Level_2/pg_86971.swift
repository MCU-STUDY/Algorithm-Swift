//
//  pg_86971.swift
//  algorithm
//
//  Created by 황찬미 on 2023/09/08.
//
//  전력망을 둘로 나누기
//  https://school.programmers.co.kr/learn/courses/30/lessons/86971

import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    // 0번째 비워야 해서 n+1 해야 됨.
    var graph = Array(repeating: [Int](), count: n+1)
    var visited = Array(repeating: false, count: n+1)
    var count = 0
    var result = Int.max
    
    // 그래프 연결
    for wire in wires {
        graph[wire[0]].append(wire[1])
        graph[wire[1]].append(wire[0])
    }
    
    func dfs(start: Int) {
        for node in graph[start] {
            if !visited[node] {
                visited[node] = true
                count += 1
                dfs(start: node)
            }
        }
    }
    
    // 1부터 n까지의 간선을 끊은 후, dfs 탐색
    for i in 1...n {
        if !visited[i] {
            visited[i] = true
            dfs(start: 1)
            
            result = min(result, abs((n-count)-count))
            
            // 그래프 초기화
            visited = Array(repeating: false, count: n+1)
            count = 0
        }
    }

    return result
}
