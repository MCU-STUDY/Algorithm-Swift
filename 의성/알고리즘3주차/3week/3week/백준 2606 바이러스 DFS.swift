//
//  백준 2606 바이러스 DFS.swift
//  3week
//
//  Created by uiskim on 2023/08/27.
//

import Foundation

let numberOfComputer = Int(readLine()!)!
let count = Int(readLine()!)!
var graph: [[Int]] = Array(repeating: [], count: numberOfComputer+1)
for _ in 0..<count {
    let element = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[element[0]].append(element[1])
    graph[element[1]].append(element[0])
}
var isVisited = Array(repeating: false, count: numberOfComputer+1)
/// result를 이용한 풀이는 조금 헷갈림
/// 결국 모든 노드를 돌았다는건 돌았던 노드의 isVisited는 true라는 이야기니까 갯수세는게 훨씬 직관적
//var result = 0

/// 2. DFS풀이
func dfs(start: Int) {
    isVisited[start] = true
    
    for element in graph[start] {
        /// 재귀를 종료하는 조건
        if !isVisited[element] {
            //result += 1
            dfs(start: element)
        }
    }
}
dfs(start: 1)
print(isVisited.filter{$0 == true}.count - 1)
//print(result)
