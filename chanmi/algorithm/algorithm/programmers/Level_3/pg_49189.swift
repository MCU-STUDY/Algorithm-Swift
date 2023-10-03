//
//  pg_49189.swift
//  algorithm
//
//  Created by 황찬미 on 2023/09/14.
//
//  가장 먼 노드
//  https://school.programmers.co.kr/learn/courses/30/lessons/49189?language=swift

import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    // 최단 경로라고 하면 다익스트라?
    // bfs로 해 봅시다
    var result = 0
    
    var visited = Array(repeating: false, count: n+1)
    var graph = Array(repeating: [Int](), count: n+1)
    
    // 그래프 연결
    for node in edge {
        graph[node[0]].append(node[1])
        graph[node[1]].append(node[0])
    }
    
    // 1번 노드로부터 가장 멀리 떨어진 노드 찾기
    
    var queue = [(Int, Int)]()
    var index = 0
    
    func bfs(now: Int) {
        queue.append((now, 0))
        visited[now] = true
        
        while index < queue.count {
            let (nowNode, count) = queue[index]
            index += 1
            
            // 1이랑 인접되어 있는 노드들
            for node in graph[nowNode] {
                if !visited[node] {
                    visited[node] = true
                    queue.append((node, count+1))
                    print(queue)
                }
            }
        }
    }
    
    bfs(now: 1)
    
    let maxCount = queue.max(by: { $0.1 < $1.1 })!.1
    
    for data in queue {
        if data.1 == maxCount {
            result += 1
        }
    }
    
    return result
}

print(solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]))
