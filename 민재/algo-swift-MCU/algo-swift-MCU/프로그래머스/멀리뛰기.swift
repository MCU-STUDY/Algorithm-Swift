//
//  멀리뛰기.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/5/23.
//

import Foundation

func solution(_ n:Int) -> Int {

    let div = 1234567
    var dp: [Int] = Array(repeating: 0, count: n + 1)
    // dp[n] = n칸을 갈 수 있는 경우의 수
    dp[0] = 1
    dp[1] = 1 // 1칸은 1가지

    if n >= 2 {
        for i in 2...n {
            // 3번째 칸일 때는
            // dp[3] = dp[2] + dp[1]
            // 어차피 2칸에서 3칸을 갈 수 있는 경우의 수는 1칸 점프해서 가는 경우 1가지
            // 1칸에서 3칸을 갈 수 있는 경우의 수도 2칸 점프에서 갈 수 있는 경우 1가지
            // 따라서 그냥 두 경우의 수를 더해주면 된다.
            dp[i] = (dp[i - 1] + dp[i - 2]) % div
        }
    }
    // n이 1이라면 dp의 길이는 2가 되기에 최대 인덱스는 1.
    // 만일 if n>=2 가 없으면
    // dp[2] = dp[1] + dp[0] 을 수행하게 될텐데 dp[2]에서 2는 최대 인덱스 1을 벗어나기 때문에
    // 런타임 에러가 터짐. 따라서 위 조건문을 추가해주어야함.

    return dp[n]
}


func solution2(_ n:Int) -> Int {

    var memo: [Int: Int] = [:] // space: 경우의 수

    var answer = 0
    let div = 1234567

    func dfs(_ space: Int) -> Int {
        if let cnt = memo[space] {
            return cnt
        }

        if space == n { return 1 }

        if space > n { return 0 }

        var cnt = 0
        cnt += dfs(space + 1)
        cnt += dfs(space + 2)
        return cnt % div
    }

    return dfs(0)
}

let ans = solution(4)
