//
//  프로그래머스 가장 먼 노드.swift
//  7week
//
//  Created by uiskim on 2023/09/19.
//

import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    
    var graph: [[Int]] = Array(repeating: [], count: n+1)
    for i in edge {
        graph[i[0]].append(i[1])
        graph[i[1]].append(i[0])
    }
    
    var distancesCount: [Int] = Array(repeating: 0, count: n+1)
    
    func bfs(start: Int) {
        var isVisited = Array(repeating: false, count: n+1)
        var queue = [(start, 0)]
        var index = 0
        
        isVisited[start] = true
        
        while queue.count > index {
            let value = queue[index].0
            let depth = queue[index].1
            
            for element in graph[value] {
                if !isVisited[element] {
                    isVisited[element] = true
                    distancesCount[element] = depth+1
                    queue.append((element, depth+1))
                }
            }
            index += 1
        }
    }
    
    bfs(start: 1)
    
    let max = distancesCount.max()!
    return distancesCount.filter{$0==max}.count
}

