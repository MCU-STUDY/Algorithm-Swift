//
//  boj_2178.swift
//  algorithm
//
//  Created by 황찬미 on 2023/08/30.
//
//  미로 탐색
//  https://www.acmicpc.net/problem/2178

let input = readLine()!.split(separator: " ").map{Int($0)!}
let N = input[0]
let M = input[1]

var graph = Array(repeating: Array(repeating: 0, count: M), count: N)
var visited = Array(repeating: Array(repeating: false, count: M), count: N)

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

for i in 0..<N {
    let input = readLine()!.map{Int(String($0))!}
    graph[i] = input
}

var queue = [(y: Int, x: Int, count: Int)]()
var index = 0
var minResult = Int.max

func bfs() {
    // 시작 위치 포함
    queue.append((y: 0, x: 0, count: 1))
    visited[0][0] = true
    
    while queue.count > index {
        let (nowY, nowX, nowCount) = queue[index]
        index += 1
        
        for i in 0..<4 {
            let ny = dy[i] + nowY
            let nx = dx[i] + nowX
            
            if ny == N-1 && nx == M-1 {
                // 도착 위치도 포함
                minResult = min(minResult, nowCount+1)
                break
            }
            
            // 인덱스 에러...
            if 0 <= ny && ny < N && 0 <= nx && nx < M && !visited[ny][nx] && graph[ny][nx] == 1 {
                visited[ny][nx] = true
                queue.append((y: ny, x: nx, count: nowCount+1))
            }
        }
    }
}

bfs()

print(minResult)

// 메모리 : 69804 KB, 시간 : 16 ms
