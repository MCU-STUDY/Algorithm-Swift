//
//  인구 이동.swift
//  algo-swift-MCU
//  https://www.acmicpc.net/problem/16234
//  Created by 김민재 on 12/5/23.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let l = input[1]
let r = input[2]

var map: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(input)
}

let dy = [1, -1, 0, 0]
let dx = [0, 0, 1, -1]

func bfs(_ y: Int, _ x: Int, _ visited: inout [[Bool]]) -> [(Int, Int)] {
    
    visited[y][x] = true
    var q = [(y, x)]
    var qIdx = 0
    
    var union: [(Int, Int)] = [(y, x)]
    
    while qIdx < q.count {
        let pop = q[qIdx]
        let y = pop.0
        let x = pop.1
        qIdx += 1
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if (0..<n) ~= ny && (0..<n) ~= nx 
                && !visited[ny][nx]
                && (l...r) ~= abs(map[ny][nx] - map[y][x]) {
                union.append((ny, nx))
                visited[ny][nx] = true
                q.append((ny, nx))
            }
        }
    }
    return union.count == 1 ? [] : union
}

var days = 0

while true {
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var unions: [[(Int, Int)]] = []
    
    for i in 0..<n {
        for j in 0..<n {
            if !visited[i][j] {
                let union = bfs(i, j, &visited)
                unions.append(union)
            }
        }
    }
    
    var flag = false
    for union in unions {
        if union.isEmpty { continue }
        flag = true
        var totalSum = 0
        for uni in union {
            totalSum += map[uni.0][uni.1]
        }
        let population = totalSum / union.count
        for uni in union {
            map[uni.0][uni.1] = population
        }
    }
    
    if !flag {
        break
    }
    days += 1
}
print(days)
