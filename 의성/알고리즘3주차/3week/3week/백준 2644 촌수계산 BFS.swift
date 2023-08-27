//
//  백준 2644 촌수계산 BFS.swift
//  3week
//
//  Created by uiskim on 2023/08/27.
//

import Foundation

/// 백준 2644 촌수계산
let people = Int(readLine()!)!
let calNumbers = readLine()!.split(separator: " ").map{Int(String($0))!}
let start = calNumbers[0]
let end = calNumbers[1]
let relationCount = Int(readLine()!)!

var graph: [[Int]] = Array(repeating: [], count: people+1)
var isVisited = Array(repeating: false, count: people+1)

/// 그래프 만들어짐
for _ in 0..<relationCount {
    let relation = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[relation[0]].append(relation[1])
    graph[relation[1]].append(relation[0])
}

/// 하나를 쭉파는 dfs방식이면 틀린 경로더라도 끝 노드까지 가야하므로 bfs가 맞는 방식이라고 판단
func bfs(start: Int) -> Int {
    /// 각각의 데이터가 depth를 가지고 있어야한다
    var queue = [(start, 0)]
    var index = 0
    
    isVisited[start] = true
    
    /// queue의 갯수가 index보다 커야 실행
    while queue.count > index {
        let value = queue[index].0
        let depth = queue[index].1
        
        /// 같은 level에 있는 녀석들은 같은 depth이다
        /// 같은 level에 있는 녀석들이 전부 queue에 들어간 후 다시 while문이 실행된다는뜻은 다음 level의 첫 노드부터 탐색을 하겠다니까
        /// 그 순간 value의 값이 end와 같으면 그때의 depth값이 최단경로의 길이와 같음
        if end == value {
            return depth
        }
        
        for element in graph[value] {
            if !isVisited[element] {
                isVisited[element] = true
                queue.append((element, depth + 1))
            }
        }
        index += 1
    }
    /// while문을 다돌았다는건 결국 끝까지 다 돌았다는거니까 실패한 경우 -1을 리턴해야함
    return -1
}

print(bfs(start: start))
