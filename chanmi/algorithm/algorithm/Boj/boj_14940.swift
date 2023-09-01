//
//  boj_14940.swift
//  algorithm
//
//  Created by 황찬미 on 2023/08/31.
//
//  쉬운 최단 거리
//  https://www.acmicpc.net/problem/14940

let input = readLine()!.split(separator: " ").map{Int($0)!}
let N = input[0]
let M = input[1]
var graph = Array(repeating: Array(repeating: 0, count: M), count: N)
var visited = Array(repeating: Array(repeating: false, count: M), count: N)
var goal = (y: 0, x: 0)

for i in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    
    for j in 0..<M {
        graph[i] = input
        
        if input[j] == 2 {
            // 목표 지점
            goal = (y: i, x: j)
        }
    }
}

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

var queue: [(y: Int, x: Int, count: Int)] = []
var index = 0

func bfs() {
    queue.append((y: goal.y, x: goal.x, count: 0))
    graph[goal.y][goal.x] = 0
    visited[goal.y][goal.x] = true
    
    while queue.count > index {
        let (nowY, nowX, count) = queue[index]
        index += 1
        
        for i in 0..<4 {
            let ny = dy[i] + nowY
            let nx = dx[i] + nowX
            
            if 0..<N ~= ny && 0..<M ~= nx && !visited[ny][nx] && graph[ny][nx] == 1 {
                visited[ny][nx] = true
                graph[ny][nx] = count+1
                queue.append((y: ny, x: nx, count: count+1))
            }
        }
    }
}

bfs()

// 주변 그래프 목표지점까지의 거리로 바꿈
// 접근하지 못한 그래프일 경우 -1로 바꾸는 과정

for i in 0..<N {
    for j in 0..<M {
        if graph[i][j] == 1 && !visited[i][j] {
            graph[i][j] = -1
        }
    }
}

for i in 0..<N {
    print(graph[i].map{String($0)}.joined(separator: " "))
}

// 메모리 : 80700 KB, 시간 : 144 ms

