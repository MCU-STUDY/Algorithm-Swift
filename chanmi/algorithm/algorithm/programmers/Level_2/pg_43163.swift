//
//  pg_43163.swift
//  algorithm
//
//  Created by 황찬미 on 2023/09/09.
//
//  단어 변환
//  https://school.programmers.co.kr/learn/courses/30/lessons/43163

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var visited = Array(repeating: false, count: words.count)
    var count = 0
    var result = Int.max
    
    func dfs(now: String) {
        if now == target {
            result = min(result, count)
            return
        } else {
            for i in 0..<words.count {
                // now: hot, words[i] = hom
                if !visited[i] && zip(now, words[i]).filter({ $0 != $1 }).count == 1 {
                    visited[i] = true
                    count += 1
                    dfs(now: words[i])
                    count -= 1
                    visited[i] = false
                }
            }
        }
    }
    
    if words.contains(target) {
        dfs(now: begin)
    } else {
        result = 0
    }
    
    return result
}
