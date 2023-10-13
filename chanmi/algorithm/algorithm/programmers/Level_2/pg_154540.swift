//
//  pg_154540.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/13.
//
//  무인도 여행
//  https://school.programmers.co.kr/learn/courses/30/lessons/154540

import Foundation

func solution(_ maps:[String]) -> [Int] {
    var maps = maps.map{Array($0).map{String($0)}}
    
    var visited = Array(repeating: Array(repeating: false, count: maps[0].count), count: maps.count)
    
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    var result = [Int]()
    var count = 0
    
    func dfs(y: Int, x: Int) {
        for i in 0..<4 {
            let ny = dy[i] + y
            let nx = dx[i] + x
            
            if 0..<maps.count ~= ny && 0..<maps[0].count ~= nx && !visited[ny][nx] && maps[ny][nx] != "X" {
                visited[ny][nx] = true
                count += Int(maps[ny][nx])!
                dfs(y: ny, x: nx)
            }
        }
    }
    
    for i in 0..<maps.count {
        for j in 0..<maps[0].count {
            if !visited[i][j] && maps[i][j] != "X" {
                visited[i][j] = true
                count += Int(maps[i][j])!
                
                dfs(y: i, x: j)
                
                result.append(count)
                count = 0
             }
        }
    }
    
    if !result.isEmpty {
        result.sort()
    } else {
        result.append(-1)
    }

    return result
}

print(solution(["X591X","X1X5X","X231X", "1XXX1"]))
