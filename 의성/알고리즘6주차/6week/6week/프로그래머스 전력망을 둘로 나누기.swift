//
//  프로그래머스 전력망을 둘로 나누기.swift
//  6week
//
//  Created by uiskim on 2023/09/09.
//

import Foundation

func makeGraph(_ n: Int,_ input: [[Int]]) -> [[Int]] {
    var graph: [[Int]] = Array(repeating: [], count: n + 1)
    for element in input {
        graph[element[0]].append(element[1])
        graph[element[1]].append(element[0])
    }

    return graph
}

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var result: [Int] = []
    var initWires = wires
    var wires = wires
    var count = 0
    func dfs(_ start: Int, _ graph: [[Int]]) {
        isVisited[start] = true
        count += 1
        for element in graph[start] {
            if !isVisited[element] {
                isVisited[element] = true
                dfs(element, graph)
            }
        }
    }
    
    var isVisited = Array(repeating: false, count: n + 1)
    for i in 0..<wires.count {
        isVisited = Array(repeating: false, count: n + 1)
        wires = initWires
        count = 0
        let removeLine = wires.remove(at: i)
        var loopGraph = makeGraph(n, wires)
        dfs(removeLine[0], loopGraph)
        result.append(abs(count - (n - count)))
    
    }

    return result.min()!
}


