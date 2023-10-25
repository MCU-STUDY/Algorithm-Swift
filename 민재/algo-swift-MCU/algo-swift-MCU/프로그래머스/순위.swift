//
//  순위.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/14/23.
//

import Foundation

func solution1(_ n:Int, _ results:[[Int]]) -> Int {
    
    var resultMap = Array(repeating: Array(repeating: -2, count: n + 1), count: n + 1)
    
    for i in 1...n {
        resultMap[i][i] = 0 // 자기 자신
    }
    
    for result in results {
        let win = result[0]
        let lose = result[1]
        
        resultMap[win][lose] = 1
        resultMap[lose][win] = -1
    }
    
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                if resultMap[i][k] == 1 && resultMap[k][j] == 1 {
                    resultMap[i][j] = 1
                    resultMap[j][i] = -1
                }
            }
        }
    }
    
    var answer = 0
    for result in resultMap[1...] {
        if !result[1...].contains(-2) {
            answer += 1
        }
    }
    
    
    return answer
}

func solution2(_ n: Int, _ results: [[Int]]) -> Int {
    var tables = Array(repeating: (0,0), count: n + 1)
    var visited = Array(repeating: false, count: n + 1)
    
    var graph: [[Int]] = Array(repeating: [], count: n + 1)
    for i in 0..<results.count {
        graph[results[i][0]].append(results[i][1])
    }
    
    var winCount = 0
    func dfs(_ start: Int) {
        for v in graph[start] {
            if !visited[v] {
                visited[v] = true
                winCount += 1
                tables[v].1 += 1 // loseCnt 증가시킨것
                dfs(v)
            }
        }
    }
    
    for player in 1...n {
        dfs(player)
        tables[player].0 += winCount
        winCount = 0
        visited = Array(repeating: false, count: n + 1)
    }
    
    let answerTable = tables.filter { winCount, loseCount in
        return winCount + loseCount == n - 1
    }
    
    return answerTable.count
}

let a = solution2(5, [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]]    )
print(a)
