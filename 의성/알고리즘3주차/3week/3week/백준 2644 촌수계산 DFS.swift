//
//  백준 2644 촌수계산.swift
//  3week
//
//  Created by uiskim on 2023/08/25.
//

import Foundation

/// DFS
let people = Int(readLine()!)!
let family = readLine()!.split(separator: " ").map { Int($0)! }
let start = family[0]
let finish = family[1]
let loopCount = Int(readLine()!)!

var isVisited = Array(repeating: false, count: people + 1)
var graph: [[Int]] = Array(repeating: [], count: people + 1)

for _ in 0..<loopCount {
    let relationInfomation = readLine()!.split(separator: " ").map {Int(String($0))!}
    graph[relationInfomation[0]].append(relationInfomation[1])
    graph[relationInfomation[1]].append(relationInfomation[0])
}

/// 사실 촌수계산문제는 people이 100명이 최대이기때문에 DFS로 풀어도 별 상관이없다
/// dfs의 경우엔 return되는 시점을 잘못잡으면 재귀함수의 호출이 끝나고 for문이 끝나는 순간에도 함수호출이 종료될수있기때문에 유의해야한다
/// dfs로는 return을 쓰지 않는 방법을 고려해보면 좋은거같다
///
/// depth를 실시간 업데이트해주지말고 내부에서 값을 바꿔주고 끝나는 조건에 대체
var result = -1
func dfs(start: Int, depth: Int) {
    if start == finish {
        result = depth
        return
    }
    
    isVisited[start] = true
    /// for문의 다음 element로 들어오면 depth가 원래대로 들어감
    for element in graph[start] {
        if !isVisited[element] {
            isVisited[element] = true
            dfs(start: element, depth: depth+1)
        }
    }
}

dfs(start: start, depth: 0)
print(result)
