//
//  LIS(가장 긴 증가하는 부분 수열).swift
//  algo-swift-MCU
//  https://www.acmicpc.net/problem/11053
//  Created by 김민재 on 11/12/23.
//

import Foundation

func solution() {
    let n = Int(readLine()!)!

    if n == 1 {
        print(1)
        exit(0)
    }

    var nums = readLine()!.split(separator: " ").map { Int($0)! }

    var dp = Array(repeating: 1, count: n)

    for i in 1..<n {
        for j in 0..<i {
            if nums[j] < nums[i] {
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
    }

    print(dp.max()!)
}

