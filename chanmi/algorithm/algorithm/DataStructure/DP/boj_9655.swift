//
//  boj_9655.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/09.
//
//  돌 게임
//  https://www.acmicpc.net/problem/9655

import Foundation

let input = Int(readLine()!)!

var dp = Array(repeating: 0, count: 1001)
// 상근이 1, 창영이 0

dp[1] = 1
dp[2] = 0
dp[3] = 1

// 이러한 조건 없으면 input 값이 1, 2, 3일 때 indexError ...
if input >= 4 {
    for i in 4...input {
        // 둘다 상근이면
        if dp[i-1] == 1 && dp[i-3] == 1 {
            // 창영이임
            dp[i] = 0
        } else {
        // 둘다 창영이면, 상근이
            dp[i] = 1
        }
    }
}

// 0이면 창영이
dp[input] == 0 ? print("CY") : print("SK")
