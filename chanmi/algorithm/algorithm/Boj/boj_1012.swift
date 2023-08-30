//
//  boj_1012.swift
//  algorithm
//
//  Created by 황찬미 on 2023/08/24.
//
//  유기농 배추
//  https://www.acmicpc.net/problem/1012

import Foundation

let testCase = Int(readLine()!)!

for i_ in 0..<testCase {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let M = input[0]
    let N = input[1]
    let baechuCount = input[2]
    var count = 0
    
    var graph = Array(repeating: Array(repeating: 0, count: M), count: N)
    var visited = Array(repeating: Array(repeating: false, count: M), count: N)
    
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    // 배추 심는 중
    for _ in 0..<baechuCount {
        let baechu = readLine()!.split(separator: " ").map{Int($0)!}
        graph[baechu[1]][baechu[0]] = 1
    }
    
    for i in 0..<N {
        for j in 0..<M {
            if !visited[i][j] && graph[i][j] == 1 {
                dfs(y: i, x: j)
                count += 1
            }
        }
    }
    
    func dfs(y: Int, x: Int) {
        for i in 0..<4 {
            let nx = dx[i] + x
            let ny = dy[i] + y
            
            if 0..<M ~= nx && 0..<N ~= ny && !visited[ny][nx] && graph[ny][nx] == 1 {
                visited[ny][nx] = true
                dfs(y: ny, x: nx)
            }
        }
    }
    
    print(count)
}

// 메모리 : 69480 KB, 시간 : 16 ms
