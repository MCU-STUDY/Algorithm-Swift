//
//  pg_43165.swift
//  algorithm
//
//  Created by 황찬미 on 2023/09/08.
//
//  타겟 넘버
//  https://school.programmers.co.kr/learn/courses/30/lessons/43165

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var count = 0
    
    func dfs(now: Int, depth: Int) {
        if depth == numbers.count {
            if now == target {
                count += 1
            }
            return
        } else {
            dfs(now: now+numbers[depth], depth: depth+1)
            dfs(now: now-numbers[depth], depth: depth+1)
        }
    }
    
    dfs(now: numbers[0], depth: 1)
    
    return count
}

print(solution([1, 1, 1, 1, 1], 3))
