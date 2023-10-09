//
//  백준 1,2,3 더하기.swift
//  DP
//
//  Created by uiskim on 2023/10/10.
//

import Foundation

let loop = Int(readLine()!)!

func solution(_ input: Int) -> Int {
    var dp = Array(repeating: 0, count: input+10)
    dp[0] = 1
    dp[1] = 1
    dp[2] = 2
    
    if input < 3 {
        return dp[input]
    }
    
    for i in 3...input {
        dp[i] = dp[i-3] + dp[i-2] + dp[i-1]
    }
    
    return dp[input]
}

for _ in 0..<loop {
    let target = Int(readLine()!)!
    print(solution(target))
}
