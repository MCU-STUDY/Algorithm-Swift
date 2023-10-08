//
//  백준 피보나치수5.swift
//  DP
//
//  Created by uiskim on 2023/10/08.
//

import Foundation

let command = Int(readLine()!)!

var dp = Array(repeating: 0, count: 21)
dp[0] = 0
dp[1] = 1

if command != 0 && command != 1 {
    for i in 2...command {
        dp[i] = dp[i-1] + dp[i-2]
    }
}



print(dp[command])
