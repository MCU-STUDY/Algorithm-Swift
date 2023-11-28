//
//  움직이는 미로 탈출.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 11/28/23.
//



/*
 가장 왼쪽 아랫 칸에 있고, 이 캐릭터는 가장 오른쪽 윗 칸으로 이동해야 한다.
 
 1초마다 모든 벽이 아래에 있는 행으로 한 칸씩 내려가고, 가장 아래에 있어서 아래에 행이 없다면 벽이 사라지게 된다.
 
 욱제의 캐릭터는 1초에 인접한 한 칸 또는 대각선 방향으로 인접한 한 칸으로 이동하거나, 현재 위치에 서 있을 수 있다. 이동할 때는 빈 칸으로만 이동할 수 있다.
 
 1초 동안 욱제의 캐릭터가 먼저 이동하고, 그 다음 벽이 이동한다. 벽이 캐릭터가 있는 칸으로 이동하면 더 이상 캐릭터는 이동할 수 없다.
 */
import Foundation

let n = 8

var map: [[String]] = []
for _ in 0..<n {
    let input = readLine()!.map { String($0) }
    map.append(input)
}

// MARK: - 하나씩 움직이기
// (y, x, type)
var q: [(Int, Int, Int)] = [(n-1, 0, 0)] // 1. 욱제 위치 넣고
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
//visited[n-1][0] = true

for i in (0..<n).reversed() { // ⭐️ reversed, 즉 마지막 행부터 보지 않으면 #이 세로로 나열된 경우에 아래 #이 위에 벽을 지워버리는 문제가 발생함.
    for j in 0..<n {
        if map[i][j] == "#" {
            q.append((i, j, 1)) // 2. 벽 위치 넣기
        }
    }
}

let dy = [0, 1, -1, 0, 0, 1, 1, -1, -1]
let dx = [0, 0, 0, 1, -1, 1, -1, 1, -1]

func bfs() -> Int {
    
    var qIdx = 0
    while qIdx < q.count {
        let pop = q[qIdx]
        let y = pop.0
        let x = pop.1
        visited[y][x] = false
        let type = pop.2
        qIdx += 1
        
        if type == 0 {
            if y == 0 && x == n-1 { // 욱제가 목표지점에 도착했다면 return 1
                return 1
            } else if map[y][x] == "#" { // 욱제가 간 지점이 벽으로 깔린 지점이라 다른 곳 탐색해야함
                continue
            }
            
            for i in 0..<9 {
                let ny = y + dy[i]
                let nx = x + dx[i]
                
                if (0..<n) ~= ny && (0..<n) ~= nx
                    && map[ny][nx] == "."
                    && !visited[ny][nx] {
                    visited[ny][nx] = true
                    q.append((ny, nx, 0))
                }
            }
        } else {
            let ny = y + 1
            if (0..<n) ~= ny { // 벽의 다음 위치가 아직 벗어나지 않았다면
                map[y][x] = "."
                map[ny][x] = "#" // 아래로 이동시키고
                q.append((ny, x, 1)) // 큐에도 넣기
            } else { // 벽의 다음 위치가 범위를 벗어났다면
                map[y][x] = "." // 맵만 빈칸으로 바꿔놓고 사라지는 것이므로 큐에도 넣지 않음
            }
            
//            for m in map {
//                print(m)
//            }
//            print("🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥")
        }
    }
    
    return 0
}

print(bfs())

/*
....#...
....#...
........
........
........
........
........
........
 */
