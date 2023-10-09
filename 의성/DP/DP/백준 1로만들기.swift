//
//  백준 1로만들기.swift
//  DP
//
//  Created by uiskim on 2023/10/10.
//

import Foundation

func solution(_ n:Int) -> Int {
    var dp = Array(repeating: 0, count: n+10)
    dp[1] = 1
    dp[2] = 2
    
    if n < 3 {
        return dp[n]
    }
    
    for i in 3...n {
        dp[i] = dp[i-1] + dp[i-2]
    }
    return dp[n] % 1234567
}
