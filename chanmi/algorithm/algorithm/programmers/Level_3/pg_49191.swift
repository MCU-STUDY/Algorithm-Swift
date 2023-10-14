//
//  pg_49191.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/14.
//
//  순위
//  https://school.programmers.co.kr/learn/courses/30/lessons/49191

import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    
    // 이긴 사람과 진 사람의 개수가 n-1일 경우를 찾아야 됨
    
    func bfs(graph: [[Int]], now: Int) -> Int {
        var visited = Array(repeating: false, count: n+1)
        var queue = [Int]()
        
        if graph[now].isEmpty { return 0 }
        
        queue.append(now)
        var index = 0
        var count = 0
        
        while queue.count > index {
            let now = queue[index]
            print("now", now)
            index += 1
            
            for node in graph[now] {
                if !visited[node] {
                    visited[node] = true
                    queue.append(node)
                    count += 1
                }
            }
        }
        return count
    }
    
    // 이긴 사람
    var winArray = Array(repeating: [Int](), count: n+1)
    for result in results {
        winArray[result[0]].append(result[1])
    }
    
    // 진 사람
    var lostArray = Array(repeating: [Int](), count: n+1)
    for result in results {
        lostArray[result[1]].append(result[0])
    }
    
    var resultCount = 0
    
    for i in 1...n {
        let winCount = bfs(graph: winArray, now: i)
        let lostCount = bfs(graph: lostArray, now: i)
        
        if winCount + lostCount == n-1 {
            resultCount += 1
        }
    }
    
    return resultCount
}

print(solution(5, [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]]))
