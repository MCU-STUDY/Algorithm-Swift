//
//  백준 MaximumSubarray.swift
//  DP
//
//  Created by uiskim on 2023/10/09.
//

import Foundation

let loop = Int(readLine()!)!

func solution() -> Int {
    let elements = Int(readLine()!)!
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    var result = input[0]
    /// dp의 array를 넉넉하게 줄거면 min max에서 넉넉하게 설정한 값으로 return되지 않을지 꼭 체크해야한다
    var dp = Array(repeating: 0, count: elements+100)
    dp[0] = input[0]

    for i in 1..<input.count {
        dp[i] = max(dp[i-1] + input[i], input[i])
        result = max(result, dp[i])
    }
    return result
}

for _ in 0..<loop {
    print(solution())
}
