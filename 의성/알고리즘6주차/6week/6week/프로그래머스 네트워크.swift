//
//  프로그래머스 네트워크.swift
//  6week
//
//  Created by uiskim on 2023/09/09.
//

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var isVisited = Array(repeating: false, count: n)

    var results = 0

    func dfs(start: Int) {
        isVisited[start] = true
        
        for i in 0..<n {
            if computers[start][i] == 1 && !isVisited[i] {
                dfs(start: i)
            }
        }
    }
    
    for i in 0..<n {
        if !isVisited[i] {
            /// 방문을 했다는건 새로운 시작점을 찾았다는거임
            results += 1
            dfs(start: i)

        }
    }
    return results
}
