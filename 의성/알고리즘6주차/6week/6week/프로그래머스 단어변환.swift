//
//  프로그래머스 단어변환.swift
//  6week
//
//  Created by uiskim on 2023/09/09.
//

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var isVisited = Array(repeating: false, count: words.count)
    func bfs(_ start: String, _ depth: Int) -> Int {
        var queue: [(String, Int)] = []
        queue.append((start, 0))
        var index = 0
        
        while queue.count > index {
            let value = queue[index].0
            let depth = queue[index].1
            
            if value == target {
                return depth
            }
            
            for index in 0..<words.count {
                if !isVisited[index] {
                    if canChange(value, words[index]) {
                        isVisited[index] = true
                        queue.append((words[index], depth + 1))
                    }
                }
            }
            index += 1
        }
        return 0
    }
    
    return bfs(begin, 0)
    
}

func canChange(_ lhs: String, _ rhs: String) -> Bool {
    /// 모든단어의 길이는 같음
    let lhs = lhs.map{String($0)}
    let rhs = rhs.map{String($0)}
    
    var count = 0
    
    for index in 0..<lhs.count {
        if lhs[index] != rhs[index] {
            count += 1
        }
        
        if count > 1 {
            return false
        }
        
    }
    
    return true
}
