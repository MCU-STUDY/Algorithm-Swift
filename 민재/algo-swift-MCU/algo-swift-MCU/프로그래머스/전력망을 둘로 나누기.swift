//
//  전력망을 둘로 나누기.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/3/23.
//

import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var graph: [[Int]] = Array(repeating: [], count: n + 1)
    var visited = Array(repeating: false, count: n + 1)

    for w in wires {
        graph[w[0]].append(w[1])
        graph[w[1]].append(w[0])
    }

    func dfs(_ start: Int) -> Int {
        var count = 0

        for v in graph[start] {
            if !visited[v] {
                visited[v] = true
                dfs(v)
                count += 1
            }
        }

        return count
    }

    var answer = Int.max

    visited[1] = true
    var count = dfs(2)
    answer = min(answer, abs(count - (n - count)))


    for i in 2...n {
        visited = Array(repeating: false, count: n + 1)
        visited[i] = true
        count = dfs(1)
        let diff = abs((n - count) - count)
        answer = min(diff, answer)
    }

    return answer
}
