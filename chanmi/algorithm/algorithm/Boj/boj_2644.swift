//
//  boj_2644.swift
//  algorithm
//
//  Created by 황찬미 on 2023/08/24.
//
//  촌수계산
//  https://www.acmicpc.net/problem/2644

let input = Int(readLine()!)!
let person = readLine()!.split(separator: " ").map{Int($0)!}
let number = Int(readLine()!)!
var graph = Array(repeating: Array(repeating: 0, count: 0), count: input+1)
var visited = Array(repeating: false, count: input+1)

for _ in 0..<number {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

var queue = [(Int, Int)]()
var index = 0

func bfs(start: Int) {
    queue.append((start, 0))
    // 방문함
    visited[start] = true
    
    while queue.count > index {
        let node = queue[index].0
        let depth = queue[index].1
        
        index += 1
        
        if node == person[1] {
            // 찾았기 때문에
            print(depth)
            return
        }
        
        // 그래프랑 연결된 노드 탐색
        for i in graph[node] {
            // 방문하지 않았을 때
            if !visited[i] {
                visited[i] = true
                // 큐에 연결된 노드를 담고 depth를 담는다
                queue.append((i, depth+1))
            }
        }
    }
    
    // 모든 조건을 통과하지 못하고 빠져 나왔을 경우
    print(-1)
}

bfs(start: person[0])

// 메모리 : 69108 KB, 시간 : 12 ms
