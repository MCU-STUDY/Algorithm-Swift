//
//  프로그래머스 가장긴팰린드롬.swift
//  DP
//
//  Created by uiskim on 2023/10/09.
//

import Foundation

func solution(_ s:String) -> Int {
    var result = 1
    let input = s.map{String($0)}
    var dp = Array(repeating: Array(repeating: 0, count: s.count+10), count: s.count+10)
    
    if s.count == 1 {
        return 1
    }
    
    for i in 0..<s.count {
        dp[i][i] = 1
    }
    
    
    for i in 0..<s.count - 1 {
        if input[i] == input[i+1] {
            dp[i][i+1] = 1
            result = 2
        }
    }
    
    if s.count == 2 {
        return result
    }
    
    /// i는 팰린드롬인지를 체크할 문자열의 길이
    for len in 3...s.count {
        /// j는 시작점(시작점에서 길이를 더해야하기때문에 index range를 고려해서 i를 빼줘야함)
        for start in 0...s.count-len {
            let end = start + len - 1
            if input[start] == input[end] && dp[start+1][end-1] == 1 {
                dp[start][end] = 1
                result = max(result, len)
            }
        }
    }
    
    
    return result
}
