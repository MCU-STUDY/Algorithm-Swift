//
//  백준 다리놓기.swift
//  DP
//
//  Created by uiskim on 2023/10/08.
//

import Foundation

func solution(m: Int, n: Int) -> Int {
    var dp = Array(repeating: Array(repeating: 0, count: 31), count: 31)
    dp[0][0] = 1
    
    /// 첫번째 array를 선택해서
    for i in 1...m {
        /// 쭉 돈다
        for j in 1...i {
            dp[i][0] = 1
            dp[i][j] = dp[i-1][j] + dp[i-1][j-1]
        }
    }
    return dp[m][n]
}

let loop = Int(readLine()!)!

for _ in 0..<loop {
    let commands = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = commands[0]
    let m = commands[1]
    print(solution(m: m, n: n))
}
