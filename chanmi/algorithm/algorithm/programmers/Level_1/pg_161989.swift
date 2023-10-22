//
//  pg_161989.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/19.
//
//  덧칠하기
//  https://school.programmers.co.kr/learn/courses/30/lessons/161989

import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    
    var count = 0
    var visited = Array(repeating: true, count: n+1)
    
    for i in section {
        visited[i] = false
    }
    
    for j in 1...n {
        // 칠해야 하는 부분이라면
        if !visited[j] {
            for k in j..<j+m {
                // indexError
                if k > n { break }
                visited[k] = true
            }
            
            count += 1
        }
    }
    
    return count
}

_ = solution(8, 4, [2, 3, 6])
