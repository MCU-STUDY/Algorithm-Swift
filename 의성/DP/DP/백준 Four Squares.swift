//
//  백준 Four Squares.swift
//  DP
//
//  Created by uiskim on 2023/10/10.
//

import Foundation

let input = Int(readLine()!)!

var dp = Array(repeating: 1234567890, count: input+10)
dp[0] = 0
for i in 1...input {
    var j = 1
    while i - j*j >= 0 {
        dp[i] = min(dp[i], dp[i-j*j]+1)
        j += 1
    }
}

print(dp[input])
