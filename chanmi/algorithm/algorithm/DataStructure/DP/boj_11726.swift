//
//  boj_11726.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/14.
//
//  2×n 타일링
//  https://www.acmicpc.net/status?user_id=gkfn980&problem_id=11726&from_mine=1

import Foundation

var input = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1001)

dp[1] = 1
dp[2] = 2
dp[3] = 3

if input > 3 {
    for i in 4...input {
        dp[i] = (dp[i-2] + dp[i-1]) % 10007
    }
}

print(dp[input])

// 메모리 : 79508 KB, 시간 : 12 ms
