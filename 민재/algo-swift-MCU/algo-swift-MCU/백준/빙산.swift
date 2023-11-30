//
//  빙산.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 12/1/23.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var map: [[Int]] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(input)
}

let dy = [1, -1, 0, 0]
let dx = [0, 0, 1, -1]



func bfs(_ y: Int, _ x: Int) {
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var q = [(y, x)]
    visited[y][x] = true
    var qIdx = 0
    
    var howManyShouldMelt = Array(repeating: Array(repeating: 0, count: m), count: n)
    
    while qIdx < q.count {
        let pop = q[qIdx]
        let y = pop.0
        let x = pop.1
        qIdx += 1
        
        var zeroCnt = 0
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if (0..<n) ~= ny && (0..<m) ~= nx && map[ny][nx] == 0 {
                zeroCnt += 1
            }
        }
        
        howManyShouldMelt[y][x] = max(0, map[y][x] - zeroCnt)
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if (0..<n) ~= ny && (0..<m) ~= nx && !visited[ny][nx] && map[ny][nx] != 0 {
                visited[ny][nx] = true
                q.append((ny, nx))
            }
        }
    }
    
    map = howManyShouldMelt
}

func checkIsOne(_ visited: inout [[Bool]]) -> Bool {
    var startY = -1
    var startX = -1
search: for i in 0..<n {
        for j in 0..<m {
            if map[i][j] != 0 {
                startY = i
                startX = j
                break search
            }
        }
    }
    
    if startY == -1 && startX == -1 { // 빙산이 모두 녹았다면?
        return false
    }
    
    
    var q = [(startY, startX)]
    visited[startY][startX] = true
    var qIdx = 0
    
    while qIdx < q.count {
        let pop = q[qIdx]
        let y = pop.0
        let x = pop.1
        qIdx += 1
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if (0..<n) ~= ny && (0..<m) ~= nx && !visited[ny][nx] && map[ny][nx] != 0 {
                visited[ny][nx] = true
                q.append((ny, nx))
            }
        }
    }
    return true
}

var year = 0
var stopFlag = false


search: while !stopFlag {
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var oneFlag = true
    for i in 0..<n {
        for j in 0..<m {
            if !visited[i][j] && map[i][j] != 0 {
                if !oneFlag { // false로 들어왔다는 거면 두번째 들어왔다는 뜻, 즉 연결요소가 하나가 아니다 !
                    stopFlag = true
                    break search
                }
                bfs(i, j) // map update
                // map 연결요소 확인(visited 처리)
                // 만약 연결요소가 하나라면 0이 아닌 곳들은 모두 방문처리가 되서
                // 다시 이 if문 안으로 들어올 일이 없어야함.
                
                if !checkIsOne(&visited) { // 만약 모두 녹아져서 빙산이 아예 없다면
                    print(0) // 그냥 0 출력하고 끝
                    exit(0)
                }
                oneFlag = false // 그것을 확인하기 위한 Flag값
                year += 1
            }
        }
    }
}

print(year)


/*
5 5
0 0 0 0 0
0 1 1 1 0
0 1 0 1 0
0 1 1 1 0
0 0 0 0 0
 
4 4
0 0 0 0
0 3 1 0
0 1 3 0
0 0 0 0
 */
