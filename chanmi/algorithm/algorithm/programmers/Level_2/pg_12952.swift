//
//  pg_12952.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/22.
//
//  N-Queen
//  https://school.programmers.co.kr/learn/courses/30/lessons/12952

import Foundation

func solution(_ n:Int) -> Int {
    // 하나의 열에 하나의 퀸만 올라감
    
    var chess = Array(repeating: 0, count: n)
    var result = 0
    
    func checkQueen(row: Int) -> Bool {
        for i in 0..<row {
            // 같은 열이거나
            if chess[i] == chess[row] || abs(chess[row] - chess[i]) == abs(row-i) {
                return false
            }
        }
        
        return true
    }
    
    func dfs(row: Int) {
        // index 열, 요소, 행
        if row == n {
            result += 1
            return
        }
        
        for i in 0..<n {
            chess[row] = i
            
            if checkQueen(row: row) {
                dfs(row: row+1)
            }
        }
    }
    
    dfs(row: 0)
    
    return result
}

_ = solution(4)
