//
//  pg_87946.swift
//  algorithm
//
//  Created by 황찬미 on 2023/09/08.
//
//  피로도
//  https://school.programmers.co.kr/learn/courses/30/lessons/87946

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var k = k
    var count = 0
    var result = Int.min
    var visited = Array(repeating: false, count: dungeons.count)
    
    func bruteForce(hp: Int, count: Int) {
        // 값 갱신 조건 중요...
        if result < count {
            result = count
        }
        
        for i in 0..<dungeons.count {
            if !visited[i] && k >= dungeons[i][0] {
                visited[i] = true
                k -= dungeons[i][1]
                bruteForce(hp: k, count: count+1)
                k += dungeons[i][1]
                visited[i] = false
            }
        }
    }
    
    bruteForce(hp: k, count: 0)
    
    return result
}
