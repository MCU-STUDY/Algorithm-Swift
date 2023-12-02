//
//  배달.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 12/1/23.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var map: [[String]] = []

for _ in 0..<n {
    let input = Array(readLine()!).map { String($0) }
    map.append(input)
}

let dy = [1, -1, 0, 0]
let dx = [0, 0, 1, -1]

/*
 같은 방향으로 두 번 연속으로 이동할 수 없다
 */

// 아래, 위, 오른쪽, 왼쪽

var visited = Array(repeating: Array(repeating: Array(repeating: Array(repeating: Array(repeating: false, count: 2), count: 2), count: 5), count: m), count: n)
// [n][m][4][2][2]
// [y][x][방향][C방문여부][D방문여부]

func bfs(_ y: Int, _ x: Int) -> Int {
    // (y, x, time, dir, isCVisit, isDVisit)
    // 0~3
    // 4: 제자리에서 시작
    var q = [(y, x, 0, 4, 0, 0)]
    var qIdx = 0
    visited[y][x][4][0][0] = true
    
    while qIdx < q.count {
        let pop = q[qIdx]
        let y = pop.0
        let x = pop.1
        let currTime = pop.2
        let beforeDirection = pop.3
        var isCVisit = pop.4
        var isDVisit = pop.5
        qIdx += 1
        
        if isCVisit == 1 && isDVisit == 1 {
            return currTime
        }
        
        for i in 0..<4 {
            if i == beforeDirection { continue }
            
            let ny = y + dy[i]
            let nx = x + dx[i]
            var nc = isCVisit
            var nd = isDVisit
            
            if (0..<n) ~= ny && (0..<m) ~= nx
                && !visited[ny][nx][i][isCVisit][isDVisit]
                && map[ny][nx] != "#" {
                
                if map[ny][nx] == "C" {
                    nc = 1
                } else if map[ny][nx] == "D" {
                    nd = 1
                }
                visited[ny][nx][i][nc][nd] = true
                
                q.append((ny, nx, currTime + 1, i, nc, nd))
            }
        }
    }
    
    return -1
}


var startY = 0
var startX = 0

var cIdx = 0
for i in 0..<n {
    for j in 0..<m {
        if map[i][j] == "S" {
            startY = i
            startX = j
        } else if map[i][j] == "C" {
            cIdx += 1
            if cIdx == 2 {
                map[i][j] = "D"
            }
        }
    }
}

print(bfs(startY, startX))
