//
//  pg_43162.swift
//  algorithm
//
//  Created by 황찬미 on 2023/09/09.
//
//  네트워크
//  https://school.programmers.co.kr/learn/courses/30/lessons/43162

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = Array(repeating: false, count: computers.count)
    var count = 0
    
    func dfs(start: Int) {
        for node in 0..<computers.count {
            if !visited[node] && computers[start][node] == 1 {
                visited[node] = true
                dfs(start: node)
            }
        }
    }
    
    for i in 0..<computers.count {
        if !visited[i] {
            visited[i] = true
            dfs(start: i)
            count += 1
        }
    }
    
    return count
}
