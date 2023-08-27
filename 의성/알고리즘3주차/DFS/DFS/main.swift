//
//  main.swift
//  DFS
//
//  Created by uiskim on 2023/08/24.
//

import Foundation

var graph: [Int : [Int]] = [
    1: [2,3],
    2: [1,4,5],
    3: [1,6,7],
    4: [2],
    5: [2],
    6: [3],
    7: [3,8],
    8: [7]
]

var isVisited = Array(repeating: false, count: graph.count+1)

func dfs(start: Int) {
    isVisited[start] = true

  print(start, terminator: " ")

  for i in graph[start]! {
    if !isVisited[i] {
        dfs(start: i)
    }
  }
}

dfs(start: 1)

