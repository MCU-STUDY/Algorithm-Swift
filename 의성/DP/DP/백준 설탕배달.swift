//
//  백준 설탕배달.swift
//  DP
//
//  Created by uiskim on 2023/10/08.
//

import Foundation

let totalWeight = Int(readLine()!)!
let INF = 1234567890

func solution(_ input: Int) -> Int {
    var dp = Array(repeating: INF, count: 5000+100)
    dp[3] = 1
    dp[5] = 1
    
    /// 최소 배달횟수가 변화한다는건 3kg나 5kg이 늘어났을 경우다
    /// 그렇기때문에 현재 무게에서 3키로빼거나 5키로뺀 경우의 수에서 1을 더해주면 최소 배달횟수가된다
    /// 따라서 차이가 5가 발생하기때문에 6부터 dp를 해야 6-5해서 첫번째친구에 접근이 가능하다
    if input >= 6 {
        for i in 6...totalWeight {
            dp[i] = min(dp[i-3]+1, dp[i-5]+1)
        }
    }

    if dp[totalWeight] >= INF {
        return -1
    } else {
        return dp[totalWeight]
    }
}
print(solution(totalWeight))
