//
//  무인도여행.swift
//  algo
//
//  Created by 김민재 on 10/13/23.
//

import Foundation
// X = 바다
// 1 ~ 9 = 식량
func solution(_ maps:[String]) -> [Int] {
    let dy = [1, -1, 0, 0]
    let dx = [0, 0, 1, -1]
    
    var map: [[String]] = []
    for m in maps {
        let s = Array(m).map { String($0) }
        map.append(s)
    }
    
    let n = map.count
    let m = map[0].count
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    
    func bfs(_ y: Int, _ x: Int) -> Int {
        var q = [(y, x)]
        visited[y][x] = true
        var qIdx = 0
        
        var accu: Int = Int(map[y][x])!
        while qIdx < q.count {
            let y = q[qIdx].0
            let x = q[qIdx].1
            qIdx += 1
            
            for i in 0..<4 {
                let ny = y + dy[i]
                let nx = x + dx[i]
                
                if 0..<n ~= ny && 0..<m ~= nx && !visited[ny][nx] && map[ny][nx] != "X" {
                    visited[ny][nx] = true
                    q.append((ny, nx))
                    accu += Int(map[ny][nx])!
                    map[ny][nx] = String(accu)
                }
            }
        }
        return accu
    }
    
    var answer: [Int] = []
    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] != "X" && !visited[i][j] {
                answer.append(bfs(i, j))
            }
        }
    }
    
    return answer.isEmpty ? [-1] : answer.sorted()
}

func drawBoard(_ map: [[String]]) {
    for i in 0..<map.count {
        for j in 0..<map[0].count {
            print(map[i][j], terminator: " ")
        }
        print("")
    }
}
