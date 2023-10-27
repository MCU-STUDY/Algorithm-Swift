//
//  N-Queen.swift
//  algo-swift-MCU
//https://school.programmers.co.kr/learn/courses/30/lessons/12952
//  Created by 김민재 on 10/25/23.
//


import Foundation

func solution(_ n:Int) -> Int {
    
    var rows: [Int] = Array(repeating: 0, count: n) // row
    // [0, 3, 1, 2]면 첫번째 행은 0번 col, 두번째 행은 3번 col 이런 뜻.
    
    var answer = 0
    
    func dfs(_ start: Int) {
        // print("start = ", start)
        // print(rows)
        if start == n { // 아예 row밖을 넘어간 경우가 row에 다 놓았다는 뜻이므로
            answer += 1
            return
        }
        
        
        for j in 0..<n { // col을 돌면서 가능한지 확인
            
            var flag = true
            for i in 0..<start {
                if rows[i] == j || (abs(start - i) == abs(rows[i] - j)) {
                    flag = false
                    break
                }
            }
            
            if flag {
                rows[start] = j
                dfs(start+1)
                rows[start] = -1
            }
        }
    }
    
    dfs(0)
    
    
    return answer
}
