//
//  백준 돌게임.swift
//  DP
//
//  Created by uiskim on 2023/10/08.
//

import Foundation

let numberOfStones = Int(readLine()!)!

func solution(input: Int) -> Int {
    /// dp에 들어가는건 최소수행횟수
    /// 왜 3까지 밖에 초기화를 안시켜주나
    /// 어떤 시행값에서 돌이 한개 추가되었을때 시행값이 변하는 경우는 총 두가지 밖에없다
    /// 1.추가된 돌하나를 가져가는 경우의 수가 추가되었을때
    ///  - 이전 경우의 수에서 +1을 더한 시행횟수
    /// 2.추가된 될하나가 3개를 가져갈수있는 경우의 수의 마지막돌이 되었을때(이 경우는 현재 시행에서 3번째 전 수행에서 돌이 3개가 된다고 가정하고 시행이 1번늘어난거니까)
    ///  - 3번째 전 경우의 수에서 +1을 더한 시행횟수
    /// 이전에 비해서 돌이 하나 늘었을떄 수행횟수 변화의 경우의수는 1,2번의 결과이기때문에 1,2번중에서 최소횟수가 돌이하나늘었을때의 최소 시행횟수가된다
    /// 결국은 3번 이전의 시행횟수가 있어야하기땜누에 처음 3개의 초기값을 넣어놔야 4번째 부터 1번째를 참고할수있게된다
    var dp = Array(repeating: 0, count: 1001)
    dp[1] = 1
    dp[2] = 2
    dp[3] = 1
    
    if input <= 3 {
        return dp[input]
    }

    for i in 4...numberOfStones {
        /// 4부터 5까지 for문
        dp[i] = min(dp[i-1]+1, dp[i-3]+1)
    }

    return dp[input]
}

if solution(input: numberOfStones) % 2 == 0 {
    print("CY")
} else {
    print("SK")
}
