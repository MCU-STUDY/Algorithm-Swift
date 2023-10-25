//
//  2xN 타일링.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/14/23.
//

import Foundation

func solution(_ n: Int) -> Int {
    if n < 3 {
        return n
    }
    
    var dp = Array(repeating: 0, count: n + 1)
    dp[1] = 1
    dp[2] = 2
    
    for i in 3...n {
        dp[i] = (dp[i - 1] + dp[i - 2]) % 10007
    }
    
    return dp[n]
}


let n = Int(readLine()!)!
print(solution(n))
