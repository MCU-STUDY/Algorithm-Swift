//
//  네트워크.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/3/23.
//

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = Array(repeating: false, count: n)
    var graph: [[Int]] = Array(repeating: [], count: n)
    for i in 0..<computers.count {
        for j in 0..<computers[i].count {
            if i == j { continue }
            if computers[i][j] == 1 {
                graph[i].append(j)
            }
        }
    }

    func dfs(_ start: Int) {
        for v in graph[start] {
            if !visited[v] {
                visited[v] = true
                dfs(v)
            }
        }

    }



    var answer = 0
    for i in 0..<computers.count {
        for j in 0..<computers[i].count {
            if computers[i][j] == 1 && !visited[i] {
                visited[i] = true
                dfs(i)
                answer += 1
            }
        }
    }

    return answer
}
