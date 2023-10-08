//
//  boj_16395.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/08.
//
//  파스칼의 삼각형
//  https://www.acmicpc.net/problem/16395

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}

var dp = Array(repeating: [Int](), count: 31)

for i in 1...30 {
    for _ in 1...i {
        dp[i].append(1)
    }
}

for i in 3...30 {
    for j in 1..<i-1 {
        dp[i][j] = dp[i-1][j] + dp[i-1][j-1]
    }
}

print(dp[input[0]][input[1]-1])
